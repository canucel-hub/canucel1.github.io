---
layout: default
title: Projects
permalink: /project
---
---

layout: default
title: Projects
permalink: /project-v5
----------------------

Here are some projects. I’ll add repos, screenshots, and write-ups.

---

## CALCULATOR IN SWIFT

[My App copy 6.swiftpm.zip](https://github.com/user-attachments/files/23064392/My.App.copy.6.swiftpm.zip)

---

## SELF PORTRAIT

[My App copy 28.swiftpm.zip](https://github.com/user-attachments/files/23064071/My.App.copy.28.swiftpm.zip)

---

## TIC TAC TOE GAME (SWIFT)

[My App copy 10.swiftpm.zip](https://github.com/user-attachments/files/23064103/My.App.copy.10.swiftpm.zip)

---

## SCRATCH GAME PROJECT

[Scratch Project.html](https://github.com/user-attachments/files/23063186/Scratch.Project.html)

**what i built:**

**what i learned:**

* how to use if–else conditions to check the winner
* the importance of using variables and lists to keep track of turns (x or o)
* how to make the game interactive with clicks and costumes
* the basics of algorithmic thinking, because i had to plan out all winning possibilities

this project helped me improve both my problem-solving skills and my ability to organize scratch blocks efficiently.

---

## TIC TAC TOE GAME – SWIFTUI CODE

<details>
<summary><strong>click to view swiftui code</strong></summary>

```swift
import SwiftUI

@main
struct TicTacToeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var board: [String] = Array(repeating: "", count: 9)
    @State private var currentPlayer: String = "X"
    @State private var winner: String? = nil
    @State private var moves: Int = 0
   
    private let wins: [[Int]] = [
        [0,1,2],[3,4,5],[6,7,8],
        [0,3,6],[1,4,7],[2,5,8],
        [0,4,8],[2,4,6]
    ]
   
    var body: some View {
        VStack(spacing: 16) {
            Text(statusText)
                .font(.title2).bold()
           
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 3), spacing: 8) {
                ForEach(0..<9) { i in
                    CellView(symbol: board[i])
                        .onTapGesture { tap(i) }
                }
            }
            .padding(.horizontal, 24)
           
            Button("Reset") { reset() }
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
   
    private var statusText: String {
        if let w = winner { return w == "Draw" ? "Draw!" : "\(w) wins!" }
        return "Turn: \(currentPlayer)"
    }
   
    private func tap(_ i: Int) {
        guard board[i].isEmpty, winner == nil else { return }
        board[i] = currentPlayer
        moves += 1
        checkForWinner()
        if winner == nil { currentPlayer = (currentPlayer == "X") ? "O" : "X" }
    }
   
    private func checkForWinner() {
        for line in wins {
            let a = board[line[0]], b = board[line[1]], c = board[line[2]]
            if !a.isEmpty, a == b, b == c {
                winner = a
                return
            }
        }
        if moves == 9 { winner = "Draw" }
    }
   
    private func reset() {
        board = Array(repeating: "", count: 9)
        winner = nil
        moves = 0
        currentPlayer = "X"
    }
}

struct CellView: View {
    let symbol: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(white: 0.95))
                .frame(height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray.opacity(0.4), lineWidth: 1)
                )
            Text(symbol)
                .font(.system(size: 48, weight: .bold, design: .rounded))
                .foregroundColor(.primary)
        }
    }
}
```

</details>

---

## CLOCK PROJECT – CAPTAIN AMERICA SHIELD CLOCK

### target audience

teenagers — this design is aimed at teens who enjoy superheroes, especially marvel.

### design explanation

our group designed a clock that mimics captain america's shield using layered shapes.

### figjam research

we explored superhero-themed clock designs and minimal analog clocks.

### features

* tap gesture to change minute direction
* abstraction using `minuteSeg`
* swiftui layout with zstack and vstack

### REFLECTION

**target audience choice**
teenagers enjoy superhero visuals and interactive design.

**design challenges**
aligning shapes and managing rotation logic was challenging.

**future improvements**
animations and sound effects could be added.

<details>
<summary><strong>click to view clock code</strong></summary>

[My App copy 17.swiftpm.zip](https://github.com/user-attachments/files/23064675/My.App.copy.17.swiftpm.zip)

</details>

---

## BINARY COUNTER PROJECT

in this project, i learned how computers use bits to represent numbers and overflow.

<details>
<summary><strong>click to view binary counter code</strong></summary>

[My App copy 19.swiftpm.zip](https://github.com/user-attachments/files/23064940/My.App.copy.19.swiftpm.zip)

</details>

---

## ICE CREAM OVERFLOW SIMULATION

### REFLECTION

overflow happens when i add more than 5 scoops.

abstraction shows how memory works using a cone metaphor.

<details>
<summary><strong>click to view ice cream overflow code</strong></summary>

[My App copy 21.swiftpm.zip](https://github.com/user-attachments/files/23064188/My.App.copy.21.swiftpm.zip)

</details>

---

## CLOCK GAME – FROG ESCAPE GAME

### how to play

tap start and move the frog left and right to reach the goal.

### REFLECTION

functions and conditionals were used to manage game logic.

overflow resets the game when the timer reaches zero.

<details>
<summary><strong>click to view game code</strong></summary>

[My App copy 25.swiftpm (1).zip](https://github.com/user-attachments/files/23068070/My.App.copy.25.swiftpm.1.zip)

</details>

---

## WORLD CLOCK V2 – CITY LIST PROJECT

i chose this theme to focus on real travel destinations.

### what i learned

lists store multiple cities and loops help manage them.

<details>
<summary><strong>click to view world clock code</strong></summary>

[city list.zip](https://github.com/user-attachments/files/23810289/city.list.zip)

</details>

---

## SPINNER SIMULATION GAME

nested conditionals are used to control probability.

<details>
<summary><strong>click to view spinner code</strong></summary>

[spinner.zip](https://github.com/user-attachments/files/23915249/spinner.zip)

</details>

---

## ROBOT MOVEMENT SIMULATION

a simple robot moves left and right on a grid.

<details>
<summary><strong>click to view robot simulation code</strong></summary>

[My App copy 47.zip](https://github.com/user-attachments/files/24152906/My.App.copy.47.zip)

</details>
