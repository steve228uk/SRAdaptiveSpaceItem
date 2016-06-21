//
//  SRAdaptiveSpaceItem.swift
//  Fetch
//
//  Created by Stephen Radford on 21/06/2016.
//  Copyright © 2016 Cocoon Development Ltd. All rights reserved.
//

import AppKit

public class SRAdaptiveSpaceItem: NSToolbarItem {

    override public var label: String {
        get {
            return ""
        }
        set { }
    }

    override public var paletteLabel: String {
        get {
            return "Adaptive Space"
        }
        set { }
    }

    var adaptiveSpaceItemView: AdaptiveSpaceItemView?

    var calculatedMinSize: NSSize {
        guard let items = toolbar?.items else { return super.minSize }
        guard let index = items.indexOf(self) else { return super.minSize }
        guard let thisFrame = view?.superview?.frame else { return super.minSize }

        if thisFrame.origin.x > 0 {
            var space: CGFloat = 0
            if items.count > index + 1 {
                let nextItem = items[index + 1]
                guard let nextFrame = nextItem.view?.superview?.frame else { return super.minSize }
                guard let toolbarFrame = nextItem.view?.superview?.superview?.frame else { return super.minSize }

                space = (toolbarFrame.size.width - nextFrame.size.width) / 2 - thisFrame.origin.x - 3
                if space < 0 { space = 0 }
            }

            let size = super.minSize
            return NSSize(width: space, height: size.height)
        }

        return super.minSize
    }

    var calculatedMaxSize: NSSize {
        let size = super.maxSize
        return NSSize(width: minSize.width, height: size.height)
    }

    override init(itemIdentifier: String) {
        super.init(itemIdentifier: itemIdentifier)
        sharedInit()
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
        sharedInit()
    }

    func sharedInit() {
        adaptiveSpaceItemView = AdaptiveSpaceItemView(frame: NSMakeRect(0,0,1,1))
        adaptiveSpaceItemView?.adaptiveSpaceItem = self
        view = adaptiveSpaceItemView
    }

    func updateWidth() {
        print("updating width")
        minSize = calculatedMinSize
        maxSize = calculatedMaxSize
    }

}

class AdaptiveSpaceItemView: NSView {

    var adaptiveSpaceItem: SRAdaptiveSpaceItem?

    override func acceptsFirstMouse(theEvent: NSEvent?) -> Bool {
        return true
    }

    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(windowResized), name: NSWindowDidResizeNotification, object: window)
    }

    func windowResized(notification: NSNotification) {
        adaptiveSpaceItem?.updateWidth()
    }

}
