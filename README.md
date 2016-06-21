# SRAdaptiveSpaceItem
A Swift NSToolbarItem subclass which creates a space that will centre the next toolbar item.

= This project is a direct translation of [TAAdaptiveSpaceItem](https://github.com/timothyarmes/TAAdaptiveSpaceItem)

## Usage

1. Add an Image Toolbar Item to your toolbar
2. Set the class of the Image Toolbar Item to `SRAdaptiveSpaceItem`
3. Place the `SRAdaptiveSpaceItem` directly before the item you wish to centre

You only need 1 `SRAdaptiveSpaceItem` per toolbar. Items after the centred item can be positioned using a flexible space with no issues.

## Installation

Either manually copy the `SRAdaptiveSpaceItem.swift` file to your project or install via CocoaPods

````ruby
pod 'SRAdaptiveSpaceItem'
````

## Screenshots
