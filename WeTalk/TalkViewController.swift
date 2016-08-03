//
//  TalkViewController.swift
//  WeTalk
//
//  Created by heyong on 16/8/2.
//  Copyright © 2016年 heyong. All rights reserved.
//

import UIKit

class TalkListViewController: RCConversationListViewController {
    
}

class TalkViewController: RCConversationViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // self.targetId = RCIMClient.sharedRCIMClient().currentUserInfo.userId
        // self.userName = RCIMClient.sharedRCIMClient().currentUserInfo.name
        self.targetId = "neohe"
        self.userName = "Neo"
        self.conversationType = RCConversationType.ConversationType_PRIVATE
        self.title = self.userName
        self.setMessageAvatarStyle(RCUserAvatarStyle.USER_AVATAR_CYCLE)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
