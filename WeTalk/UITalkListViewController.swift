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
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_APPSERVICE.rawValue,
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                RCConversationType.ConversationType_PUSHSERVICE.rawValue
            ])
            
            self.refreshConversationTableViewIfNeeded()
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
    
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        let conVC = RCConversationViewController()
        conVC.targetId = model.targetId
        conVC.userName = model.conversationTitle
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        conVC.title = model.conversationTitle
        
        self.navigationController?.pushViewController(conVC, animated: true)
        
        self.tabBarController?.tabBar.hidden = true
    }
}
