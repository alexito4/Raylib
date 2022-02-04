import Raylib

func coreBasicWindowExample() {
    // Initialization
    let screenWidth: Int32 = 800
    let screenHeight: Int32 = 450

    Raylib.initWindow(screenWidth, screenHeight, "raylib [core] example - basic window")
    Raylib.setTargetFPS(60)  // Set our game to run at 60 frames-per-second
    
    // Main game loop
    while !Raylib.windowShouldClose { // Detect window close button or ESC key
        // Update
        // TODO: Update your variables here
        
        // Draw
        Raylib.beginDrawing()
        
        Raylib.clearBackground(.rayWhite)
        
        Raylib.drawText(
            "Congrats! You created your first window!",
            190,
            200,
            20,
            .lightGray
        )
        
        Raylib.endDrawing()
    }
    
    // De-Initialization
    Raylib.closeWindow()
}
