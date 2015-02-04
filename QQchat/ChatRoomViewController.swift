//
//  ChatRoomViewController.swift
//  QQchat
//
//  Created by hanqing on 2/4/15.
//  Copyright (c) 2015 hanqing. All rights reserved.
//

import UIKit

class ChatRoomViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var messages: [MessageInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: true))
        messages.append(MessageInfo(content: "777777777777777777777777777777777777777777777777777777777777777777777777777",status: true))
        self.tableView.rowHeight = UITableViewAutomaticDimension
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
        return 60.0
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
