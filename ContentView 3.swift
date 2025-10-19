import SwiftUI

struct ContentView: View {
    @State private var hour: Int = 12
    @State private var minute: Int = 0
    
   
    
    var isAM: Bool {
        return hour < 12
    }
    
    var hourAngle: Double {
        return Double(hour % 12) * 30 + Double(minute) * 0.5
    }
    
    var minuteAngle: Double {
        return Double(minute) * 6
    }
    
    var body: some View {
        let backgroundColor = isAM ? Color.yellow : Color.gray.opacity(0.2)
        
        VStack(spacing: 20) {
            Text("HOUR: \(hour % 12 == 0 ? 12 : hour % 12)")
                .font(.system(size: 24, weight: .bold))
            Text("MIN: \(minute)")
                .font(.system(size: 24, weight: .bold))
            Text(isAM ? "AM" : "PM")
                .font(.system(size: 24, weight: .bold))
            
            
            
            
            HStack {
                Button("- Hour") {
                    hour = (hour - 1 + 24) % 24
                }
                .padding()
                .foregroundColor(.white)
                
                Button("+ Hour") {
                    hour = (hour + 1) % 24
                }
                .padding()
                .foregroundColor(.white)
            }
            
            HStack {
                Button("- Minute") {
                    minute = (minute - 1 + 60) % 60
                }
                .padding()
                .foregroundColor(.white)
                
                Button("+ Minute") {
                    minute = (minute + 1) % 60
                }
                .padding()
                .foregroundColor(.white)
                
                
            }
            
            Button("skip") {
                hour = Int.random(in: 0..<24)
                minute = Int.random(in: 0..<60)
            }
            
            ZStack {
                backgroundColor
                    .ignoresSafeArea()
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 300, height: 300)
                
                
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 4, height: 120)
                    .offset(y: -60)
                    .rotationEffect(.degrees(minuteAngle))
                
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 6, height: 80)
                    .offset(y: -40)
                    .rotationEffect(.degrees(hourAngle))
                
                
                Circle()
                    .fill(Color.black)
                    .frame(width: 12, height: 12)
            }
        }
        
        Text("12").position(x: 215, y: -290)
            .foregroundColor(.blue)
            .font(.system(size: 23, weight: .bold))
        
        Text("3").position(x: 345, y: -264)
            .font(.system(size: 23, weight: .bold))
            .foregroundColor(.blue)
        
        
        Text("6").position(x: 215, y: -250)
            .font(.system(size: 23, weight: .bold))
            .foregroundColor(.blue)
        
        Text("9").position(x: 85, y: -480)
            .font(.system(size: 23, weight: .bold))
            .foregroundColor(.blue)
            .font(.system(size: 23, weight: .bold))
        
        
        
            .onTapGesture {
                minute += 1
                if minute == 60 {
                    minute = 0
                    hour = (hour + 1) % 24
                }
            }
            .animation(.easeInOut(duration: 0.2), value: hour)
            .animation(.easeInOut(duration: 0.2), value: minute)
    }
}
