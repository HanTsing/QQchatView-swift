//
//  ChatRoomViewController.swift
//  QQchat
//
//  Created by hanqing on 2/4/15.
//  Copyright (c) 2015 hanqing. All rights reserved.
// todo
//      3 横屏时      有点问题
//      4 tableview  动态计算间距



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
        messages.append(MessageInfo(content: "sdfasdf",status: true))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: true))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdfsdfasdfsdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: true))
        messages.append(MessageInfo(content: "777777777777777777777777777777777777777777",status: true))

        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dismissKeyboard:", name: UIKeyboardWillChangeFrameNotification, object: nil)
        
        
        var indexPath = NSIndexPath(forRow: messages.count-1, inSection:0)
        self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
        
    }
    
    @IBAction func sendMessage(sender: AnyObject) {
        if self.msgTextField.text != "" {
            var row = self.messages.count
            var indexPath = NSIndexPath(forRow:row, inSection:0)
            messages.append(MessageInfo(content: self.msgTextField.text, status: true))
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            self.msgTextField.text = ""
            self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
            
        }
    }
    
    
    @IBAction func cancleKeyboard(sender: UITapGestureRecognizer) {
        msgTextField.resignFirstResponder()
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
        //let cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath) as UITableViewCell
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reuse")
        var messageView = MessageView(messageInfo: messages[indexPath.row], frame: cell.frame)
        cell.contentView.addSubview(messageView)
        
        let viewsDictionary = ["msgView": messageView]
        
        let avatar_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|[msgView]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let avatar_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|[msgView]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        cell.contentView.addConstraints(avatar_constraint_H)
        cell.contentView.addConstraints(avatar_constraint_V)
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
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
