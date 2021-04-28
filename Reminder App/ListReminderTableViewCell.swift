//
//  ListReminderTableViewCell.swift
//  Reminder App
//
//  Created by Tra-Vaughn James on 4/27/21.
//

import UIKit

class ListReminderTableViewCell: UITableViewCell {
    

    @IBOutlet weak var taskTime: UILabel!
    @IBOutlet weak var listTask: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
