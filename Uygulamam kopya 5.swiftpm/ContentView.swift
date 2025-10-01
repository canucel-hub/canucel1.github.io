import SwiftUI

struct LegoCharacter: Identifiable {
    let id = UUID()
    let number: Int      // Hangi saat rakamı ile eşleşiyor
    let emoji: String
}

struct ContentView: View {
    @State private var hour: Int = 10
    @State private var minute: Int = 15
    
    @State private var dragOffsets: [UUID: CGSize] = [:]
    @State private var placedCharacters: Set<UUID> = []
    
    @State private var showCorrect: [UUID: Bool] = [:]
    
    private let characters: [LegoCharacter] = [
        LegoCharacter(number: 12, emoji: "🧛‍♂️"),
        LegoCharacter(number: 3, emoji: "🦸‍♂️"),
        LegoCharacter(number: 6, emoji: "👨‍🚀"),
        LegoCharacter(number: 9, emoji: "🧙‍♂️")
    ]
    
    let clockRadius: CGFloat = 150
    let legoStartRadius: CGFloat = 280  // LEGO'lar dışarıda başlıyor
    
    // Sadece 3,6,9,12 rakamları
    let displayedNumbers = [12, 3, 6, 9]
    
    var hourAngle: Double {
        Double(hour % 12) * 30 + Double(minute) * 0.5
    }
    
    var minuteAngle: Double {
        Double(minute) * 6
    }
    
    var body: some View {
        GeometryReader { geo in
            let center = CGPoint(x: geo.size.width / 2, y: geo.size.height / 2)
            
            ZStack {
                Color.white.ignoresSafeArea()
                
                // Saat çemberi
                Circle()
                    .stroke(Color.blue, lineWidth: 5)
                    .frame(width: clockRadius * 2, height: clockRadius * 2)
                    .position(center)
                
                // Sadece 3,6,9,12 rakamları
                ForEach(displayedNumbers, id: \.self) { num in
                    Text("\(num)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .position(positionForHour(num, center: center, radius: clockRadius - 35))
                }
                
                // Akrep (hour hand)
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 8, height: 70)
                    .offset(y: -35)
                    .rotationEffect(.degrees(hourAngle))
                    .position(center)
                    .animation(.easeInOut(duration: 0.3), value: hourAngle)
                
                // Yelkovan (minute hand)
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 5, height: 100)
                    .offset(y: -50)
                    .rotationEffect(.degrees(minuteAngle))
                    .position(center)
                    .animation(.easeInOut(duration: 0.3), value: minuteAngle)
                
                // Orta nokta
                Circle()
                    .fill(Color.black)
                    .frame(width: 14, height: 14)
                    .position(center)
                
                // LEGO karakterleri (emoji + rakam)
                ForEach(characters) { char in
                    let startPos = positionForHour(char.number, center: center, radius: legoStartRadius)
                    let currentOffset = dragOffsets[char.id] ?? .zero
                    let snappedPosition = positionForHour(char.number, center: center, radius: clockRadius)
                    let currentPosition = placedCharacters.contains(char.id) ? snappedPosition : CGPoint(x: startPos.x + currentOffset.width, y: startPos.y + currentOffset.height)
                    
                    VStack(spacing: 5) {
                        Text(char.emoji)
                            .font(.system(size: 50))
                            .shadow(radius: 3)
                        Text("\(char.number)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        if showCorrect[char.id] == true {
                            Text("✅ Doğru!")
                                .font(.caption)
                                .foregroundColor(.green)
                                .transition(.opacity)
                        }
                    }
                    .position(currentPosition)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if !placedCharacters.contains(char.id) {
                                    dragOffsets[char.id] = value.translation
                                }
                            }
                            .onEnded { value in
                                let droppedPos = CGPoint(x: startPos.x + value.translation.width, y: startPos.y + value.translation.height)
                                let targetPos = snappedPosition
                                let distance = hypot(droppedPos.x - targetPos.x, droppedPos.y - targetPos.y)
                                
                                if distance < 40 {
                                    dragOffsets[char.id] = .zero
                                    placedCharacters.insert(char.id)
                                    withAnimation {
                                        showCorrect[char.id] = true
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        withAnimation {
                                            showCorrect[char.id] = false
                                        }
                                    }
                                } else {
                                    dragOffsets[char.id] = .zero
                                    placedCharacters.remove(char.id)
                                    withAnimation {
                                        showCorrect[char.id] = false
                                    }
                                }
                            }
                    )
                    .animation(.spring(), value: placedCharacters.contains(char.id))
                }
                
                // Alt kısımda saat metni
                VStack {
                    Spacer()
                    Text(String(format: "%02d:%02d %@", hour % 12 == 0 ? 12 : hour % 12, minute, hour < 12 ? "AM" : "PM"))
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, 40)
                }
                .frame(maxWidth: .infinity)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                minute += 1
                if minute == 60 {
                    minute = 0
                    hour = (hour + 1) % 24
                }
            }
        }
    }
    
    func positionForHour(_ hour: Int, center: CGPoint, radius: CGFloat) -> CGPoint {
        let angle = Double(hour) * 30 - 90
        let rad = angle * Double.pi / 180
        return CGPoint(x: center.x + radius * CGFloat(cos(rad)),
                       y: center.y + radius * CGFloat(sin(rad)))
    }
}
