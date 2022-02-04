import Raylib

// Types and Structures Definition
enum GameScreen {
    case logo
    case title
    case gameplay
    case ending
}

func coreBasicScreenManagerExample() {
    // Initialization
    let screenWidth: Int32 = 800
    let screenHeight: Int32 = 450

    Raylib.initWindow(screenWidth, screenHeight, "raylib [core] example - basic screen manager")
    Raylib.setTargetFPS(60)  // Set our game to run at 60 frames-per-second
    
    // TODO: Initialize all required variables and load all required data here!
    var currentScreen: GameScreen = .logo
    var framesCounter = 0 // Useful to count frames
    
    // Main game loop
    while !Raylib.windowShouldClose { // Detect window close button or ESC key
        // Update
        // TODO: Update your variables here
        switch currentScreen {
        case .logo:
            // TODO: Update LOGO screen variables here!
            framesCounter += 1 // Count frames
            
            // Wait for 2 seconds (120 frames) before jumping to TITLE screen
            if framesCounter > 120 {
                currentScreen = .title
            }
        case .title:
            // TODO: Update TITLE screen variables here!
            
            // Press enter to change to GAMEPLAY screen
            if Raylib.isKeyPressed(.enter) || Raylib.isGestureDetected(.tap) {
                currentScreen = .gameplay
            }
        case .gameplay:
            // TODO: Update GAMEPLAY screen variables here!
            
            // Press enter to change to ENDING screen
            if Raylib.isKeyPressed(.enter) || Raylib.isGestureDetected(.tap) {
                currentScreen = .ending
            }
        case .ending:
            // TODO: Update ENDING screen variables here!
            
            // Press enter to change to TITLE screen
            if Raylib.isKeyPressed(.enter) || Raylib.isGestureDetected(.tap) {
                currentScreen = .title
            }
        }
        
        // Draw
        Raylib.beginDrawing()
        
        Raylib.clearBackground(.rayWhite)
        
        switch currentScreen {
        case .logo:
            // TODO: Draw LOGO screen here!
            Raylib.drawText("LOGO SCREEN", 20, 20, 40, .lightGray)
            Raylib.drawText("WAIT for 2 SECONDS...", 290, 220, 20, .lightGray)
        case .title:
            // TODO: Draw TITLE screen here!
            Raylib.drawRectangle(0, 0, screenWidth, screenHeight, .green);
            Raylib.drawText("TITLE SCREEN", 20, 20, 40, .darkGreen);
            Raylib.drawText("PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN", 120, 220, 20, .darkGreen)
        case .gameplay:
            // TODO: Draw GAMEPLAY screen here!
            Raylib.drawRectangle(0, 0, screenWidth, screenHeight, .purple);
            Raylib.drawText("GAMEPLAY SCREEN", 20, 20, 40, .maroon);
            Raylib.drawText("PRESS ENTER or TAP to JUMP to ENDING SCREEN", 130, 220, 20, .maroon);
            
        case .ending:
            // TODO: Draw ENDING screen here!
            Raylib.drawRectangle(0, 0, screenWidth, screenHeight, .blue);
            Raylib.drawText("ENDING SCREEN", 20, 20, 40, .darkBlue);
            Raylib.drawText("PRESS ENTER or TAP to RETURN to TITLE SCREEN", 120, 220, 20, .darkBlue);
        }
        
        Raylib.endDrawing()
    }
    
    // De-Initialization
    
    // TODO: Unload all loaded data (textures, fonts, audio) here!
    
    Raylib.closeWindow()
}
