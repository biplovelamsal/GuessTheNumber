//
//  ViewController.swift
//  GuessMyNumber
//
//  Created by biplove lamsal on 2/14/22.
//

import UIKit

class ViewController: UIViewController {
    
   var randomInt = Int.random(in: 0..<100)
    
    var timer: Timer = Timer()
    var counter:Int = 31
    var a:String = "Button Pressed: "
    var b:String = "Sorry, it was  "
    var c:String = "Yes, it is "
    var counter1:Int = 0

    
    
    
    @IBOutlet weak var MainTimer: UILabel!
    
    
    
    
    @IBOutlet weak var ButtonPressed: UILabel!
    
    
    @IBOutlet weak var Result: UILabel!
    
    
    @IBOutlet weak var UserInput: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
   
    @IBAction func ButtonCount(_ sender: Any) {
       
        
        let mint = UserInput.text
        
        let mint2 = Int(mint!)
        
        
        
        if (counter1>5){
         //  counter1 = counter1
            ButtonPressed.text = String("")
        }
        if(counter<30){
            counter1 = counter1 + 1
            ButtonPressed.text = a + String(counter1)}
        if(counter1==5){
            Result.text = String(b)+String(randomInt)
            timer.invalidate()
            
        }
        if(counter1>5){
            ButtonPressed.text=String("Number exceded")
        }
        
        
        if(counter1<5){
            Result.text=String("Wrong ")+String(counter1)
        }
        
        
        if(mint2==randomInt){
            Result.text=c+String(randomInt)
            timer.invalidate()
        }
        if(counter1==6){
            Result.text=b + String(randomInt)
        }
        if(randomInt==mint2){
            ButtonPressed.text = String("")
        }
        

        
        
    }
    
    
    @IBAction func start(){
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeCounter), userInfo: nil, repeats: true)
        
        
        
       
        
        
    }
    
    
    @objc func timeCounter()-> Void{
        
            
            counter-=1
        MainTimer.text = String(counter)
        if(counter==0){
            Result.text = String(b) + String(randomInt)
            timer.invalidate()
            
        }
        if counter==0 || counter1==5{
            ButtonPressed.text = String("Game ended , Press replay to play again")
        }
    
       //if(counter == 7 || counter1==5){
           // label2.text = String(a)
           // timer.invalidate()
        
        if(counter==0){
            counter1 = counter1 + 5
        }
            
       // }
    
      
}
    
    
    @IBAction func ResetAll(_ sender: Any) {
        
        counter = 30
        MainTimer.text=String(counter)
        timer.invalidate()
    
        Result.text = String("")
        ButtonPressed.text = String("")
        counter1 = 0
        
        randomInt = Int.random(in: 0..<100)
 
        UserInput.text = String("")
    

}
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
