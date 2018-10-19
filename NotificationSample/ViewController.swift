//
//  ViewController.swift
//  NotificationSample
//
//  Created by 大林拓実 on 2018/10/19.
//  Copyright © 2018年 TakumiObayashi. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate{
    
    //通知を作成
    @IBAction func setNotification(_ sender: Any){
        //タイトル，本文，サウンド設定の保持
        let content = UNMutableNotificationContent()
        content.title = "時間です"
        content.subtitle = "10秒経過しました"
        content.body = "タップしてアプリを開いてください"
        content.sound = UNNotificationSound.default
        
        //seconds後に起動するトリガーを保持
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        //識別子とともに通知の表示内容とトリガーをrequestに内包する
        let request = UNNotificationRequest(identifier: "Timer", content: content, trigger: trigger)
        
        //UNUserNotificationCenterにrequestを加える
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.add(request){(error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // foregroundの場合でも通知を表示
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}

