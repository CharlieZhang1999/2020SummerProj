//
//  homeViewController.swift
//  2020SummerProj
//
//  Created by Ted on 5/19/20.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit
import UserNotifications

class homeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        localNotifications()
    }
    
    
    func localNotifications() {
        
        // Ask for permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: .alert) { (result, error) in
            
        }
        
        // Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "Greetings from Ted!"
        content.body = "HAHAHAHAHAHAHAHAHHAHAHA!!!!!!!"
        
        // Trigger
        let date = Date().addingTimeInterval(15)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Create notification request
        let uniqueIdentifier = UUID().uuidString
        let request = UNNotificationRequest(identifier: uniqueIdentifier, content: content, trigger: trigger)
        
        // Register the request
        center.add(request) { (error) in
            
        }
    }

}
