//
//  CollegeFormViewController.swift
//  CollegeData
//
//  Created by Akash Belekar on 12/04/23.
//

import UIKit

class CollegeFormViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var txtCollageName:UITextField!
    @IBOutlet weak var txtCollageCity: UITextField!
    @IBOutlet weak var txtCollageAddress: UITextField!
    @IBOutlet weak var txtCollageUniversity: UITextField!
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        
    } 
}
//MARK: Actions
extension CollegeFormViewController{
    @IBAction func saveData(_ sender: UIButton) {
        self.collageFormData()
    }
    @IBAction func backBtn(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    
}

//MARK: Methods
extension CollegeFormViewController{
    func collageFormData(){
        
        guard let collageName = txtCollageName.text else {return}
        guard let collageCity = txtCollageCity.text else {return}
        guard let collageAddress = txtCollageAddress.text else {return}
        guard let collageUniversity = txtCollageUniversity.text else {return}
        
        let collageDic = [ "collageName":collageName,"collageCity":collageCity,"collageAddress":collageAddress,"collageUniversity":collageUniversity
        ]
        DataBaseHelper.sharedInstance.saveData(collageData: collageDic)
    }
    
}
