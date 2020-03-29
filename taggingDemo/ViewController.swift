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

extension ViewController{
    //For all private function
    private func showMessage(withSelectedCategory selectedCategory:[selectedCatagory]){
        
        let message:String! = createMessage(forSelectedCategory: selectedCategory)
        
        let alert = UIAlertController(title: "You selected", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private  func createMessage(forSelectedCategory selectCategory:[selectedCatagory])->String{
        
        var message:String = ""
        var counter:Int = 0
        
        for selectedCategory in selectCategory{
            counter += 1
            switch selectedCategory.category {
            case .game:
                message += "\(counter). Game \n"
                break;
                case .animation:
                message += "\(counter). Animation \n"
                break;
                case .story:
                message += "\(counter). Story \n"
                break;
                case .music:
                message += "\(counter). Music \n"
                break;
                case .art:
                message += "\(counter). Art \n"
                break;
                case .experimental:
                message += "\(counter). Experinemtal \n"
                break;
                case .others:
                message += "\(counter). Others \n"
                break;
            default:
                break
            }
            
        }
        
        return message
    }
}

extension ViewController:selectCategoryPopupProtocol{
    func selected(category selecdCategory: [selectedCatagory]) {
        self.showMessage(withSelectedCategory: selecdCategory)
    }
}

