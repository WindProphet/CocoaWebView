//
//  main.swift
//  cocoacmd
//
//  Created by 李瀚源 on 2016/10/27.
//  Copyright © 2016年 李瀚源. All rights reserved.
//

import Cocoa
import WebKit
import Swift

var w = 400
var h = 400
if (CommandLine.argc >= 2) {
    w = Int(CommandLine.arguments[1])!
    h = Int(CommandLine.arguments[2])!
}

var content = ""
while let c = readLine() {
    content += c + "\n"
}

NSApplication.shared()
NSApp.setActivationPolicy(.regular)
class load: NSObject, WKUIDelegate {
    
}
let webview = WKWebView()
class Window: NSWindow, NSWindowDelegate {
    func windowWillClose(_ notification: Notification) {
        NSApp.terminate(nil)
    }
    func windowDidResize(_ notification: Notification) {
        webview.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: self.contentView!.frame.size)
    }
    
}
let menu = NSMenu()
let item = NSMenuItem()
menu.addItem(item)
NSApp.mainMenu = menu
let appMenu = NSMenu()
let quitTitle = "Quit"
let quitMenuItem = NSMenuItem(title: "Quit", action: #selector(NSApp.terminate), keyEquivalent: "q")
appMenu.addItem(quitMenuItem)
item.submenu = appMenu

let name = ProcessInfo.processInfo.processName

let window = Window(contentRect: NSMakeRect(0, 0, CGFloat(w), CGFloat(h)), styleMask: .titled, backing: .buffered, defer: false)
window.cascadeTopLeft(from: NSPoint(x: 20, y: 20))
window.orderFrontRegardless()
window.showsResizeIndicator = true
window.styleMask = window.styleMask
    .union(.resizable)
    .union(.closable)
    .union(.miniaturizable)
window.collectionBehavior = window.collectionBehavior
    .union(.fullScreenPrimary)
window.contentView!.addSubview(webview)
webview.loadHTMLString(content, baseURL: URL(string: "file:///tmp/webview")!)
window.title = webview.title!
webview.frame = window.contentView!.frame
window.delegate = window
webview.configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")

NSApp.run()
