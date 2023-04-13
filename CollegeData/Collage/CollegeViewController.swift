//
//  CollegeViewController.swift
//  CollegeData
//
//  Created by Akash Belekar on 12/04/23.
//

import UIKit

class CollegeViewController: UIViewController {

    @IBOutlet weak var clgListTbl: UITableView!
    
    var collegeModel = [Collage]()
    override func viewDidLoad() {
        super.viewDidLoad()

        clgListTbl.register(UINib(nibName: "CollegeFormTVC", bundle: nil), forCellReuseIdentifier: "CollegeFormTVC")
        clgListTbl.dataSource = self
        clgListTbl.delegate = self

    }
    override func viewWillAppear(_ animated: Bool) {
        self.collegeModel = DataBaseHelper.sharedInstance.getCollageData()
        self.clgListTbl.reloadData()
    }


    @IBAction func clgAdd(_ sender: UIButton) {
        let vc = CollegeFormViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}
extension CollegeViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeFormTVC", for: indexPath) as! CollegeFormTVC
        cell.college = collegeModel[indexPath.row]
        return cell
    }
    //delete row methods
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            self.collegeModel = DataBaseHelper.sharedInstance.deleteCollageData(index: indexPath.row)
            self.clgListTbl.deleteRows(at: [indexPath], with: .automatic)
            
        }
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CollegeDetailsViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.index = indexPath.row
        vc.collegeDetails = collegeModel[indexPath.row]
        present(vc, animated: true)
    }
    
    
}
