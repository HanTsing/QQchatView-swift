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
    var contentImageView: UIImageView!

    
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
            setSelfChatMsgView(messageInfo)
        } else {
           setOtherChatMsgView(messageInfo)
        }
    }


    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setSelfChatMsgView(messageInfo: MessageInfo){
        
        var contentImage = UIImage(named: "chatto_bg_normal")
        self.contentImageView = UIImageView(image: contentImage)
        self.addSubview(contentImageView)
        
        self.avatar = UIImageView()
        self.avatar.image = UIImage(named: "icon02")
        self.addSubview(avatar)
        
        self.contentLabel = UILabel()
        self.contentLabel.textAlignment = NSTextAlignment.Right
        
        self.contentLabel.text = messageInfo.content
        self.contentLabel.font = UIFont(name:"Arial" , size: 14)
        self.contentLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.contentLabel.numberOfLines = 0
        self.contentImageView.addSubview(contentLabel)
        
        
        var size = CGSizeMake(200,CGFloat.max)
        var attributes = [NSFontAttributeName: self.contentLabel.font]
        var contentText:NSString = self.contentLabel.text as NSString!
        var rect = contentText.boundingRectWithSize(size, options:.UsesLineFragmentOrigin, attributes: attributes, context:nil)
        var msgHeight: CGFloat = rect.size.height
        
        let myInsets : UIEdgeInsets = UIEdgeInsetsMake(10, 30, 10, 30)
        self.contentImageView.image?.resizableImageWithCapInsets(myInsets)

  
        
        self.avatar.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.contentLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.contentImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let viewsDictionary = ["avatar": avatar, "label": contentLabel, "image": contentImageView]
        
        
        let avatar_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("[avatar(50)]-5-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let avatar_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|-5-[avatar(50)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        let image_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("[image]-10-[avatar]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let image_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|-5-[image]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        let image_constraint_H1:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("[image(\(rect.size.width + 35))]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let image_constraint_V1:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:[image(\(msgHeight + 20))]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
      

        let label_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("|-5-[label]-25-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let label_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|[label]-5-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
    
        
        self.addConstraints(avatar_constraint_H)
        self.addConstraints(avatar_constraint_V)
        self.addConstraints(image_constraint_H)
        self.addConstraints(image_constraint_V)
        self.addConstraints(image_constraint_H1)
        self.addConstraints(image_constraint_V1)
        self.contentImageView.addConstraints(label_constraint_H)
        self.contentImageView.addConstraints(label_constraint_V)
          
    }
    
    func setOtherChatMsgView(messageInfo: MessageInfo){
       
        var contentImage = UIImage(named: "chatfrom_bg_normal")
        self.contentImageView = UIImageView(image: contentImage)
        self.addSubview(contentImageView)
        
        self.avatar = UIImageView()
        self.avatar.image = UIImage(named: "icon01")
        self.addSubview(avatar)
        
        self.contentLabel = UILabel()
        self.contentLabel.textAlignment = NSTextAlignment.Left
        
        self.contentLabel.text = messageInfo.content
        self.contentLabel.font = UIFont(name:"Arial" , size: 14)
        self.contentLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.contentLabel.numberOfLines = 0
        self.contentImageView.addSubview(contentLabel)
        
        
        var size = CGSizeMake(200,CGFloat.max)
        var attributes = [NSFontAttributeName: self.contentLabel.font]
        var contentText:NSString = self.contentLabel.text as NSString!
        var rect = contentText.boundingRectWithSize(size, options:.UsesLineFragmentOrigin, attributes: attributes, context:nil)
        var msgHeight: CGFloat = rect.size.height
        
        let myInsets : UIEdgeInsets = UIEdgeInsetsMake(10, 30, 10, 30)
        self.contentImageView.image?.resizableImageWithCapInsets(myInsets)
        

        self.avatar.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.contentLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.contentImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let viewsDictionary = ["avatar": avatar, "label": contentLabel, "image": contentImageView]
        
        
        let avatar_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("|-5-[avatar(50)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let avatar_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|-5-[avatar(50)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        let image_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("[avatar]-10-[image]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let image_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|-5-[image]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        let image_constraint_H1:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("[image(\(rect.size.width + 35))]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let image_constraint_V1:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:[image(\(msgHeight + 20))]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        
        
        let label_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("|-25-[label]-5-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let label_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|-5-[label]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        
        
        self.addConstraints(avatar_constraint_H)
        self.addConstraints(avatar_constraint_V)
        self.addConstraints(image_constraint_H)
        self.addConstraints(image_constraint_V)
        self.addConstraints(image_constraint_H1)
        self.addConstraints(image_constraint_V1)
        self.contentImageView.addConstraints(label_constraint_H)
        self.contentImageView.addConstraints(label_constraint_V)
        
    }
    
    
    
    
}
