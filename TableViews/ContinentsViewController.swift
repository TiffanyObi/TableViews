//
//  ContinentsViewController.swift
//  TableViews
//
//  Created by Tiffany Obi on 11/12/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ContinentsViewController: UIViewController {

   
    @IBOutlet weak var tableView: UITableView!
    
    private var continents = [[Country]]() {
        didSet{ //property observer gets called when continent is changed or set
            tableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
       dump(Country.getSections())
        
    }


func loadData() {
    continents = Country.getSections()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepareforsegue")
        // here is where we will pass data from this view controller to the countryDetailVC
        
        // we will pass the selected country to the CountryDetailVC
        // on a segue theres a source property and a destination property
        
        guard let countryDVC = segue.destination as? CountryDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            return // exits function
        }
        
        countryDVC.country = continents[indexPath.section][indexPath.row]
    }
    
}


extension ContinentsViewController: UITableViewDataSource {
    
    // REQUIRED METHOD 1
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        
        return continents[section].count
    }
    
    
    // REQUIRED METHOD 2
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //step.1 = get a cell using dequeue
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        // we need the current index at the current indexPath.
        
        let country = continents[indexPath.section][indexPath.row]
        
        // if we have an [[]], we do [indexpath.sec][indexpath.row]
        
        //configure cell
        cell.textLabel?.text = country.name
        cell.imageView?.image = UIImage(named: "\(country.thumbnailImageName)")
        cell.detailTextLabel?.text = country.description
        
        //cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       
        
        return continents.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return continents[section].first?.continent
    }
}
