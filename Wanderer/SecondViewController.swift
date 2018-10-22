//
//  SecondViewController.swift
//  Wanderer
//
//  Created by Rob Munro on 21/10/2018.
//  Copyright © 2018 Rob Munro. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var cityPicker: UIPickerView!
    
    
    @IBOutlet weak var fromDatePicker: UIDatePicker!
    
    
    @IBOutlet weak var toDatePicker: UIDatePicker!
    
    
    @IBOutlet weak var nextThirdViewButton: UIButton!
    
    // temporay array for tsting - Populate with sqlite db extract
    
    var cityData = ["Please select city", "Beijing", "Calcutta", "Detroit", "Edinburgh", "Glasgow", "London", "Manchester", "New  York", "Rio de Janerio", "Washington"]
    
    // key variables and flags
    
    var cityPicked = false
    
    var fromTimePicked = false
    
    var toTimePicked = false
    
    var citySelected: String?
    
    var fromDate: Date?
    
    var toDate: Date?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fromDatePicker.minimumDate = Date()
        toDatePicker.minimumDate = Date()
        
        fromDate = Date()
        
        nextThirdViewButton.layer.cornerRadius = 15
        nextThirdViewButton.layer.masksToBounds = true
        
        cityPicker.delegate = self
        cityPicker.dataSource = self
        
        
        
    }
    
    //PickerView functions
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return cityData.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return cityData[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //check user has selcted a city from pickerview and set flags accordingly
        
        if self.cityData[row] != "Please select city" {
            
            self.citySelected = self.cityData[row]
            self.cityPicked = true
            
            
        } else {
            
            self.citySelected = "Please select city"
            self.cityPicked = false
        }
        
    }
    
    @IBAction func fromDatePicked(_ sender: Any) {
        
        fromDate = fromDatePicker.date
        
        if toTimePicked == true {
            
            checkDates(fromDate: fromDate!, toDate: toDate!)
        }
        fromTimePicked = true
        
    }
    
    
    @IBAction func toDatePicked(_ sender: Any) {
        
        toDate = toDatePicker.date
        
        checkDates(fromDate: fromDate!, toDate: toDate!)
        
    }
    
    //Function to check if 'to date' is earlier than 'from date' and issue alert
    
    func checkDates (fromDate: Date, toDate: Date) {
        
        switch toDate.compare(fromDate) {
            
        case .orderedDescending:
            toTimePicked = true
            
        case .orderedAscending:
            
            presentAlert(title: "Date Alert", message: "You can't travel back in time!")
            toTimePicked = false
            
        default: return
            
        }
        
    }
    
    
    // Function to move to third storyboard
    
    @IBAction func nextThirdViewButton(_ sender: Any) {
        
       if !(cityPicked && fromTimePicked && toTimePicked) {
            
            presentAlert(title: "You're not ready yet", message: "Please complete choices")
            
        } else {
            
            performSegue(withIdentifier: "thirdViewSeque", sender: nil)
            
        }
    
        
    }
        

    
    //reusable alert function
    
    func presentAlert(title: String, message: String) {
        
        let presentAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let dismissButton = UIAlertAction (title: "Dismiss", style: .cancel, handler: {
            
            (dateAlert: UIAlertAction) -> Void in
        })
        
        presentAlert.addAction(dismissButton)
        self.present(presentAlert, animated: true, completion: nil)
        
    }
    
    

}
