//
//  StudentListTVC.swift
//  CollegeData
//
//  Created by Akash Belekar on 13/04/23.
//

import UIKit

class StudentListTVC: UITableViewCell {
    @IBOutlet weak var studentNameLbl:UILabel!
    @IBOutlet weak var studentEmailLbl:UILabel!
    @IBOutlet weak var studentPhoneLbl:UILabel!
    
    var studentDetails:Student?{
        didSet{
            studentNameLbl.text = studentDetails?.name
            studentEmailLbl.text = studentDetails?.email
            studentPhoneLbl.text = studentDetails?.phone
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
