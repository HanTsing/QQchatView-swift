//
//  MsgCellTableViewCell.swift
//  QQchat
//
//  Created by hanqing on 2/6/15.
//  Copyright (c) 2015 hanqing. All rights reserved.
//

import UIKit

class MsgCellTableViewCell: UITableViewCell {

    var messageView:MessageView!
    var messageInfo:MessageInfo!{
        
        
        didSet{
            
            if((messageView) != nil){
                messageView.removeFromSuperview()
            }
            
            messageView = MessageView()
            messageView.setTranslatesAutoresizingMaskIntoConstraints(false)
            messageView.messageInfo = messageInfo
//            messageView.backgroundColor = UIColor.redColor()
//            self.contentView.backgroundColor = UIColor.blueColor()
            self.contentView.addSubview(messageView)
            let viewsDictionary = ["msgView": messageView]
            
            let avatar_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|[msgView]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
            let avatar_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|[msgView]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
            self.contentView.addConstraints(avatar_constraint_H)
            self.contentView.addConstraints(avatar_constraint_V)
        }
        
    }

}
