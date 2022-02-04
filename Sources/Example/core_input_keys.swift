import Raylib

func coreInputKeysExample() {
    // Initialization
    let screenWidth: Int32 = 800
    let screenHeight: Int32 = 450

    Raylib.initWindow(screenWidth, screenHeight, "raylib [core] example - keyboard input")
    Raylib.setTargetFPS(60)  // Set our game to run at 60 frames-per-second
    
    var ballPosition: Vector2 = .init(x: Float(screenWidth)/2, y: Float(screenHeight)/2)
    
    // Main game loop
    while !Raylib.windowShouldClose { // Detect window close button or ESC key
        // Update
        if Raylib.isKeyDown(.right) {
            ballPosition.x += 2
        }
        if Raylib.isKeyDown(.left) {
            ballPosition.x -= 2
        }
        if Raylib.isKeyDown(.up) {
            ballPosition.y -= 2
        }
        if Raylib.isKeyDown(.down) {
            ballPosition.y += 2
        }
        
        // Draw
        Raylib.beginDrawing()
        
        Raylib.clearBackground(.rayWhite)
        
        Raylib.drawText(
            "move the ball with arrow keys",
            10,
            10,
            20,
            .darkGray
        )
        
        Raylib.drawCircleV(ballPosition, 50, .maroon)
        
        Raylib.endDrawing()
    }
    
    // De-Initialization
    Raylib.closeWindow()
}
