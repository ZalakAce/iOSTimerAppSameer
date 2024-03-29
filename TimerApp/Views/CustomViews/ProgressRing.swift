import SwiftUI

struct ProgressRing: View {
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 8.0)
                .opacity(0.3)
                .foregroundColor(Color("InactiveColor"))
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color("ActiveColor"))
                .rotationEffect(Angle(degrees: 270))
        }
        .animation(.linear(duration: 1.0), value: progress)
    }
}


#Preview {
    ProgressRing(progress: .constant(45))
}
