//
//  DetailViewController.swift
//  CurrrencyApp
//
//  Created by admin on 14/06/16.
//  Copyright © 2016 onyangowilly. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
 var detailDescription = ""

    var detailItem: Currency? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail:Currency = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.rates
            }
        }
    }
    
    override func viewDidLoad() {
                super.viewDidLoad()
        detailDescriptionLabel.text = detailDescription
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

