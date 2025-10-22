import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 15) {
            // spaces between each box
            ForEach(0..<3) { _ in
                            //for 3 box
                HStack(spacing: 15) {
                    ForEach(0..<3) { _ in
                                    //for 3 box
                        ZStack{
                            Rectangle()
                                .fill(Color.pink)
                            //color of the boxes
                                .frame(width: 120, height: 120)
                            //the height and the widht of the each box
                            Text("X")
                            //the x in the every box
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
