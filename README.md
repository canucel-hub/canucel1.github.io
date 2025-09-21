# canucel1.github.io
# Number Clock App ⏰

## Version
Version 1 – Number Clock

## Features
- Displays numbers 1–12 arranged in a circle like a real clock.  
- Tap the clock to advance the hour by 1.  
- Press the button to jump to a random hour.  
- Highlights the current hour in red so you can easily see it.

## How I Used ForEach and Random
- **ForEach:** Instead of writing each number individually, I used ForEach to generate all 12 numbers around the clock. It made the code much shorter and easier to manage.  
- **Random:** I used `Int.random(in: 0..<12)` so the clock can jump to a random hour when the button is pressed. It made the app more interactive and fun.

## Reflection

**1. How did ForEach make your code simpler?**  
ForEach let me create all the numbers with just one block of code. Without it, I would have had to write 12 separate `Text` views. It made the code cleaner and easier to understand.  

**2. What did you learn about randomness in programming?**  
I learned that randomness can make an app more dynamic. The random hour button shows that a simple function like `Int.random(in:)` can create unpredictability, which adds fun and interactivity.  

**3. Which part was most challenging: design, logic, or input/output?**  
Design was the trickiest part. Getting the numbers to sit nicely in a circle and positioning the hour hand correctly took some trial and error. The logic for advancing hours and handling button taps was much easier.  

**4. How is this project similar to Scratch’s “repeat” and “pick random” blocks?**  
- ForEach is like Scratch’s “repeat” block because it runs the same code multiple times.  
- The random hour button works like Scratch’s “pick random” block because it picks an unpredictable value from a range.

## Screenshots
*(Add screenshots of your running app here)*

