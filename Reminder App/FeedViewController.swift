//
//  FeedViewController.swift
//  Reminder App
//
//  Created by Tra-Vaughn James on 4/27/21.
//

import UIKit
import UserNotifications
import Parse
import Foundation

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    var reminderlist = [PFObject]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchReminders()
        
    }
    
    func fetchReminders() {
        let query = PFQuery(className: "Reminder")
        query.includeKey("author")
        query.includeKey("datetime")
        query.whereKey("author", equalTo: PFUser.current())
        query.limit = 20
        query.findObjectsInBackground { (reminderlist, error) in
            if reminderlist != nil {
                self.reminderlist = reminderlist!
                self.reminderlist.reverse()
                self.tableView.reloadData()
                print(reminderlist)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminderlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListReminderTableViewCell") as! ListReminderTableViewCell
        let reminder = reminderlist[indexPath.row]
        cell.listTask.text = reminder["description"] as? String
        cell.taskTime.text = formatDate(Date: reminder["datetime"])

        return cell
    }

//        print(reminder["datetime"], "this is date" )
//        print(type(of: reminder["datetime"]), "this is type")
//        return cell
////
    
    
 
    func formatDate(Date : Any?) -> String {
        if let dD = Date as? Date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM dd yyyy - h:mm"
            let str = dateFormatter.string(from: dD)
            print("Depart date \(str)")
            return str
        }
        return ""
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
            let main = UIStoryboard(name: "Main", bundle: nil)
            let loginViewController = main.instantiateViewController(identifier: "LoginViewController")
            let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
            delegate.window?.rootViewController = loginViewController
    }
}
