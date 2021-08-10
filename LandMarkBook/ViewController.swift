//
//  ViewController.swift
//  LandMarkBook
//
//  Created by Alican Kurt on 9.08.2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
      
    @IBOutlet weak var landMarkTableView: UITableView!
    
    var landArray = [Land]()
    var choosenLand : Land?
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // we have to initilize to #self
        landMarkTableView.delegate = self
        landMarkTableView.dataSource = self
        
        // creating objects
        
        var info =  "Popular with locals and tourists alike, the Cinque Terre is truly worth the trip. You can reach this beautiful destination of five villages by car, train or boat."
        var cinque = Land(name: "Cinque Terre - Italy", info: info, image: UIImage(named: "cinqueterre")!)
        info = "A short bus ride from the outskirts of Kyoto, Arashiyama Bamboo Grove is known for its beauty, unique nature sounds and natural light."
        var arashiyama = Land(name: "Arashiyama Bamboo Grove - Japan", info: info, image: UIImage(named: "arashiyama")!)
        info = "Although this spectacular landscape includes the Rocky Mountains, the lakes in the area make Banff National Park special."
        var banff = Land(name: "Banff National Park - Canada", info: info, image: UIImage(named: "banff")!)
        info = "Known for its cone-shaped rock formations and stunning hot air balloon displays, this destination has become a well-deserved must-have on many travellers' lists."
        var kapadokya = Land(name: "Kapadokya - Turkey", info: info, image: UIImage(named: "kapadokya")!)
        info = "One of the most beautiful places in the world can be found in Tanzania, Africa."
        var kilimanjaro = Land(name: "Mount Kilimanjaro - Tanzania", info: info, image: UIImage(named: "klimanjaro")!)
        info = "The Cliffs of Moher have quickly become popular in recent years. All travelers should include the Cliffs of Moher on their must-see list when visiting Ireland."
        var moher = Land(name: "Cliffs of Moher - Ireland", info: info, image: UIImage(named: "moher")!)
                
     
        landArray.append(contentsOf: [cinque,arashiyama,banff,kapadokya,kilimanjaro,moher])
        
        navigationItem.title = "Land Mark Book"
        
        
        
        
    }
    
    
    // it make for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landArray[indexPath.row].name
        return cell
    }
    
    // there are how many row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landArray.count
    }
    
    // its use for edit such as delete,insert
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
            
    }
    
    // its use when you select a row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenLand = landArray[indexPath.row]
        performSegue(withIdentifier: "toDetailSegue", sender: nil)
    }
    
    // its use when you want to segue with variables
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailSegue"{
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedLand = choosenLand
        }
    }
    
    


}

