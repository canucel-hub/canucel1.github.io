import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 15) {
            ForEach(0..<3) { _ in
                HStack(spacing: 15) {
                    ForEach(0..<3) { _ in
                        ZStack{
                            Rectangle()
                                .fill(Color.pink)
                                .frame(width: 120, height: 120)
                            Text("X")
                                .font(.largeTitle)
                                .foregroundColor(Color.green)
                        }
                    }
                }
            }
        }
        .padding()
    }
}
