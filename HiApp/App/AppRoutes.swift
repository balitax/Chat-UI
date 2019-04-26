//
//  AppRoutes.swift
//  HiApp
//
//  Created by Agus Cahyono on 10/04/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

struct AppRoutes {
    
    static var window: UIWindow?
    
    static func rootApp() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let baseview = BaseViewController()
        window?.rootViewController = baseview
        window?.makeKeyAndVisible()
        
    }
    
}
