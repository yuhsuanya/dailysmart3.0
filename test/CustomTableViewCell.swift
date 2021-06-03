//
//  CustomTableViewCell.swift
//  test
//
//  Created by Yu hsuan Yang on 2021/5/9.
//  Copyright © 2021 graduateproj. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    lazy var titleLabel:UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 20,weight: .bold)
        titleLabel.textColor = smartDarkBlue
        return titleLabel
    }()
    lazy var goalLabel:UILabel = {
        let goalLabel = UILabel()
        goalLabel.font = UIFont.systemFont(ofSize: 16)
        goalLabel.textColor = smartDarkBlue
        return goalLabel
    }()
    lazy var fGoalLabel:UILabel = {
        let fGoalLabel = UILabel()
        fGoalLabel.font = UIFont.systemFont(ofSize: 16)
        fGoalLabel.textColor = smartDarkBlue
        return fGoalLabel
    }()
    lazy var oneDateLabel:UILabel = {
        let oneDateLabel = UILabel()
        oneDateLabel.font = UIFont.systemFont(ofSize: 16)
        oneDateLabel.textColor = smartDarkGold
        return oneDateLabel
    }()
    lazy var myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    lazy var blueImageView:UIImageView = {
        let blueImageView = UIImageView()
        blueImageView.image = UIImage(named: "blueRect")
        blueImageView.contentMode = .scaleAspectFill
        blueImageView.clipsToBounds = true
        return blueImageView
    }()
    lazy var goalImageView:UIImageView = {
        let goalImageView = UIImageView()
        goalImageView.image = UIImage(named: "TargetGoal")
        goalImageView.contentMode = .scaleAspectFill
        goalImageView.clipsToBounds = true
        return goalImageView
    }()
    lazy var fGoalImageView:UIImageView = {
        let fGoalImageView = UIImageView()
        fGoalImageView.image = UIImage(named: "icon_home_goal_goal")
        fGoalImageView.contentMode = .scaleAspectFill
        fGoalImageView.clipsToBounds = true
        return fGoalImageView
    }()
    lazy var dateImageView:UIImageView = {
        let dateImageView = UIImageView()
        dateImageView.image = UIImage(named: "icon_date_range_yellow")
        dateImageView.contentMode = .scaleAspectFill
        dateImageView.clipsToBounds = true
        return dateImageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style,reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = smartTLightBlue
        contentView.addSubview(blueImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(goalLabel)
        contentView.addSubview(myImageView)
        contentView.addSubview(goalImageView)
        contentView.addSubview(fGoalImageView)
        contentView.addSubview(dateImageView)
        contentView.addSubview(fGoalLabel)
        contentView.addSubview(oneDateLabel)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String){
        titleLabel.text = text
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 16,left: 0,bottom: 0,right: 0))
        let imageSize = contentView.frame.size.height-100
        titleLabel.frame = CGRect(x:37,
                                  y:-44,
                                  width: contentView.frame.size.width - imageSize,
                                  height: contentView.frame.size.height)
        goalLabel.frame = CGRect(x:70,
                                  y:5,
                                  width: contentView.frame.size.width - imageSize,
                                  height: contentView.frame.size.height)
        fGoalLabel.frame = CGRect(x:70,
                                  y:42,
                                  width: contentView.frame.size.width - imageSize,
                                  height: contentView.frame.size.height)
        oneDateLabel.frame = CGRect(x:148,
                                    y:-44,
                                    width: contentView.frame.size.width - imageSize,
                                    height: contentView.frame.size.height)
        myImageView.frame = CGRect(x: 280, y: 64, width: imageSize+19, height: imageSize+12)
        blueImageView.frame = CGRect(x: 14, y: 9, width: 382, height: 149)
        goalImageView.frame = CGRect(x: 37, y: 75, width: 20, height: 20)
        fGoalImageView.frame = CGRect(x: 37, y: 110, width: 20, height: 20)
        dateImageView.frame = CGRect(x: 118, y: 25, width: 20, height: 20)
    }
}
//extension CustomTableViewCell: FetchTextDelegate{
//    func fetchText(_ text: String) {
//        Titlelabel.text = text
//    }
//}
