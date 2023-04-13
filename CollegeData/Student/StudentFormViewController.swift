//
//  StudentFormViewController.swift
//  CollegeData
//
//  Created by Akash Belekar on 13/04/23.
//

import UIKit

class StudentFormViewController: UIViewController {
    @IBOutlet weak var txtName:UITextField!
    @IBOutlet weak var txtEmail:UITextField!
    @IBOutlet weak var txtPhone:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func saveStudentDataPressed(_ sender:UIButton){
        guard let studentName = txtName.text else{return}
        guard let studentEmail = txtEmail.text else{return}
        guard let studentPhone = txtPhone.text else{return}
        
        let studentDic = [
            "studentName":studentName,
            "studentEmail":studentEmail,
            "studentPhone":studentPhone
        ]
        DataBaseHelper.sharedInstance.getStudentData(studentData: studentDic)
    }
    @IBAction func backBtn(){
        dismiss(animated: true)
    }
   

}
