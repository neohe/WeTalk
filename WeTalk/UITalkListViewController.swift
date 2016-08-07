//
//  UITalkListViewController.swift
//  WeTalk
//
//  Created by heyong on 16/8/4.
//  Copyright © 2016年 heyong. All rights reserved.
//

import UIKit

class UITalkListViewController: RCConversationListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        appDelegate?.connectServer({ () -> Void in
            print("connected successful!")
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.tabBarController?.tabBar.hidden = true
    }
}
