//
//  NotificationViewController.swift
//  contentNoti
//
//  Created by MIN JUN JU on 2017. 12. 7..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI



class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }

}
