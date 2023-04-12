//
//  CollegeFormTVC.swift
//  CollegeData
//
//  Created by Akash Belekar on 12/04/23.
//

import UIKit

class CollegeFormTVC: UITableViewCell {
    @IBOutlet weak var collegeNameLbl:UILabel!
    @IBOutlet weak var collegeCityLbl:UILabel!
    @IBOutlet weak var collegeAddressLbl:UILabel!
    @IBOutlet weak var collegeUniversityLbl:UILabel!
    
    var college:Collage!{
        didSet{
            collegeNameLbl.text =  "name: \(college.name ?? "")"
            collegeCityLbl.text = "city: \(college.city ?? "")"
            collegeAddressLbl.text = "address: \(college.address ?? "")"
            collegeUniversityLbl.text = "university: \(college.university ?? "")"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
