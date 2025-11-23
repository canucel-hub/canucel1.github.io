import SwiftUI

struct PixelPainterView: View {
    
    @State private var cells = Array(0...99)
    @State private var cellColors = Array(repeating: Color.gray, count: 100)
    @State private var inputText = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("10 × 10 Grid")
                .font(.title)
            
            HStack {
                TextField("Enter cell number (0–99)", text: $inputText)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(12)
                
                Button("Change") {
                    changeColor()
                }
            }
            .padding(.horizontal)
            
            drawGrid()
            
            Spacer()
        }
    }
    
    // Draw Grid
    func drawGrid() -> some View {
        VStack(spacing: 40) {
            ForEach(0..<10) { row in
                HStack(spacing: 40) {
                    ForEach(0..<10) { col in
                        let index = row * 10 + col
                        
                        Rectangle()
                            .fill(cellColors[index])
                            .frame(width: 30, height: 30)
                            .overlay(
                                Text("\(index)")
                                    .font(.system(size: 10))
                                    .foregroundColor(.white)
                            )
                    }
                }
            }
        }
    }
    
    // Change Color
    func changeColor() {
        if let number = Int(inputText),
           number >= 0, number < 100 {
            cellColors[number] = .red
        } else {
            print("Invalid input")
        }
    }
}

