//
//  CountryDetailViewController.swift
//  TableViews
//
//  Created by Tiffany Obi on 11/12/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    //expectedData is a country object
    // this property gets set in the prepareForSegue method
    //from the ContinentsViewController
    
    var country: Country! // the ! initializes country
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageview.image = UIImage(named: "\(country.fullImageName)")
        title = country.name
    }
    

    

}
