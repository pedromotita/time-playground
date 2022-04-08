import SwiftUI

struct ContentView: View {
    
    @State private var remainingTime = 15
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("\(remainingTime)")
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .font(.title)
            Spacer()
            LargeButton()
                .padding(.horizontal, 32)
                .padding(.bottom, 40)
        }
        .frame(maxHeight: .infinity)
        .background(Color.init("dark-blue"))
    }
}
