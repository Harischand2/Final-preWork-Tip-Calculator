//
//  tip__calculator_viewer.swift
//  Prework
//
//  Created by Adrian Harischand on 8/1/22.
//


import UIKit
class Tip__calculator_viewer : UIViewController
{
    
    @IBOutlet weak var amountBeforeTaxTXT : UITextField!
   
    @IBOutlet weak var tip_Control: UISegmentedControl!
    
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    
    @IBOutlet weak var eachPersonAmountLabel: UILabel!
    
    @IBOutlet weak var totalBillLabel : UILabel!
    
    
   
    
    // have keyboard pop up and have the amountbeforetax text field be my first responder
    override func viewDidLoad() {
        super.viewDidLoad()
        amountBeforeTaxTXT.becomeFirstResponder()
    }
    
    // helper method that get the tip percentage and the amountbefore tax
    // and then calculate the tip and totalbill
    func calculateBill()
    {
        let tipPercentages = [0.15, 0.18, 0.20]
    
        let getAmountBeforeTax = (amountBeforeTaxTXT.text! as NSString).doubleValue
        
        let tipAmount = getAmountBeforeTax * tipPercentages[tip_Control.selectedSegmentIndex]
        let totalAmount =
        tipAmount + getAmountBeforeTax
        
        let numberOfPeople: Int = Int (numberOfPeopleSlider.value)
        totalBillLabel.text = String(format: "$%0.2f", totalAmount)
        
        eachPersonAmountLabel.text = String(format: "$%0.2f", tipAmount / Double(numberOfPeople))
        
       
       
    }
    
    
    // connects the UI to the code and when changes occured in the
    // amountBeforetax TEXT FIELD it sends the info so that
    // new calculation can be made
    @IBAction func amountBeforeTaxTXTChanged ( sender: Any)
    {
        calculateBill()
        
    }
    
    // connects the UI to the code and when changes occured in the
    // tipPercentage segment control sends the info so that
    // new calculation can be made
    
    @IBAction func TipControl(_ sender: Any) {
        calculateBill()
    }
    
    //  As the slider moves it changes and display the number of people
    // and also to get right away calculation of the totalBill and tip
    @IBAction func numberOfPeopleSliderValueChanged ( sender: Any)
    {
        
        numberOfPeopleLabel.text = "SPLIT: \(Int(numberOfPeopleSlider.value))"
        calculateBill()
    }
    
    
    // resets the UI so that it is easier for the user to make quick changes
    @IBAction func Reset(_ sender: Any)
       {
         
             amountBeforeTaxTXT.text = "0.00"
             numberOfPeopleSlider.value = 1
             numberOfPeopleLabel.text = "SPLIT: 1"
             tip_Control.selectedSegmentIndex = 0
             eachPersonAmountLabel.text = "$0.00"
             totalBillLabel.text = "$0.00"
          
       }
    }
  
    
    
    
    
