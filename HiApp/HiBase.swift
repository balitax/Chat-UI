//
//  HiBase.swift
//  HiApp
//
//  Created by Agus Cahyono on 10/04/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

open class HiBase: UIViewController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setIndicatorBar() {
        let tabBar = self.tabBarController!.tabBar
        tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: UIColor.hexStringToUIColor(hex: "#c30f42"), size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height: tabBar.frame.height), lineWidth: 2.0)
    }
    
}

extension UIViewController {
    
    func embedNavigation(_ viewController: UIViewController) -> UIViewController {
        let addNavigation = UINavigationController(rootViewController: viewController)
        addNavigation.navigationBar.barTintColor = UIColor.white
        addNavigation.navigationBar.isTranslucent = false
        addNavigation.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.hexStringToUIColor(hex: "#c30f42")]
        addNavigation.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.hexStringToUIColor(hex: "#c30f42")]
        return addNavigation
    }
    
}
