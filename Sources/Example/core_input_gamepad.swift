import Raylib
import Foundation

// NOTE: Gamepad name ID depends on drivers and OS
let XBOX360_LEGACY_NAME_ID = "Xbox Controller"
//#if defined(PLATFORM_RPI)
//    #define XBOX360_NAME_ID     "Microsoft X-Box 360 pad"
//    #define PS3_NAME_ID         "PLAYSTATION(R)3 Controller"
//#else
let XBOX360_NAME_ID = "Xbox 360 Controller"
let PS3_NAME_ID = "PLAYSTATION(R)3 Controller"
//#endif

// TODO: https://www.raylib.com/examples/core/loader.html?name=core_input_gamepad
func coreInputGamepadExample() {
    // Initialization
    let screenWidth: Int32 = 800
    let screenHeight: Int32 = 450
    
    Raylib.setConfigFlags(.Fmsaa4xHint) // Set MSAA 4X hint before windows creation

    Raylib.initWindow(screenWidth, screenHeight, "raylib [core] example - gamepad input")
    Raylib.setTargetFPS(60)  // Set our game to run at 60 frames-per-second
    
    let ps3ImageURL = Bundle.module.url(forResource: "Images/ps3", withExtension: "png")!
    let xboxImageURL = Bundle.module.url(forResource: "Images/xbox", withExtension: "png")!

    let texturePs3Pad = Texture(url: ps3ImageURL)
    let textureXboxPad = Texture(url: xboxImageURL)
    
    // Main game loop
    while !Raylib.windowShouldClose { // Detect window close button or ESC key
        // Update
        
        // Draw
        Raylib.beginDrawing()
        
        Raylib.clearBackground(.rayWhite)
        
        if Raylib.isGamepadAvailable(0) {
            let gamepadName = Raylib.getGamepadName(0)
            Raylib.drawText("GP1: \(gamepadName)", 10, 10, 10, .black)

            if gamepadName == XBOX360_NAME_ID || gamepadName == XBOX360_LEGACY_NAME_ID {
                Raylib.drawTexture(textureXboxPad, 0, 0, .darkGray)

                // Draw buttons: xbox home
                if Raylib.isGamepadButtonDown(0, .middle) {
                    Raylib.drawCircle(394, 89, 19, .red)
                }

                // Draw buttons: basic
                if Raylib.isGamepadButtonDown(0, .middleRight) {
                    Raylib.drawCircle(436, 150, 9, .red)
                }
                if Raylib.isGamepadButtonDown(0, .middleLeft) {
                    Raylib.drawCircle(352, 150, 9, .red)
                }
                
                if Raylib.isGamepadButtonDown(0, .rightFaceUp) {
                    Raylib.drawCircle(536, 115, 15, .gold)
                }
                if Raylib.isGamepadButtonDown(0, .rightFaceRight) {
                    Raylib.drawCircle(572, 151, 15, .maroon)
                }
                if Raylib.isGamepadButtonDown(0, .rightFaceDown) {
                    Raylib.drawCircle(536, 187, 15, .lime)
                }
                if Raylib.isGamepadButtonDown(0, .rightFaceLeft) {
                    Raylib.drawCircle(501, 151, 15, .blue)
                }

                // Draw buttons: d-pad
                Raylib.drawRectangle(317, 202, 19, 71, .black)
                Raylib.drawRectangle(293, 228, 69, 19, .black)
                if Raylib.isGamepadButtonDown(0, .leftFaceUp)       { Raylib.drawRectangle(317, 202, 19, 26, .red) }
                if Raylib.isGamepadButtonDown(0, .leftFaceDown)     { Raylib.drawRectangle(317, 202 + 45, 19, 26, .red) }
                if Raylib.isGamepadButtonDown(0, .leftFaceLeft)     { Raylib.drawRectangle(292, 228, 25, 19, .red) }
                if Raylib.isGamepadButtonDown(0, .leftFaceRight)    { Raylib.drawRectangle(292 + 44, 228, 26, 19, .red) }

                // Draw buttons: left-right back
                if Raylib.isGamepadButtonDown(0, .leftTrigger1)  {   Raylib.drawCircle(259, 61, 20, .red) }
                if Raylib.isGamepadButtonDown(0, .rightTrigger1)  {  Raylib.drawCircle(536, 61, 20, .red) }

                // Draw axis: left joystick
                Raylib.drawCircle(259, 152, 39, .blank)
                Raylib.drawCircle(259, 152, 34, .lightGray)
                Raylib.drawCircle(259 + Int32(Raylib.getGamepadAxisMovement(0, .leftX) * 20),
                                  152 + Int32(Raylib.getGamepadAxisMovement(0, .leftY) * 20), 25,
                                  Raylib.isGamepadButtonDown(0, .leftThumb) ? .red : .black)

                // Draw axis: right joystick
                Raylib.drawCircle(461, 237, 38, .blank)
                Raylib.drawCircle(461, 237, 33, .lightGray)
                Raylib.drawCircle(461 + Int32(Raylib.getGamepadAxisMovement(0, .rightX)*20),
                                  237 + Int32(Raylib.getGamepadAxisMovement(0, .rightY)*20), 25,
                                  Raylib.isGamepadButtonDown(0, .rightThumb) ? .red : .black)


                // Draw axis: left-right triggers
                Raylib.drawRectangle(170, 30, 15, 70, .gray)
                Raylib.drawRectangle(604, 30, 15, 70, .gray)
                Raylib.drawRectangle(170, 30, 15, Int32((1 - -Raylib.getGamepadAxisMovement(0, .leftTrigger)) / 2 * 70), .red)
                Raylib.drawRectangle(604, 30, 15, Int32((1 - -Raylib.getGamepadAxisMovement(0, .rightTrigger)) / 2 * 70), .red)
                

                Raylib.drawText("Xbox axis LT: \(Raylib.getGamepadAxisMovement(0, .leftTrigger))", 10, 40, 10, .black)
                Raylib.drawText("Xbox axis RT: \(Raylib.getGamepadAxisMovement(0, .rightTrigger))", 10, 60, 10, .black)
            } else if gamepadName == PS3_NAME_ID {
                Raylib.drawTexture(texturePs3Pad, 0, 0, .darkGray)

                // Draw buttons: ps
                if Raylib.isGamepadButtonDown(0, .middle) {
                    Raylib.drawCircle(396, 222, 13, .red)
                }

                // Draw buttons: basic
                if Raylib.isGamepadButtonDown(0, .middleLeft) {
                    Raylib.drawRectangle(328, 170, 32, 13, .red)
                }
                if Raylib.isGamepadButtonDown(0, .middleRight) {
                    Raylib.drawTriangle(.init(x: 436, y: 168), .init(x: 436, y: 185), .init(x: 464, y: 177), .red)
                }
                if Raylib.isGamepadButtonDown(0, .rightFaceUp) {
                    Raylib.drawCircle(557, 144, 13, .lime)
                }
                if Raylib.isGamepadButtonDown(0, .rightFaceRight) {
                    Raylib.drawCircle(586, 173, 13, .red)
                }
                if Raylib.isGamepadButtonDown(0, .rightFaceDown) {
                    Raylib.drawCircle(557, 203, 13, .violet)
                }
                if Raylib.isGamepadButtonDown(0, .rightFaceLeft) {
                    Raylib.drawCircle(527, 173, 13, .pink)
                }

                // Draw buttons: d-pad
                Raylib.drawRectangle(225, 132, 24, 84, .black)
                Raylib.drawRectangle(195, 161, 84, 25, .black)
                if Raylib.isGamepadButtonDown(0, .leftFaceUp)       { Raylib.drawRectangle(225, 132, 24, 29, .red) }
                if Raylib.isGamepadButtonDown(0, .leftFaceDown)     { Raylib.drawRectangle(225, 132 + 54, 24, 30, .red) }
                if Raylib.isGamepadButtonDown(0, .leftFaceLeft)     { Raylib.drawRectangle(195, 161, 30, 25, .red) }
                if Raylib.isGamepadButtonDown(0, .leftFaceRight)    { Raylib.drawRectangle(195 + 54, 161, 30, 25, .red) }

                // Draw buttons: left-right back buttons
                if Raylib.isGamepadButtonDown(0, .leftTrigger1)  {   Raylib.drawCircle(239, 82, 20, .red) }
                if Raylib.isGamepadButtonDown(0, .rightTrigger1)  {  Raylib.drawCircle(557, 82, 20, .red) }

                // Draw axis: left joystick
                Raylib.drawCircle(319, 255, 35, .blank)
                Raylib.drawCircle(319, 255, 31, .lightGray)
                Raylib.drawCircle(319 + Int32(Raylib.getGamepadAxisMovement(0, .leftX) * 20),
                                  255 + Int32(Raylib.getGamepadAxisMovement(0, .leftY) * 20), 25,
                                  Raylib.isGamepadButtonDown(0, .leftThumb) ? .red : .black)

                // Draw axis: right joystick
                Raylib.drawCircle(475, 255, 35, .blank)
                Raylib.drawCircle(475, 255, 31, .lightGray)
                Raylib.drawCircle(475 + Int32(Raylib.getGamepadAxisMovement(0, .rightX)*20),
                                  255 + Int32(Raylib.getGamepadAxisMovement(0, .rightY)*20), 25,
                                  Raylib.isGamepadButtonDown(0, .rightThumb) ? .red : .black)

                // Draw axis: left-right triggers
                Raylib.drawRectangle(169, 48, 15, 70, .gray)
                Raylib.drawRectangle(611, 48, 15, 70, .gray)
                Raylib.drawRectangle(169, 48, 15, Int32((1 - -Raylib.getGamepadAxisMovement(0, .leftTrigger)) / 2 * 70), .red)
                Raylib.drawRectangle(611, 48, 15, Int32((1 - -Raylib.getGamepadAxisMovement(0, .rightTrigger)) / 2 * 70), .red)
            } else {
                defer { Raylib.drawText("- GENERIC GAMEPAD -", 280, 180, 20, .gray) }

                // TODO: Draw generic gamepad
                Raylib.drawTexture(texturePs3Pad, 0, 0, .darkGray)

                // Draw buttons: ps
                if Raylib.isGamepadButtonDown(0, .middle) {
                    Raylib.drawCircle(396, 222, 13, .red)
                }

                // Draw buttons: basic
                if Raylib.isGamepadButtonDown(0, .middleLeft) {
                    Raylib.drawRectangle(328, 170, 32, 13, .red)
                }
                if Raylib.isGamepadButtonDown(0, .middleRight) {
                    Raylib.drawTriangle(.init(x: 436, y: 168), .init(x: 436, y: 185), .init(x: 464, y: 177), .red)
                }
                if Raylib.isGamepadButtonDown(0, .rightFaceUp) {
                    Raylib.drawCircle(557, 144, 13, .lime)
                }
                if Raylib.isGamepadButtonDown(0, .rightFaceRight) {
                    Raylib.drawCircle(586, 173, 13, .red)
                }
                if Raylib.isGamepadButtonDown(0, .rightFaceDown) {
                    Raylib.drawCircle(557, 203, 13, .violet)
                }
                if Raylib.isGamepadButtonDown(0, .rightFaceLeft) {
                    Raylib.drawCircle(527, 173, 13, .pink)
                }

                // Draw buttons: d-pad
                Raylib.drawRectangle(225, 132, 24, 84, .black)
                Raylib.drawRectangle(195, 161, 84, 25, .black)
                if Raylib.isGamepadButtonDown(0, .leftFaceUp)       { Raylib.drawRectangle(225, 132, 24, 29, .red) }
                if Raylib.isGamepadButtonDown(0, .leftFaceDown)     { Raylib.drawRectangle(225, 132 + 54, 24, 30, .red) }
                if Raylib.isGamepadButtonDown(0, .leftFaceLeft)     { Raylib.drawRectangle(195, 161, 30, 25, .red) }
                if Raylib.isGamepadButtonDown(0, .leftFaceRight)    { Raylib.drawRectangle(195 + 54, 161, 30, 25, .red) }

                // Draw buttons: left-right back buttons
                if Raylib.isGamepadButtonDown(0, .leftTrigger1)  {   Raylib.drawCircle(239, 82, 20, .red) }
                if Raylib.isGamepadButtonDown(0, .rightTrigger1)  {  Raylib.drawCircle(557, 82, 20, .red) }

                // Draw axis: left joystick
                Raylib.drawCircle(319, 255, 35, .blank)
                Raylib.drawCircle(319, 255, 31, .lightGray)
                Raylib.drawCircle(319 + Int32(Raylib.getGamepadAxisMovement(0, .leftX) * 20),
                                  255 + Int32(Raylib.getGamepadAxisMovement(0, .leftY) * 20), 25,
                                  Raylib.isGamepadButtonDown(0, .leftThumb) ? .red : .black)

                // Draw axis: right joystick
                Raylib.drawCircle(475, 255, 35, .blank)
                Raylib.drawCircle(475, 255, 31, .lightGray)
                Raylib.drawCircle(475 + Int32(Raylib.getGamepadAxisMovement(0, .rightX)*20),
                                  255 + Int32(Raylib.getGamepadAxisMovement(0, .rightY)*20), 25,
                                  Raylib.isGamepadButtonDown(0, .rightThumb) ? .red : .black)

                // Draw axis: left-right triggers
                Raylib.drawRectangle(169, 48, 15, 70, .gray)
                Raylib.drawRectangle(611, 48, 15, 70, .gray)
                Raylib.drawRectangle(169, 48, 15, Int32((1 - -Raylib.getGamepadAxisMovement(0, .leftTrigger)) / 2 * 70), .red)
                Raylib.drawRectangle(611, 48, 15, Int32((1 - -Raylib.getGamepadAxisMovement(0, .rightTrigger)) / 2 * 70), .red)
            }

            Raylib.drawText("DETECTED AXIS [\(Raylib.getGamepadAxisCount(0))]", 10, 50, 10, .maroon)

            for i in 0..<Raylib.getGamepadAxisCount(0) { // TODO: shouldn't this return GamepadAxis arary?
                Raylib.drawText("AXIS %i: \(Raylib.getGamepadAxisMovement(0, GamepadAxis(rawValue: i)!))", 20, 70 + 20*i, 10, .darkGray)
            }
            
            let gamepadButtonPressed = Raylib.getGamepadButtonPressed()
            Raylib.drawText(
                "DETECTED BUTTON: \(gamepadButtonPressed == .unknown ? "NONE" : String(describing: gamepadButtonPressed))",
                10,
                430,
                10,
                gamepadButtonPressed == .unknown ? .gray : .red
            )
        } else {
            Raylib.drawText("GP1: NOT DETECTED", 10, 10, 10, .gray)
            Raylib.drawTexture(texturePs3Pad, 0, 0, .lightGray)
        }
        
        Raylib.endDrawing()
    }
    
    // De-Initialization
    Raylib.closeWindow()
}
