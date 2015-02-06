//
//  Message.swift
//  QQchat
//
//  Created by hanqing on 2/1/15.
//  Copyright (c) 2015 hanqing. All rights reserved.
//  问题1  每个cell创建的时候都会新建 messageView  会不会有性能问题
//  问题2  用tableview  在sb中不能在底部拖入一个uiview？
//  问题3  cell现在不是 复用的
//  问题4  图片切片
//  didset

import UIKit

class MessageView: UIView {
    
    var avatar: UIImageView!
    var contentLabel: UILabel!
    var contentImageView: UIImageView!
    var messageInfo: MessageInfo!
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    init(messageInfo: MessageInfo, frame: CGRect) {
        super.init(frame:frame)
        self.messageInfo = messageInfo
        setChatMsgView()
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setChatMsgView(){
        
        var contentImage = messageInfo.status ? UIImage(named: "chatto_bg_normal") : UIImage(named: "chatfrom_bg_normal")
        self.contentImageView = UIImageView(image: contentImage)
        self.addSubview(contentImageView)
        
        self.avatar = UIImageView()
        self.avatar.image =  messageInfo.status ? UIImage(named: "icon02") : UIImage(named: "icon01")
        self.addSubview(avatar)
        
        self.contentLabel = UILabel()
        self.contentLabel.textAlignment = messageInfo.status ? NSTextAlignment.Right : NSTextAlignment.Left
        
        self.contentLabel.text = messageInfo.content
        self.contentLabel.font = UIFont(name:"Arial" , size: 14)
        self.contentLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.contentLabel.numberOfLines = 0
        self.contentImageView.addSubview(contentLabel)
        
        var rect: CGRect = dynamicCaculateLabelRect()
        
        let myInsets : UIEdgeInsets = UIEdgeInsetsMake(10, 30, 10, 30)
        self.contentImageView.image?.resizableImageWithCapInsets(myInsets)
        
        self.avatar.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.contentLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.contentImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        addConstraintsToView(rect)
    }
    
    func dynamicCaculateLabelRect() -> CGRect{
        var size = CGSizeMake(200,CGFloat.max)
        var attributes = [NSFontAttributeName: self.contentLabel.font]
        var contentText:NSString = self.contentLabel.text as NSString!
        var rect = contentText.boundingRectWithSize(size, options:.UsesLineFragmentOrigin, attributes: attributes, context:nil)
        return rect
    }
    
    
    func addConstraintsToView(rect: CGRect){
        let viewsDictionary = ["avatar": avatar, "label": contentLabel, "image": contentImageView]
        var avatar_constraint_H_Format =  ""
        var avatar_constraint_V_Format =  ""
        var image_constraint_H_Format  =  ""
        var image_constraint_V_Format  =  ""
        var image_constraint_H1_Format =  ""
        var image_constraint_V1_Format =  ""
        var label_constraint_H_Format  =  ""
        var label_constraint_V_Fromat  =  ""
        
        if messageInfo.status {
            avatar_constraint_H_Format =  "[avatar(50)]-5-|"
            avatar_constraint_V_Format =  "V:|-5-[avatar(50)]"
            image_constraint_H_Format  =  "[image]-10-[avatar]"
            image_constraint_V_Format  =  "V:|-5-[image]"
            image_constraint_H1_Format =  "[image(\(rect.size.width + 35))]"
            image_constraint_V1_Format =  "V:[image(\(rect.size.height + 20))]"
            label_constraint_H_Format  =  "|-5-[label]-25-|"
            label_constraint_V_Fromat  =  "V:|[label]-5-|"
        } else {
            avatar_constraint_H_Format =  "|-5-[avatar(50)]"
            avatar_constraint_V_Format =  "V:|-5-[avatar(50)]"
            image_constraint_H_Format  =  "[avatar]-10-[image]"
            image_constraint_V_Format  =  "V:|-5-[image]"
            image_constraint_H1_Format =  "[image(\(rect.size.width + 35))]"
            image_constraint_V1_Format =  "V:[image(\(rect.size.height + 20))]"
            label_constraint_H_Format  =  "|-25-[label]-5-|"
            label_constraint_V_Fromat  =  "V:|-5-[label]|"
        }
        
        
        let avatar_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(avatar_constraint_H_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let avatar_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(avatar_constraint_V_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        let image_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(image_constraint_H_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let image_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(image_constraint_V_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        let image_constraint_H1:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(image_constraint_H1_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let image_constraint_V1:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(image_constraint_V1_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        let label_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(label_constraint_H_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let label_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(label_constraint_V_Fromat, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
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
