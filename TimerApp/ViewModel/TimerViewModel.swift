//
//  TimerViewModel.swift
//  TimerApp
//
//  Created by Sameer Personal on 1/5/24.
//

import Foundation

enum TimerState {
    case active
    case paused
    case resumed
    case cancelled
}

class TimerViewModel: ObservableObject {
    
    private var timer = Timer()
    private var totalTimeForCurrentSelection: Int {
        selectedMinutesAmount * 60 * 100
    }
    
        // For Progress
    @Published var milliSecondsToCompletion = 0
    @Published var progress: Float = 0.0
    @Published var completionDate = Date.now
    @Published var selectedMinutesAmount = 1
    @Published var state: TimerState = .cancelled {
        didSet {
            switch state {
                case .cancelled:
                    timer.invalidate()
                    milliSecondsToCompletion = 0
                    progress = 0
                    
                case .active:
                    startTimer()
                    milliSecondsToCompletion = totalTimeForCurrentSelection
                    progress = 1.0
                    updateCompletionDate()
                    
                case .paused:
                    timer.invalidate()
                    
                case .resumed:
                    startTimer()
                    updateCompletionDate()
            }
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] _ in
            
            guard let self else { return }
            
            self.milliSecondsToCompletion -= 1
            self.progress = Float(self.milliSecondsToCompletion) / Float(self.totalTimeForCurrentSelection)
            if self.milliSecondsToCompletion < 0 {
                self.state = .cancelled
                NotificationManager.shared.showNotification(title: "Finished", subTitle: "Woo, completed!!!")
            }
        })
    }
    
    private func updateCompletionDate() {
        completionDate = Date.now.addingTimeInterval(Double(milliSecondsToCompletion))
    }
}
