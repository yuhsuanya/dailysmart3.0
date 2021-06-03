//
//  TargetController.swift
//  test
//
//  Created by Yu hsuan Yang on 2021/5/7.
//  Copyright © 2021 graduateproj. All rights reserved.
//

import UIKit

class DataModal{
    var titleLabel: String?
    var oneDateLabel: String?
    var myImageView: UIImage?
    var fGoalLabel: String?
    var goalLabel: String?
    
    init(titleLabel: String,oneDateLabel: String, myImageView: UIImage,fGoalLabel: String, goalLabel: String){
        self.titleLabel = titleLabel
        self.oneDateLabel = oneDateLabel
        self.myImageView = myImageView
        self.fGoalLabel = fGoalLabel
        self.goalLabel = goalLabel
    }
}

class TargetController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var dataArr = [DataModal]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell.identifier", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = dataArr[indexPath.row].titleLabel
        cell.oneDateLabel.text = dataArr[indexPath.row].oneDateLabel
        cell.myImageView.image = dataArr[indexPath.row].myImageView
        cell.fGoalLabel.text = dataArr[indexPath.row].fGoalLabel
        cell.goalLabel.text = dataArr[indexPath.row].goalLabel
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 177
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataArr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self,
                           forCellReuseIdentifier: "CustomTableViewCell.identifier")
        
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        dataArr.append(DataModal(titleLabel:"唸程設", oneDateLabel:"5/16 ~ 5/22", myImageView: #imageLiteral(resourceName: "yBubblePer"), fGoalLabel:"目標 100頁", goalLabel:"已完成 50頁" ))
        dataArr.append(DataModal(titleLabel:"健身", oneDateLabel:"5/20 ~ 5/25", myImageView: #imageLiteral(resourceName: "bubblePer.png"), fGoalLabel:"6 項子目標", goalLabel:"已完成 0頁"  ))
    }
    
    func setTableView(){
        tableView.backgroundColor = .white
        tableView.frame = self.view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        self.navigationItem.title = "目標"
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

