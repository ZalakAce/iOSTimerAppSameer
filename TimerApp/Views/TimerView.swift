//
//  ContentView.swift
//  TimerApp
//
//  Created by Sameer Personal on 1/5/24.
//

import SwiftUI

struct TimerView: View {
    
    @StateObject private var model = TimerViewModel()
    
    var body: some View {
        VStack {           
            // For Progress Ring
            ZStack {
                withAnimation {
                    ProgressRing(progress: $model.progress)
                }
                VStack {
                    Text(model.milliSecondsToCompletion.asTimestamp)
                        .font(.largeTitle)
                }
            }
            .frame(width: 400, height: 300)
            .padding(.all, 32)
            
            // For Buttons
            HStack {
                Button("Cancel") {
                    model.state = .cancelled
                }
                .frame(width: 70, height: 70)
                .foregroundColor(Color("InactiveColor"))
                .background(Color("InactiveColor").opacity(0.3))
                .clipShape(Circle())
                
                Spacer()
                
                switch model.state {
                    case .cancelled:
                        Button("Start") {
                            model.state = .active
                        }
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color.green)
                        .background(Color("StartColor").opacity(0.3))
                        .clipShape(Circle())
                        
                    case .paused:
                        Button("Resume") {
                            model.state = .resumed
                        }
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color("ActiveColor"))
                        .background(Color("ActiveColor").opacity(0.3))
                        .clipShape(Circle())
                        
                    case .active, .resumed:
                        Button("Pause") {
                            model.state = .paused
                        }
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color("ActiveColor"))
                        .background(Color("ActiveColor").opacity(0.3))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal, 50)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    TimerView()
}
