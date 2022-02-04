import Raylib

func coreInputMouseExample() {
    // Initialization
    let screenWidth: Int32 = 800
    let screenHeight: Int32 = 450

    Raylib.initWindow(screenWidth, screenHeight, "raylib [core] example - mouse input")
    Raylib.setTargetFPS(60)  // Set our game to run at 60 frames-per-second
    
    var ballPosition: Vector2 = .init(x: -100, y: -100)
    var ballColor: Color = .darkBlue
    
    // Main game loop
    while !Raylib.windowShouldClose { // Detect window close button or ESC key
        // Update
        ballPosition = Raylib.getMousePosition()
        
        if Raylib.isMouseButtonPressed(.left) {
            ballColor = .maroon
        } else if Raylib.isMouseButtonPressed(.middle) {
            ballColor = .lime
        } else if Raylib.isMouseButtonPressed(.right) {
            ballColor = .darkBlue
        } else if Raylib.isMouseButtonPressed(.side) {
            ballColor = .purple
        } else if Raylib.isMouseButtonPressed(.extra) {
            ballColor = .yellow
        } else if Raylib.isMouseButtonPressed(.forward) {
            ballColor = .orange
        } else if Raylib.isMouseButtonPressed(.back) {
            ballColor = .beige
        }
        
        // Draw
        Raylib.beginDrawing()
        
        Raylib.clearBackground(.rayWhite)
        
        Raylib.drawCircleV(ballPosition, 40, ballColor)

        Raylib.drawText(
            "move ball with mouse and click mouse button to change color",
            10,
            10,
            20,
            .darkGray
        )
        
        Raylib.endDrawing()
    }
    
    // De-Initialization
    Raylib.closeWindow()
}
