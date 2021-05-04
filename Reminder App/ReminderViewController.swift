//
//  ReminderViewController.swift
//  Reminder App
//
//  Created by KHOA NGUYEN on 4/15/21.
//
import FSCalendar
import UIKit
import Parse

class ReminderViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    

    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var timeScroll: UIDatePicker!
    @IBOutlet weak var calendar: FSCalendar!
   
    @IBOutlet weak var remindDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeScroll.datePickerMode = .dateAndTime
        timeScroll.preferredDatePickerStyle = .inline
        timeScroll.addTarget(self, action: #selector(handleTimeSelection), for: .valueChanged)
        

        // Do any additional setup after loading the view.
    }
    @objc func handleDateSelection(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en-gb")
        formatter.dateFormat = "hh:mm"
        remindDescription.text = formatter.string(from: sender.date)
        
    }
    @objc func handleTimeSelection(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en-gb")
        formatter.dateFormat = "dd MM YY"
        remindDescription.text = formatter.string(from: sender.date)
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
