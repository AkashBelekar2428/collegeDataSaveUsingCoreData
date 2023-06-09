//
//  CollegeDetailsViewController.swift
//  CollegeData
//
//  Created by Akash Belekar on 13/04/23.
//

import UIKit

class CollegeDetailsViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var collegeNameLbl:UILabel!
    @IBOutlet weak var collegeCityLbl:UILabel!
    @IBOutlet weak var collegeAddressLbl:UILabel!
    @IBOutlet weak var collegeUniversityLbl:UILabel!
    @IBOutlet weak var studentLbl:UILabel!
    
    var collegeDetails:Collage!
    var index = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        studentLbl.isUserInteractionEnabled = true
        studentLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(studentLblTapped(_ :))))

    }
    @objc func studentLblTapped(_ sender:UITapGestureRecognizer){
       let studentVc = StudentListViewController()
        studentVc.modalPresentationStyle = .fullScreen
        present(studentVc, animated: true)

    }

    override func viewWillAppear(_ animated: Bool) {
        collegeNameLbl.text =  "name: \(collegeDetails.name ?? "")"
        collegeCityLbl.text = "city: \(collegeDetails.city ?? "")"
        collegeAddressLbl.text = "address: \(collegeDetails.address ?? "")"
        collegeUniversityLbl.text = "university: \(collegeDetails.university ?? "")"
        
    }
    @IBAction func backBtnPressed(_ sender:UIButton){
        dismiss(animated: true)
    }

    @IBAction func editBtnPressed(_ sender: UIButton) {
        let vc = CollegeFormViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.collageDetails = collegeDetails
        vc.isUpdate = true
        vc.indexRow = index
        present(vc, animated: true)
    }
    
}
