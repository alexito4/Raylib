import Raylib


func core2dCameraExample() {
    // Initialization
    let screenWidth: Int32 = 800
    let screenHeight: Int32 = 450

    Raylib.initWindow(screenWidth, screenHeight, "raylib [core] example - 2d camera")
    Raylib.setTargetFPS(60)  // Set our game to run at 60 frames-per-second
    
    let maxBuildings = 100
    var player: Rectangle = .init(x: 400, y: 280, width: 40, height: 40)
    var buildings: Array<Rectangle> = .init(repeating: .init(), count: maxBuildings)
    var colors: Array<Color> = .init(repeating: .init(), count: maxBuildings)
    
    var spacing: Float = 0
    for i in (0..<maxBuildings) {
        buildings[i].width = Float.random(in: 50...200)
        buildings[i].height = Float.random(in: 100...800)
        buildings[i].y = Float(screenHeight) - 130 - buildings[i].height;
        buildings[i].x = Float(-6000 + spacing)
        
        spacing += buildings[i].width
        
        colors[i] = .init(
            r: .random(in: 200...240),
            g: .random(in: 200...240),
            b: .random(in: 200...250),
            a: 255
        )
    }
    
    var camera = Camera2D()
    camera.target = .init(x: player.x + player.width/2, y: player.y + player.height/2)
    camera.offset = .init(x: Float(screenWidth)/2, y: Float(screenHeight)/2)
    camera.rotation = 0
    camera.zoom = 1
    
    // Main game loop
    while !Raylib.windowShouldClose { // Detect window close button or ESC key
        // Update
    
        // Player movement
        if Raylib.isKeyDown(.right) {
            player.x += 2
        }
        if Raylib.isKeyDown(.left) {
            player.x -= 2
        }

        // Camera target follows player
        camera.target = .init(x: player.x + player.width/2, y: player.y + player.height/2)

        // Camera rotation controls
        if Raylib.isKeyDown(.letterA) {
            camera.rotation -= 1
        } else if Raylib.isKeyDown(.letterS) {
            camera.rotation += 1
        }

        // Limit camera rotation to 80 degrees (-40 to 40)
        camera.rotation = Raylib.clamp(camera.rotation, -40, 40)

        // Camera zoom controls
        camera.zoom += Raylib.getMouseWheelMove() * 0.05
        camera.zoom = Raylib.clamp(camera.zoom, 0.1, 3)

        // Camera reset (zoom and rotation)
        if Raylib.isKeyPressed(.letterR) {
            camera.zoom = 1
            camera.rotation = 0
        }
        
        // Draw
        Raylib.beginDrawing()
        
        Raylib.clearBackground(.rayWhite)
        
        Raylib.beginMode2D(camera)
        
        Raylib.drawRectangleRec(Rectangle(x: -6000, y: 320, width: 13000, height: 8000), .darkGray)
        for i in buildings.indices {
            Raylib.drawRectangleRec(buildings[i], colors[i])
        }
        Raylib.drawRectangleRec(player, .red)
        Raylib.drawLine(Int32(camera.target.x), -screenHeight*10, Int32(camera.target.x), screenHeight*10, .green)
        Raylib.drawLine(-screenWidth*10, Int32(camera.target.y), screenWidth*10, Int32(camera.target.y), .green)
        
        Raylib.endMode2D()
        
        Raylib.drawText("SCREEN AREA", 640, 10, 20, .red)
        
        Raylib.drawRectangle(0, 0, screenWidth, 5, .red)
        Raylib.drawRectangle(0, 5, 5, screenHeight - 10, .red)
        Raylib.drawRectangle(screenWidth - 5, 5, 5, screenHeight - 10, .red)
        Raylib.drawRectangle(0, screenHeight - 5, screenWidth, 5, .red)
        
        Raylib.drawRectangle( 10, 10, 250, 113, Raylib.fade(.skyBlue, 0.5))
        Raylib.drawRectangleLines( 10, 10, 250, 113, .blue)
        
        Raylib.drawText("Free 2d camera controls:", 20, 20, 10, .blank)
        Raylib.drawText("- Right/Left to move Offset", 40, 40, 10, .darkGray)
        Raylib.drawText("- Mouse Wheel to Zoom in-out", 40, 60, 10, .darkGray)
        Raylib.drawText("- A / S to Rotate", 40, 80, 10, .darkGray)
        Raylib.drawText("- R to reset Zoom and Rotation", 40, 100, 10, .darkGray)
        
        Raylib.endDrawing()
    }
    
    // De-Initialization
    Raylib.closeWindow()
}
