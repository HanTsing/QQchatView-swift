//
//  ChatRoomViewController.swift
//  QQchat
//
//  Created by hanqing on 2/4/15.
//  Copyright (c) 2015 hanqing. All rights reserved.
// todo 1 发送完消息  屏幕到最底部
//      2 点击空白    键盘消失
//      3 横屏时      有点问题
//      4 tableview  动态计算间距
//      5 bug        拖动cell时 空白
//      6 bug        拖动有问题


import UIKit

class ChatRoomViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var msgTextField: UITextField!
    
    var messages: [MessageInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: true))
        messages.append(MessageInfo(content: "777777777777777777777777777777777777777777",status: true))
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardShow", name: UIKeyboardDidShowNotification, object: nil)
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardHide", name: UIKeyboardDidHideNotification, object: nil)
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardChange", name: UIKeyboardDidChangeFrameNotification, object: nil)
        self.tableView.estimatedRowHeight = 30
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dismissKeyboard:", name: UIKeyboardWillChangeFrameNotification, object: nil)
        
    }
    
    @IBAction func sendMessage(sender: AnyObject) {
        if self.msgTextField.text != "" {
            var row = self.messages.count
            var indexPath = NSIndexPath(forRow:row, inSection:0)
            messages.append(MessageInfo(content: self.msgTextField.text, status: true))
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            self.msgTextField.text = ""
            self.msgTextField.isFirstResponder()
            

//            self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
            
        }
    }
    
    
    @IBAction func cancleKeyboard(sender: UIControl) {
        print("==============================")
        self.msgTextField.resignFirstResponder()
    }
    
    
    func dismissKeyboard(notify: NSNotification) {
        
        let userInfo = notify.userInfo!
        
        let durationKey = userInfo[UIKeyboardAnimationDurationUserInfoKey] as Double
        let keyboardFrameCGRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue()
        let transformY = keyboardFrameCGRect.origin.y - view.bounds.height
        
        UIView.animateWithDuration(durationKey, animations: { () -> Void in
            self.view.transform = CGAffineTransformMakeTranslation(0, transformY)
        })
    }
    
    
    override func viewWillDisappear(animated: Bool) {
       NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath) as UITableViewCell
        var messageView = MessageView(messageInfo: messages[indexPath.row], frame: cell.frame)
        cell.contentView.addSubview(messageView)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30
    }
        
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      return 1
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
