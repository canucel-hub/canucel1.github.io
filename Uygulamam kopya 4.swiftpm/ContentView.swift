import SwiftUI

struct ContentView: View {
    @State private var id: Int = 0
    @State private var overflow: Bool = false
    
    let maxID = 15   // 4-bit maximum
    let powers = [8, 4, 2, 1]   // bit values
    
    // Convert decimal to 4-bit binary
    func decimalToBinary(_ number: Int) -> String {
        var n = number
        var result = ""
        for p in powers {
            if n >= p {
                result += "1"
                n -= p
            } else {
                result += "0"
            }
        }
        return result
    }
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Title
            Text("4-Bit ID Counter")
                .font(.largeTitle)
                .bold()
            
            // Decimal + Binary labels
            HStack(spacing: 40) {
                Text("Decimal: \(id)")
                Text("Binary: \(decimalToBinary(id))")
            }
            .font(.title2)
            
            // Bit boxes with labels
            HStack(spacing: 10) {
                let bits = Array(decimalToBinary(id))
                ForEach(0..<bits.count, id: \.self) { i in
                    VStack {
                        Rectangle()
                            .fill(bits[i] == "1" ? Color.green : Color.gray)
                            .frame(width: 50, height: 50)
                            .overlay(Text(String(bits[i]))
                                .foregroundColor(.white)
                                .bold())
                            .cornerRadius(8)
                        
                        // Place value labels
                        Text("\(powers[i])")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            // Buttons
            HStack(spacing: 20) {
                Button("Enroll (+1)") {
                    id += 1
                    if id > maxID {
                        id = 0
                        overflow = true
                    } else {
                        overflow = false
                    }
                }
                .buttonStyle(.borderedProminent)
                
                Button("Reset (0)") {
                    id = 0
                    overflow = false
                }
                .buttonStyle(.bordered)
            }
            
            // Extra button
            Button("Log to Console") {
                print("Current ID = \(id), Binary = \(decimalToBinary(id))")
            }
            .foregroundColor(.cyan)
            
            // Overflow warning
            if overflow {
                Text("OVERFLOW!")
                    .foregroundColor(.red)
                    .font(.headline)
            }
        }
        .padding()
    }
}
