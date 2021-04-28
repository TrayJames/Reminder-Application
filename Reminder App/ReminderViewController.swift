//
//  ReminderViewController.swift
//  Reminder App
//
//  Created by KHOA NGUYEN on 4/15/21.
//
import FSCalendar
import UIKit
import Parse

<<<<<<< HEAD
class ReminderViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    

    
    @IBOutlet weak var timeScroll: UIDatePicker!
    
=======
class ReminderViewController: UIViewController {

>>>>>>> a967145a4452a907b84856132f1856858ffcdcbf
    @IBOutlet weak var calendar: FSCalendar!
    
   
    @IBOutlet weak var remindDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        calendar.dataSource = self
        calendar.delegate = self
        timeScroll.datePickerMode = .time
        

        // Do any additional setup after loading the view.
    }

    
    
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
    
    //func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        //formatter.dateFormat = "dd-MM-YYYY"'
        //guard let eventDate = formatter.date(fro)
    //}

    @IBAction func addTask(_ sender: Any) {
        let remind = PFObject(className: "Reminder")
        remind["description"] = remindDescription.text!
        //remind["time"] =
        //remind["date"] = datestring
        remind["author"] = PFUser.current()!
        remind.saveInBackground{ (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            } else {
                print("error!")
            }
        }
        
       
    }
    func calendarCurrentPageDidChange(_ calendar: FSCalendar, didSelect date: Date, at monthPosit: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-YYYY"
        let datestring = formatter.string(from: date)
        print(datestring)
    }
    
=======
        // Do any additional setup after loading the view.
    }
        
>>>>>>> a967145a4452a907b84856132f1856858ffcdcbf
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}



