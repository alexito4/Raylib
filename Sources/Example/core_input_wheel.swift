import Raylib

func coreInputMouseWheelExample() {
    // Initialization
    let screenWidth: Int32 = 800
    let screenHeight: Int32 = 450

    Raylib.initWindow(screenWidth, screenHeight, "raylib [core] example - input mouse wheel")
    Raylib.setTargetFPS(60)  // Set our game to run at 60 frames-per-second
    
    var boxPositionY: Float = Float(screenHeight)/2 - 40
    let scrollSpeed = 4 // Scrolling speed in pixels
    
    // Main game loop
    while !Raylib.windowShouldClose { // Detect window close button or ESC key
        // Update
        boxPositionY -= Raylib.getMouseWheelMove() * Float(scrollSpeed)
        
        // Draw
        Raylib.beginDrawing()
        
        Raylib.clearBackground(.rayWhite)
        
        Raylib.drawRectangleRec(Rectangle(x: Float(screenWidth)/2 - 40, y: boxPositionY, width: 80, height: 80), .maroon)

        Raylib.drawText(
            "Use mouse wheel to move the cube up and down!",
            10,
            10,
            20,
            .gray
        )
        
        Raylib.drawText(
            "Box position Y: \(boxPositionY)",
            10,
            40,
            20,
            .lightGray
        )
        
        Raylib.endDrawing()
    }
    
    // De-Initialization
    Raylib.closeWindow()
}
