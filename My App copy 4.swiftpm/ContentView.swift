import SwiftUI

struct ContentView: View {
    @State private var scoopCount = 0   // how many scoops we have (0–5)
    
    var body: some View {
        VStack {
            Text("🍦 Ice Cream Overflow!")
                .font(.largeTitle)
                .padding()
            
            ZStack {
                // Cone (triangle)
                Triangle()
                    .fill(.orange)
                    .frame(width: 100, height: 100)
                    .offset(y: 120)
                
                // Scoops (max 5)
                VStack(spacing: -10) {
                    if scoopCount > 0 { Circle().fill(.pink).frame(width: 80, height: 80) }
                    if scoopCount > 1 { Circle().fill(.yellow).frame(width: 80, height: 80) }
                    if scoopCount > 2 { Circle().fill(.green).frame(width: 80, height: 80) }
                    if scoopCount > 3 { Circle().fill(.blue).frame(width: 80, height: 80) }
                    if scoopCount > 4 { Circle().fill(.purple).frame(width: 80, height: 80) }
                }
                .offset(y: -40)
            }
            .padding()
            
            Text("Scoops: \(scoopCount)")
                .font(.title2)
                .padding()
            
            Button("Add Scoop") {
                scoopCount += 1
                if scoopCount > 5 {
                    print("Overflow! Resetting...")
                    scoopCount = 0
                }
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
    }
}

// The cone shape
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    ContentView()
}

