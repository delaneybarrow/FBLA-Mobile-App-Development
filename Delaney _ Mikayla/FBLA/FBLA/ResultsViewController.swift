//
//  ResultsViewController.swift
//  FBLA
//
//  Created by Delaney Barrow on 3/26/19.
//  Copyright © 2019 Delaney Barrow. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    //IBOutlets for result page to change the number  correct
    @IBOutlet weak var resultsMessageLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //variables to keep track of the number of questions answered correctly as well as the total number of questions
    var noCorrect: Int = 0
    var total: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "You got \(noCorrect) out of \(total)"
        
        resultsMessageLabel.text = "Great Job!!"

        // Do any additional setup after loading the view.
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
