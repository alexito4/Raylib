import _RaylibC


@_exported import var _RaylibC.RAYGUI_VERSION

// Style property
@_exported import struct _RaylibC.GuiStyleProp

// Gui control state
@_exported import struct _RaylibC.GuiControlState

public extension GuiControlState {
    static let normal = Self.init(rawValue: 0)
    static let focused = Self.init(rawValue: 1)
    static let pressed = Self.init(rawValue: 2)
    static let disabled = Self.init(rawValue: 3)
}

// Gui control text alignment
@_exported import struct _RaylibC.GuiTextAlignment

public extension GuiTextAlignment {
    static let left = Self.init(rawValue: 0)
    static let center = Self.init(rawValue: 1)
    static let right = Self.init(rawValue: 2)
}

// Gui controls
@_exported import struct _RaylibC.GuiControl


@_exported import _RaylibC
