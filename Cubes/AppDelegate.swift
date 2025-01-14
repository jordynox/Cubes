//
//  AppDelegate.swift
//  Cubes
//
//  Created by Jordan Ponomarenko on 11/29/24.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window = NSWindow(contentRect: NSRect(x:0, y:0, width: 800, height: 600), styleMask: [.titled, .closable, .resizable, .fullSizeContentView, .miniaturizable,.fullScreen], backing: .buffered, defer: false)
        window.title = "Cubes"
        
        let viewController = ViewController()
        window.contentViewController = viewController
        window.makeKeyAndOrderFront(nil)
        // Insert code here to initializ e your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

