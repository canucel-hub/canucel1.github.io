import SwiftUI

struct ContentView: View {
    @State private var hour = 0
    @State private var minute = 0
    
    var body: some View {
        VStack {
            ZStack {
               
                Text("12").position(x: 150, y: 50)
                Text("1").position(x: 210, y: 70)
                Text("2").position(x: 250, y: 120)
                Text("3").position(x: 270, y: 150)
                Text("4").position(x: 250, y: 180)
                Text("5").position(x: 210, y: 230)
                Text("6").position(x: 150, y: 250)
                Text("7").position(x: 90, y: 230)
                Text("8").position(x: 50, y: 180)
                Text("9").position(x: 30, y: 150)
                Text("10").position(x: 50, y: 120)
                Text("11").position(x: 90, y: 70)
                
                
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 4, height: 60)
                    .offset(y: -30)
                    .rotationEffect(.degrees(Double(hour) * 30))
                    .animation(.easeInOut, value: hour)
                
               
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 2, height: 90)
                    .offset(y: -45)
                    .rotationEffect(.degrees(Double(minute) * 6))
                    .animation(.easeInOut, value: minute)
                
               
                Circle()
                    .fill(Color.white)
                    .frame(width: 8, height: 8)
            }
            .frame(width: 300, height: 300)
            .onTapGesture {
                hour = (hour + 1) % 12
                minute = (minute + 5) % 60  
            }
            
            Button("Random Hour & Minute") {
                hour = Int.random(in: 0..<12)
                minute = Int.random(in: 0..<60)
            }
            .padding()
        }
    }
}

