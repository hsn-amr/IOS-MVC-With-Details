//
//  PeopleDetailsViewController.swift
//  IOS MVC
//
//  Created by administrator on 24/12/2021.
//

import UIKit

class PeopleDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    
    var info: Result?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text! += info?.name ?? ""
        genderLabel.text! += info?.gender.rawValue ?? ""
        birthYearLabel.text! += info?.birthYear ?? ""
        massLabel.text! += info?.mass ?? ""
    }
    
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
