//
//  ViewController.swift
//  LandMarkBook
//
//  Created by Alican Kurt on 9.08.2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
      
    @IBOutlet weak var landMarkTableView: UITableView!
    var landMarkNames = [String]()
    var landMarkInfo = [String]()
    var landMarkImages = [UIImage]()
    
    var selectedLandName = ""
    var selectedLandInfo = ""
    var selectedLandImage = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // we have to initilize to #self
        landMarkTableView.delegate = self
        landMarkTableView.dataSource = self
        
        landMarkNames.append("Cinque Terre - Italy")
        landMarkNames.append("Arashiyama Bamboo Grove - Japan")
        landMarkNames.append("Banff National Park - Canada")
        landMarkNames.append("Kapadokya - Turkey")
        landMarkNames.append("Mount Kilimanjaro - Tanzania")
        landMarkNames.append("Cliffs of Moher - Ireland")
        
        
        landMarkInfo.append("Popular with locals and tourists alike, the Cinque Terre is truly worth the trip. You can reach this beautiful destination of five villages by car, train or boat.")
        landMarkInfo.append("A short bus ride from the outskirts of Kyoto, Arashiyama Bamboo Grove is known for its beauty, unique nature sounds and natural light.")
        landMarkInfo.append("Although this spectacular landscape includes the Rocky Mountains, the lakes in the area make Banff National Park special.")
        landMarkInfo.append("Known for its cone-shaped rock formations and stunning hot air balloon displays, this destination has become a well-deserved must-have on many travellers' lists.")
        landMarkInfo.append("One of the most beautiful places in the world can be found in Tanzania, Africa.")
        landMarkInfo.append("The Cliffs of Moher have quickly become popular in recent years. All travelers should include the Cliffs of Moher on their must-see list when visiting Ireland.")
        
        landMarkImages.append(UIImage(named: "cinqueterre")!)
        landMarkImages.append(UIImage(named: "arashiyama")!)
        landMarkImages.append(UIImage(named: "banff")!)
        landMarkImages.append(UIImage(named: "kapadokya")!)
        landMarkImages.append(UIImage(named: "klimanjaro")!)
        landMarkImages.append(UIImage(named: "moher")!)
        
        navigationItem.title = "Land Mark Book"
        
        
        
        
    }
    
    
    // it make for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landMarkNames[indexPath.row]
        return cell
    }
    
    // there are how many row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNames.count
    }
    
    // its use for edit such as delete,insert
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landMarkNames.remove(at: indexPath.row)
            landMarkInfo.remove(at: indexPath.row)
            landMarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
            
    }
    
    // its use when you select a row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedLandName = landMarkNames[indexPath.row]
        selectedLandInfo = landMarkInfo[indexPath.row]
        selectedLandImage = landMarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toDetailSegue", sender: nil)
    }
    
    // its use when you want to segue with variables
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailSegue"{
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedLandName = selectedLandName
            destinationVC.selectedLandInfo = selectedLandInfo
            destinationVC.selectedLandImage = selectedLandImage
        }
    }
    
    


}

