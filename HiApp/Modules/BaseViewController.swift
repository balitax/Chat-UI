//
//  BaseViewController.swift
//  HiApp
//
//  Created by Agus Cahyono on 10/04/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class BaseViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addTabbarItem()
    }
    
    func addTabbarItem() {
        
        self.tabBar.tintColor = UIColor.hexStringToUIColor(hex: "#c30f42")
        
        let messageView = self.embedNavigation(HomeView())
        messageView.tabBarItem = UITabBarItem(title: "Chats", image: UIImage(named: "chats")!, tag: 0)
        
        let groupView = self.embedNavigation(GroupView())
        groupView.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(named: "talk")!, tag: 1)
        
        let callView = self.embedNavigation(PanggilanView())
        callView.tabBarItem = UITabBarItem(title: "Calls", image: UIImage(named: "calls")!, tag: 2)
        
       self.viewControllers = [messageView, groupView, callView]
        
    }
    

}
