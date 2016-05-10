//
//  TimePickerViewController.swift
//  Affirmations
//
//  Created by Paul Nichols on 4/27/16.
//  Copyright © 2016 Paul Nicholsen. All rights reserved.
//

import UIKit

class TimePickerViewController: UIViewController {

    @IBOutlet weak var earliestAffirmation: UIDatePicker!
    
    @IBOutlet weak var latestAffirmation: UIDatePicker!
    
    @IBOutlet weak var numberOfAffirmations: UITextField!
    
    @IBAction func scheduleAffirmations(sender: AnyObject) {
        let totalAffirmations = Double(numberOfAffirmations.text!)!
        let startTime = earliestAffirmation.date
        let endTime = latestAffirmation.date
        let totalTime = (endTime.timeIntervalSince1970 - startTime.timeIntervalSince1970) / 3600
        let affirmationBlockLength = (totalTime / totalAffirmations) * 3600
        var affirmationBlockStartTimes: [NSDate] = []
        for i in 1...Int(totalAffirmations) {
            affirmationBlockStartTimes.append(startTime.dateByAddingTimeInterval(affirmationBlockLength * Double(i)))
        }
        
        print(affirmationBlockStartTimes)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TimePickerViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    func dismissKeyboard() {
        self.numberOfAffirmations.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
