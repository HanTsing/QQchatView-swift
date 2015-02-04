//
//  ChatRoomTableViewController.swift
//  QQchat
//
//  Created by hanqing on 2/1/15.
//  Copyright (c) 2015 hanqing. All rights reserved.
//

import UIKit

class ChatRoomTableViewController: UITableViewController {
    
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
        messages.append(MessageInfo(content: "sdfasdf",status: true))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: false))
        messages.append(MessageInfo(content: "sdfasdf",status: true))
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

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return messages.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath) as UITableViewCell
        var messageView = MessageView(messageInfo: messages[indexPath.row], frame: cell.frame)
         cell.contentView.addSubview(messageView)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
