import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject private var timer = TimerProvider()
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("\(timer.remainingTime)")
                .onReceive(timer.timerPublisher) { _ in
                    timer.uptadeRemainingTime()
                }
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .font(.title)
            Spacer()
            LargeButton {
                timer.startTimer()
            }
                .padding(.horizontal, 32)
                .padding(.bottom, 40)
        }
        .frame(maxHeight: .infinity)
    }
}
