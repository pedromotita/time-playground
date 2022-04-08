import SwiftUI
import Combine

struct ContentView: View {
    
    @State var remainingTime = 15
    @State var timerSubscription: Cancellable?
    
    @State var timer = Timer.TimerPublisher(interval: 1.0, runLoop: .main, mode: .common)
    
    private func instantiateTimer() {
        self.timer = Timer.TimerPublisher(interval: 1.0, runLoop: .main, mode: .common)
    }
    
    private func startTimer() {
        self.remainingTime = 15
        self.instantiateTimer()
        self.timerSubscription = timer.connect()
    }
    
    private func cancelTimer() {
        self.timerSubscription?.cancel()
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("\(remainingTime)")
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .font(.title)
            Spacer()
            LargeButton {
                self.startTimer()
            }
                .padding(.horizontal, 32)
                .padding(.bottom, 40)
        }
        .onReceive(timer) { _ in
            if remainingTime <= 1 {
                self.cancelTimer()
            } else {
                remainingTime = remainingTime - 1
            }
        }
        .frame(maxHeight: .infinity)
        .background(Color.init("dark-blue"))
    }
}
