//
//  DetailViewController.swift
//  LandMarkBook
//
//  Created by Alican Kurt on 9.08.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var landImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    var selectedLand : Land?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedLand?.name
        infoLabel.text = selectedLand?.info
        landImageView.image = selectedLand?.image
        
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
