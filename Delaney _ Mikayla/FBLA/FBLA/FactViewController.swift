//
//  FactViewController.swift
//  FBLA
//
//  Created by Delaney Barrow on 3/26/19.
//  Copyright © 2019 Delaney Barrow. All rights reserved.
//

import UIKit

class FactViewController: UIViewController {

    @IBOutlet weak var recommendationLabel: UILabel!
    
    var currentPosition: Int = 0
    //array that holds all the facts
    var recommendations: [String] = ["FBLA is the largest career student business organization in the world.", "There is membership in the High School Division of FBLA-PBL in 47 states and in over 7 countries.", "There are over 70 competitions spanning 10 career clusters in the High School Division of FBLA-PBL.", "The National Business Education Association was the original sponsoring group for FBLA.", "The first FBLA National Leadership Conference was held in Chicago, Illinois.", "November is National Education for Business month.", "Members work with the March of Dimes to help end premature births by participating in awareness campaigns in the March for babies fundraiser.", "Members create career portfolio's, enhance their knowledge with world recognize skills certifications, and have access to select college scholarships.", "FBLA-PBL is governed by a set of bylaws, defined and interpreted by the FBLA-PBL board of directors. Each state chapter and local chapter also operates under a set of outlaws.", "One of FBLA’s main goals is to develop competent, aggressive business leadership."]
    var arrayLength = 0
    
    //takes a random fact from the array
    func getRecommendation() {
        arrayLength = recommendations.count
        currentPosition = Int(arc4random_uniform(UInt32(arrayLength)))
        
        recommendationLabel.text = recommendations[currentPosition]
    }
    
    @IBAction func newRecommendation(_ sender: Any) {
        getRecommendation()
    }
    
    //changes fact when the phone is shake 
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        getRecommendation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
