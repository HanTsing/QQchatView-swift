//
//  Message.swift
//  QQchat
//
//  Created by hanqing on 2/1/15.
//  Copyright (c) 2015 hanqing. All rights reserved.
//

import UIKit

class MessageView: UIView {
    
    var avatar: UIImageView!
    var contentLabel: UILabel!
    var contentImage: UIImage!
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    init(messageInfo: MessageInfo) {
        super.init(frame: CGRect(x: 0, y: 0, width: 320, height: 200))
        if messageInfo.status {
            self.avatar = UIImageView(frame: CGRect(x: 262, y: 4, width: 50, height: 50))
            self.avatar.image = UIImage(named: "icon02")
            self.addSubview(avatar)
            setChatModel(messageInfo)
        } else {
            self.avatar = UIImageView(frame: CGRect(x: 8, y: 0, width: 50, height: 50))
            self.avatar.image = UIImage(named: "icon01")
            self.addSubview(avatar)
            setChatModel(messageInfo)
        }
    }


    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setChatModel(messageInfo: MessageInfo){
        if messageInfo.status {
             self.contentLabel = UILabel(frame: CGRect(x: 66, y: 14, width: 246, height: 27))
             self.contentLabel.textAlignment = NSTextAlignment.Right
             self.contentImage = UIImage(named: "chatto_bg_normal")
        } else {
            self.contentLabel = UILabel(frame: CGRect(x: 15, y: 8, width: 246, height: 27))
            self.contentLabel.textAlignment = NSTextAlignment.Left
            self.contentImage = UIImage(named: "chatfrom_bg_normal")
        }
       
        self.contentLabel.text = messageInfo.content
        self.contentLabel.font = UIFont(name:"Arial" , size: 14)
        self.contentLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        
        var  attributes = [NSFontAttributeName:self.contentLabel.font]
        
        var size = CGSizeMake(200,CGFloat.max)
        var rect = messageInfo.content.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: attributes, context: nil)
        var msgHeight = rect.size.height //rect.size.height < 30 ? 30 : rect.size.height
        let myInsets : UIEdgeInsets = UIEdgeInsetsMake(10, 25, 10, 25)
        contentImage?.resizableImageWithCapInsets(myInsets)

        var contentImageView   = UIImageView(image: contentImage!)
        contentImageView.frame =  CGRect(x: 66, y: 14, width: 246, height: 27)
        self.addSubview(contentImageView)
        self.addSubview(contentLabel)
        
        
        self.contentLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.avatar.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let viewsDictionary = ["left":self.contentLabel ,"right": self.avatar]
        
        //position constraints
        let view_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[left]-10-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let view_constraint_H2:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[right]-10-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)

        
        self.addConstraints(view_constraint_H)
        self.addConstraints(view_constraint_H2)

        
    }
    
    
}
