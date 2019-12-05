//
//  Alerts.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 04/12/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import UIKit

enum AlertAnswer: String, Error {
    case responseProblem = "Ошибка при ответе сервера"
    case decodingProblem = "Ошибка декодирования даты"
    case otherProblem = "Непонятная ошибка"
    case productNotFound = "Продукт не найден"
    case saveProduct = "Ваш товар сохранен"
    
    var alert: UIAlertController {
        let message = self.rawValue
        let alertViewController = UIAlertController(title: "Уведомление", message: message, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "ОК!", style: .cancel, handler: nil))
        return alertViewController
    }
}
