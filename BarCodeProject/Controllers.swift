//
//  Controllers.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 28/11/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import UIKit

class Controllers: UITabBarController {
    
    let iconShop = UIImage(named: "iconShop")
    let tabBarImage = UIImage(named: "tabBar")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Первый Tab
        let tabOne = BarCodeView()
        
        tabOne.tabBarItem = UITabBarItem(title: "Сканировать", image: tabBarImage, tag: 1)
        
        //Первый навигационный контроллер на нем должна быть камера
        let navViewController = UINavigationController(rootViewController: tabOne)
        
        let tabTwo = TableBarCodeView()
        tabTwo.tabBarItem = UITabBarItem(title: "Сохраненные продукты", image: iconShop, tag: 2)
        
        //Втторой навигационный контроллер на нем должныы быть сохраненные товары
        let navDataViewController = UINavigationController(rootViewController: tabTwo)
        
        
        self.viewControllers = [navViewController, navDataViewController]
    }

}
