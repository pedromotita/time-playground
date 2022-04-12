import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject private var timer = TimerProvider()
    @State private var heightChange: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.init("primary-red")
                    .ignoresSafeArea(.all, edges: .all)
                    .frame(height: (geometry.size.height)  - heightChange)
                    .frame(maxWidth: .infinity, maxHeight: geometry.size.height, alignment: .bottom)
                .onReceive(timer.timerPublisher) { _ in
                    let heightFactor = (geometry.size.height)/CGFloat(15)
                    let timeDelta = 15 - timer.remainingTime
                    withAnimation(.default) {
                        heightChange = CGFloat(timeDelta) * heightFactor
                    }
                    
                    if timer.remainingTime == 0 {
                        withAnimation(.default) {
                            heightChange = 0
                        }
                    }
                }
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
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
