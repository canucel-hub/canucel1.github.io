import SwiftUI
struct ContentView: View {
    @State var h = 0
    @State var m = 0
    
    var body: some View {
        ZStack {
            
            if h < 12 {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 400, height: 400)
            } else {
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 400, height: 400)
            }
            
            Rectangle()
                .fill(Color.white)
                .frame(width: 6, height: 160)
                .rotationEffect(Angle(degrees: Double(m) * 90))
                .offset(y: -80)
            
            Rectangle()
                .fill(Color.white)
                .frame(width: 10, height: 110)
                .rotationEffect(Angle(degrees: Double(h % 12) * 30 + Double(m) * 7.5))
                .offset(y: -55)
            
            if h % 2 == 0 {
                Circle()
                    .fill(Color.red)
                    .frame(width: 40, height: 40)
            } else {
                Circle()
                    .fill(Color.green)
                    .frame(width: 40, height: 40)
            }
            
            Text("\(h % 12 == 0 ? 12 : h % 12):\(m*15) \(h < 12 ? "AM" : "PM")")
                .font(.title)
                .bold()
                .foregroundColor(.black)
                .offset(y: 220)
        }
        .frame(width: 420, height: 460)
        .onTapGesture {
            m = m + 1
            if m == 4 {
                m = 0
                h = h + 1
                if h == 24 {
                    h = 0
                }
            }
        }
    }
}
