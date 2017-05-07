//
//  ActionMenu.swift
//  OpenSim
//
//  Created by Luo Sheng on 07/05/2017.
//  Copyright © 2017 Luo Sheng. All rights reserved.
//

import Cocoa

final class ActionMenu: NSMenu {
    
    weak var device: Device?
    weak var application: Application?
    
    init(device: Device, application: Application) {
        self.device = device
        self.application = application
        super.init(title: "")
        
        buildActions()
    }
    
    required init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildActions() {
        let revealInFinderAction = NSMenuItem(title: "Reveal Sandbox in Finder", action: #selector(revealInFinder(sender:)), keyEquivalent: "")
        revealInFinderAction.target = self
        self.addItem(revealInFinderAction)
    }
    
    @objc private func revealInFinder(sender: AnyObject) {
        guard let application = application,
            let URL = device?.containerURLForApplication(application),
            FileManager.default.fileExists(atPath: URL.path) else {
                return
        }
        
        NSWorkspace.shared().open(URL)
    }
    
}