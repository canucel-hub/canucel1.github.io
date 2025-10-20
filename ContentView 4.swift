import SwiftUI

struct ContentView: View {
    var body: some View {
        ClockGame()
    }
}

struct ClockGame: View {
    @State private var level = 1
    @State private var time = 20
    @State private var playerX: CGFloat = 0
    @State private var obstacleY: CGFloat = -200
    @State private var timer: Timer?
    @State private var message = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("🐸 Frog Escape – Level \(level)")
                .font(.title)
            
            Text("⏰ Time: \(time)")
                .font(.headline)
            
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
                
                // Player
                Circle()
                    .fill(.green)
                    .frame(width: 40, height: 40)
                    .offset(x: playerX, y: 120)
                
                // Obstacle
                Rectangle()
                    .fill(.red)
                    .frame(width: 60, height: 20)
                    .offset(x: 0, y: obstacleY)
                
                // Win or lose message
                Text(message)
                    .font(.headline)
                    .foregroundColor(.blue)
                    .offset(y: -100)
            }
            
            // Controls
            HStack {
                Button("⬅️") { playerX -= 20; checkCollision() }
                Button("➡️") { playerX += 20; checkCollision() }
            }
            .font(.largeTitle)
            
            Button("▶️ Start Level") {
                startLevel()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
    // MARK: - Functions
    
    func startLevel() {
        timer?.invalidate()
        message = ""
        time = initialTime(for: level)
        obstacleY = -200
        
        // Timer updates game every 0.5s (faster for higher levels)
        let speed = max(0.2, 0.5 - Double(level) * 0.05)
        timer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { t in
            time -= 1
            obstacleY += 30 + CGFloat(level * 5)
            
            if obstacleY > 150 { obstacleY = -200 }
            
            checkCollision()
            
            if time <= 0 {
                nextLevel()
            }
        }
    }
    
    func checkCollision() {
        if abs(obstacleY - 120) < 30 && abs(playerX) < 40 {
            message = "💥 Hit! Restarting..."
            level = 1
            startLevel()
        }
    }
    
    func nextLevel() {
        timer?.invalidate()
        if level < 5 {
            level += 1
            message = "✅ Level Up!"
            startLevel()
        } else {
            message = "🎉 You Won All Levels!"
        }
    }
    
    func initialTime(for level: Int) -> Int {
        if level == 1 { return 20 }
        else if level == 2 { return 18 }
        else if level == 3 { return 16 }
        else if level == 4 { return 14 }
        else { return 8 }
    }
}

#Preview {
    ContentView()
}
