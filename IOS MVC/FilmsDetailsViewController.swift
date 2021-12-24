//
//  FilmsDetailsViewController.swift
//  IOS MVC
//
//  Created by administrator on 24/12/2021.
//

import UIKit

class FilmsDetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UILabel!
    
    var info: FilmResult?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text! += info?.title ?? ""
        releaseDateLabel.text! += info?.releaseDate ?? ""
        directorLabel.text! += info?.director ?? ""
        openingCrawlLabel.text! += info?.openingCrawl ?? ""
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
