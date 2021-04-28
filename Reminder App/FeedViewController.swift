//
//  FeedViewController.swift
//  Reminder App
//
//  Created by Tra-Vaughn James on 4/27/21.
//

import UIKit
import Parse

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
        let query = PFQuery(className: "Reminder")
        query.includeKey("author")
        query.limit = 20
        query.findObjectsInBackground { (reminderlist, error) in
            if reminderlist != nil {
                self.reminderlist = reminderlist!
                self.tableView.reloadData()
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
        //cell.taskTime.text = reminderlist["datetime"] as String!
        return cell
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
