//
//  StudentListViewController.swift
//  CollegeData
//
//  Created by Akash Belekar on 13/04/23.
//

import UIKit

class StudentListViewController: UIViewController {
    @IBOutlet weak var studentListTbl:UITableView!
    
    var studentModel = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentListTbl.register(UINib(nibName: "StudentListTVC", bundle: nil), forCellReuseIdentifier: "StudentListTVC")
        studentListTbl.dataSource = self
        studentListTbl.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        studentModel = DataBaseHelper.sharedInstance.getStudentData()
        self.studentListTbl.reloadData()
    }
    @IBAction func addStudentBtnPressed(_ sender:UIButton){
        let vc = StudentFormViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @IBAction func backBtn(){
        dismiss(animated: true)
    }
   
}
extension StudentListViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentListTVC", for: indexPath) as! StudentListTVC
        cell.studentDetails = studentModel[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            DataBaseHelper.sharedInstance.deleteStudentData(index: indexPath.row)
            self.studentListTbl.reloadData()
        }
    }
    
}
