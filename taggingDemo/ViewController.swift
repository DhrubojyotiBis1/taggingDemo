//
//  ViewController.swift
//  taggingDemo
//
//  Created by Dhrubojyoti on 28/03/20.
//  Copyright © 2020 Dhrubojyoti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let segueId = "goToCatagoryPopup"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func selectCategoryButtonPressed(_ sender:UIButton){
        performSegue(withIdentifier: self.segueId, sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueId{
            let destination = segue.destination as! selectCategoryPopupViewController
            destination.delegate = self
        }
    }

}

extension ViewController:selectCategoryPopupProtocol{
    func selected(category selecdCategory: [selectedCatagory]) {
        print("category : ",selecdCategory.count)
    }
}

