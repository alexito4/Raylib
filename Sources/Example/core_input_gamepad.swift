import Raylib

// NOTE: Gamepad name ID depends on drivers and OS
//#define XBOX360_LEGACY_NAME_ID  "Xbox Controller"
//#if defined(PLATFORM_RPI)
//    #define XBOX360_NAME_ID     "Microsoft X-Box 360 pad"
//    #define PS3_NAME_ID         "PLAYSTATION(R)3 Controller"
//#else
//    #define XBOX360_NAME_ID     "Xbox 360 Controller"
//    #define PS3_NAME_ID         "PLAYSTATION(R)3 Controller"
//#endif

// TODO: https://www.raylib.com/examples/core/loader.html?name=core_input_gamepad
func coreInputGamepadExample() {
    // Initialization
    let screenWidth: Int32 = 800
    let screenHeight: Int32 = 450
    
    Raylib.setConfigFlags(.Fmsaa4xHint) // Set MSAA 4X hint before windows creation

    Raylib.initWindow(screenWidth, screenHeight, "raylib [core] example - gamepad input")
    Raylib.setTargetFPS(60)  // Set our game to run at 60 frames-per-second
    
//    Texture(image: Image.init(fileName: <#T##String#>))
    let texturePs3Pad = Raylib.loadTexture("ps3.png") // TODO: Didn't i have a method with bundle api for this?
    let textureXboxPad = Raylib.loadTexture("xbox.png")
    
    // Main game loop
    while !Raylib.windowShouldClose { // Detect window close button or ESC key
        // Update
        
        // Draw
        Raylib.beginDrawing()
        
        Raylib.clearBackground(.rayWhite)
        
        if Raylib.isGamepadAvailable(0) {
            
        } else {
            Raylib.drawText("GP1: NOT DETECTED", 10, 10, 10, .gray)
            Raylib.drawTexture(texturePs3Pad, 0, 0, .lightGray)
        }
        
        Raylib.endDrawing()
    }
    
    // De-Initialization
    Raylib.closeWindow()
}
