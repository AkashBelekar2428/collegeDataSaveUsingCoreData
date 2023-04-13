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
    @IBOutlet weak var saveBtn:UIButton!
    
    var collageDetails:Collage?
    var isUpdate = false
    var indexRow = Int()
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        txtCollageName.text = collageDetails?.name
        txtCollageCity.text = collageDetails?.city
        txtCollageAddress.text = collageDetails?.address
        txtCollageUniversity.text = collageDetails?.university
    }
    override func viewWillAppear(_ animated: Bool) {
        if isUpdate{
            saveBtn.setTitle("UPDATE", for: .normal)
            
        }else{
            saveBtn.setTitle("SAVE", for: .normal)
        }

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
        if isUpdate{
            DataBaseHelper.sharedInstance.editCollegeData(collegeData: collageDic, index: indexRow)
            isUpdate = false
        }else{
            DataBaseHelper.sharedInstance.saveData(collageData: collageDic)
        }
       
    }
    
}
