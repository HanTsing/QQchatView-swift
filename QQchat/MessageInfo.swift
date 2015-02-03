//
//  MessageInfo.swift
//  QQchat
//
//  Created by hanqing on 2/1/15.
//  Copyright (c) 2015 hanqing. All rights reserved.
//

import Foundation
class MessageInfo {
    var content: NSString = ""
    var status  = false
    
    init(content: String, status: Bool){
       self.content = content
       self.status  = status
    }
}