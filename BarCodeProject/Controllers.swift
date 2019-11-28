//
//  Controllers.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 28/11/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import UIKit

class Controllers: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Первый Tab
        let tabOne = BarCodeView()
        tabOne.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 1)
        
        //Первый вью контроллер На нем должна быть камера
        let navViewController = UINavigationController(rootViewController: tabOne)
    
      
        
        self.viewControllers = [navViewController]
    }
}
