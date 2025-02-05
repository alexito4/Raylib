/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under MIT License
 *
 * http://stregasgate.com
 */

// Gamepad axis
public enum GamepadAxis: Int32 {
    // Left stick
    case leftX  = 0
    case leftY  = 1

    // Right stick
    case rightX = 2
    case rightY = 3

    // Pressure levels for the back triggers
    case leftTrigger = 4 // [1..-1] (pressure-level)
    case rightTrigger = 5 // [1..-1] (pressure-level)
}
