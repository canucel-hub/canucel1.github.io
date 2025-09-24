import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.teal
                .opacity(0.3)
            //head
            RoundedRectangle(cornerRadius: 150)
                .frame(width: 275, height: 350)
                .foregroundColor(.brown)
               
                
                       
            //neck
            Rectangle()
                .frame(width: 120, height: 200)
                .offset(y: 200)
                .foregroundColor(.brown)
            
            //body
            RoundedRectangle(cornerRadius: 100)
                .foregroundColor(.white)
                .frame(width: 350, height: 400)
                .offset(y:400)
                .shadow(radius: 30)
            
            //hair
            Circle()
                .trim(from: 0.5, to: 1.0)
                .frame(width: 300)
                .offset(y: -50)
                .foregroundColor(.brown).shadow(radius: 20)
            //eye
            Ellipse()
                .frame (width: 30, height: 30)
                .offset(x: -55)
                .foregroundColor(.white)
            //eye
            Ellipse()
                .frame (width: 30, height: 30)
                .offset(x: 55)
                .foregroundColor(.white)
            //eyeball
            Ellipse()
                .frame (width: 15, height: 15)
                .offset(x: -55)
                .foregroundColor(.brown)
            //eyeball
            Ellipse()
                .frame (width: 15, height: 15)
                .offset(x: 55)
                .foregroundColor(.brown)
            
            Image(systemName: "line.diagonal")
                .offset(y:40)
                .frame (width: 100)
            //mouth
            Ellipse()
                .frame(width: 60, height: 20)
                .offset(y: 80)
        }
    }
}
