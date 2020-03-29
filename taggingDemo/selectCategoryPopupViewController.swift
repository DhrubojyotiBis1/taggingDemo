//
//  selectCategoryPopupViewController.swift
//  taggingDemo
//
//  Created by Dhrubojyoti on 29/03/20.
//  Copyright © 2020 Dhrubojyoti. All rights reserved.
//

import UIKit
protocol selectCategoryPopupProtocol {
    func selected(category:[selectedCatagory])
}

class selectCategoryPopupViewController: UIViewController {

    var delegate:selectCategoryPopupProtocol?
    var selecteCategories = [selectedCatagory]()
    
    @IBOutlet weak var popupView:UIView!
    @IBOutlet var categoryList:[UIView]!
    @IBOutlet var selectImage:[UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setup()
    }
    
    @IBAction private func nextButtonPressed(_ sender:UIButton){
        if self.selecteCategories.count > 0{
            self.dismiss(animated: true) {
                self.delegate?.selected(category: self.selecteCategories)
            }
        }
    }
    
    @IBAction private func cancelButtonPressed(_ sender:UIButton){
        self.dismiss(animated: true, completion: nil)
    }

}

extension selectCategoryPopupViewController{
    //For all private functions
    private func setup(){
        self.popupView.layer.cornerRadius = 10
        print(self.categoryList.count)
        
        for tag in 0..<self.categoryList.count{
            self.setGesture(withTag: tag)
        }
    }
    
    private func setGesture(withTag tag:Int){
        var tapGesture = UITapGestureRecognizer()
        switch tag {
        case 0:
            tapGesture = UITapGestureRecognizer(target: self, action: #selector(onGametap))
            break
        case 1:
            tapGesture = UITapGestureRecognizer(target: self, action: #selector(onAnimationtap))
            break
        case 2:
            tapGesture = UITapGestureRecognizer(target: self, action: #selector(onStorytap))
        break
        case 3:
            tapGesture = UITapGestureRecognizer(target: self, action: #selector(onMusictap))
        break
        case 4:
            tapGesture = UITapGestureRecognizer(target: self, action: #selector(onArttap))
        break
        case 5:
            tapGesture = UITapGestureRecognizer(target: self, action: #selector(onExperimentaltap))
        break
        case 6:
            tapGesture = UITapGestureRecognizer(target: self, action: #selector(onOtherstap))
        break
        default:
            break
        }
        
        categoryList[tag].addGestureRecognizer(tapGesture)
    }
    
    @objc private func onGametap(){
        let categorySelected = selectedCatagory()
        categorySelected.category = .game
        self.checkSelectedCategory(forTag: 0, selectedCategort: categorySelected)
    }
    
    @objc private func onAnimationtap(){
        let categorySelected = selectedCatagory()
        categorySelected.category = .animation
        self.checkSelectedCategory(forTag: 1, selectedCategort: categorySelected)
    }
    
    @objc private func onStorytap(){
        let categorySelected = selectedCatagory()
        categorySelected.category = .story
        self.checkSelectedCategory(forTag: 2, selectedCategort: categorySelected)
    }
    
    @objc private func onMusictap(){
        let categorySelected = selectedCatagory()
        categorySelected.category = .music
        self.checkSelectedCategory(forTag: 3, selectedCategort: categorySelected)
    }
    
    @objc private func onArttap(){
        let categorySelected = selectedCatagory()
        categorySelected.category = .art
        self.checkSelectedCategory(forTag: 4, selectedCategort: categorySelected)
    }
    
    @objc private func onExperimentaltap(){
        let categorySelected = selectedCatagory()
        categorySelected.category = .experimental
        self.checkSelectedCategory(forTag: 5, selectedCategort: categorySelected)
    }
    
    @objc private func onOtherstap(){
        let categorySelected = selectedCatagory()
        categorySelected.category = .others
        self.checkSelectedCategory(forTag: 6, selectedCategort: categorySelected)
    }
    
    private func checkSelectedCategory(forTag tag:Int, selectedCategort:selectedCatagory){
        for index in 0..<self.selecteCategories.count{
            if self.selecteCategories[index].category == selectedCategort.category{
                self.selecteCategories.remove(at: index)
                self.selectImage[tag].image = UIImage(systemName: "circle")
                return
            }
        }
        self.selecteCategories.append(selectedCategort)
        self.selectImage[tag].image = UIImage(systemName: "checkmark.circle")
    }
}
