//
//  AddTargetViewController.swift
//  test
//
//  Created by Yu hsuan Yang on 2021/4/8.
//  Copyright © 2021 graduateproj. All rights reserved.
//

import UIKit
//import PlaygroundSupport

protocol FetchTextDelegate {
    func fetchText(_ text: String)
}
protocol FetchNumDelegate {
    func fetchNum(_ text: Int)
}
class AddTargetViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource, UITextFieldDelegate{

    // 取得螢幕的尺寸
    let fullScreenSize = UIScreen.main.bounds.size
    let buttonBar = UIView()
    let formatter = DateFormatter()
    var unitBtn : UIButton!
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        selectedIndex = viewController.view.tag
        segmentedControl.selectedSegmentIndex = selectedIndex
        let pageIndex = viewController.view.tag - 1
        if pageIndex < 0 {
            return nil
        }
        return viewControllerArr[pageIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        selectedIndex = viewController.view.tag
        segmentedControl.selectedSegmentIndex = selectedIndex
        let pageIndex = viewController.view.tag + 1
        if pageIndex > 1{
            return nil
        }
        return viewControllerArr[pageIndex]
    }
    @objc func segmentedChange(sender: UISegmentedControl){
        print(sender.selectedSegmentIndex)
        print(sender.titleForSegment(at: sender.selectedSegmentIndex)!)
        
        pageViewControl.setViewControllers([viewControllerArr[sender.selectedSegmentIndex]], direction: .forward, animated: false)
        UIView.animate(withDuration: 0.3) {
            self.buttonBar.frame.origin.x = (self.segmentedControl.frame.width / CGFloat(self.segmentedControl.numberOfSegments)) * CGFloat(self.segmentedControl.selectedSegmentIndex)
     }
   }
    private func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        self.view.endEditing(true)
        return true
    }
    @objc func goBack()
    {
        self.dismiss(animated: true, completion:nil)
    }
    @objc func selectDate()
    {
        self.present(SelectDateController(), animated: true, completion: nil)
    }
    @objc func clickButton() {
            var subDateBtn : UIButton!
            let nowDate = self.formatter.string(from: Date())
            subDateBtn = UIButton(frame: CGRect(x: 16, y: 340, width: 125, height: 45))
            subDateBtn.backgroundColor = smartMiddleBlue
            subDateBtn.setTitle(nowDate, for: UIControl.State.normal)
            subDateBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -19, bottom: 0, right: 0)
            subDateBtn.setTitleColor(UIColor.white, for: .normal)
            subDateBtn.layer.cornerRadius = 10.0
            subDateBtn.addTarget(nil, action: #selector(AddTargetViewController.selectDate), for: .touchUpInside)
            viewController2.view.addSubview(subDateBtn)
        
            let triangleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 9, height: 4))
            triangleImageView.image = UIImage(named: "triangleButton")
            triangleImageView.center = CGPoint(x:124,y:365)
            viewController2.view.addSubview(triangleImageView)
            let subGTargetField = UITextField(frame: CGRect(x: 0, y: 0, width: 240, height: 45))
            let subGTargetFieldFont:UIFont = UIFont.systemFont(ofSize: 20)
            subGTargetField.font = subGTargetFieldFont
            subGTargetField.center = CGPoint(x: 278, y: 362)
            subGTargetField.placeholder = "名稱"
            let subGindentView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            subGTargetField.leftView = subGindentView
            subGTargetField.leftViewMode = .always
            subGTargetField.layer.cornerRadius = 10.0
            subGTargetField.clearButtonMode = .whileEditing
            subGTargetField.keyboardType = .default
            subGTargetField.returnKeyType = .done
            subGTargetField.textColor = UIColor.black
            subGTargetField.backgroundColor = UIColor.white
            subGTargetField.borderStyle = .none
            viewController2.view.addSubview(subGTargetField)
            
        }
    @objc func goUnit() {
        self.present(UnitViewController(), animated: true, completion: nil)
    }
    @objc func goQuantify() {
        self.present(secondVC, animated: true, completion: nil)
        self.delegate = secondVC
        self.delegate?.fetchText(myQTarget.text!)
    }
//    @objc func goTableView() {
//        self.present(targetVc, animated: true, completion: nil)
//        self.delegate = tableVC as? FetchTextDelegate
//        self.delegate?.fetchText(myQTarget.text!)
//    }
    @objc func calcNum(){
        let myNumber = " "
        let num = Int(myNumber) ?? 0
        let average = num/10
        self.present(secondVC, animated: true, completion: nil)
        self.numDelegate = secondVC
        self.numDelegate?.fetchNum(average)
        
//        self.delegate?.fetchNum(myQTarget.text!)
    }
    @objc func change1()
    {
        unitBtn.setTitle("次", for: .normal)
        unitBtn.setTitleColor( UIColor.black, for: UIControl.State.normal)
        unitBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -140, bottom: 0, right: 0)
    }
    @objc func change2()
    {
        unitBtn.setTitle("本", for: .normal)
        unitBtn.setTitleColor( UIColor.black, for: UIControl.State.normal)
        unitBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -140, bottom: 0, right: 0)
    }
    @objc func change3()
    {
        unitBtn.setTitle("頁", for: .normal)
        unitBtn.setTitleColor( UIColor.black, for: UIControl.State.normal)
        unitBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -140, bottom: 0, right: 0)
    }
    @objc func change4()
    {
        unitBtn.setTitle("章節", for: .normal)
        unitBtn.setTitleColor( UIColor.black, for: UIControl.State.normal)
        unitBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -120, bottom: 0, right: 0)
    }
    @objc func change5()
    {
        unitBtn.setTitle("秒", for: .normal)
        unitBtn.setTitleColor( UIColor.black, for: UIControl.State.normal)
        unitBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -140, bottom: 0, right: 0)
    }
    @objc func change6()
    {
        unitBtn.setTitle("分鐘", for: .normal)
        unitBtn.setTitleColor( UIColor.black, for: UIControl.State.normal)
        unitBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -120, bottom: 0, right: 0)
    }
    @objc func change7()
    {
        unitBtn.setTitle("小時", for: .normal)
        unitBtn.setTitleColor( UIColor.black, for: UIControl.State.normal)
        unitBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -120, bottom: 0, right: 0)
    }
    @objc func change8()
    {
        unitBtn.setTitle("公厘", for: .normal)
        unitBtn.setTitleColor( UIColor.black, for: UIControl.State.normal)
        unitBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -120, bottom: 0, right: 0)
    }
    @objc func change9()
    {
        unitBtn.setTitle("公分", for: .normal)
        unitBtn.setTitleColor( UIColor.black, for: UIControl.State.normal)
        unitBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -120, bottom: 0, right: 0)
    }
    @objc func change10()
    {
        unitBtn.setTitle("公尺", for: .normal)
        unitBtn.setTitleColor( UIColor.black, for: UIControl.State.normal)
        unitBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -120, bottom: 0, right: 0)
    }
    @objc func change11()
    {
        unitBtn.setTitle("公里", for: .normal)
        unitBtn.setTitleColor( UIColor.black, for: UIControl.State.normal)
        unitBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -120, bottom: 0, right: 0)
    }
    @objc func change12()
    {
        unitBtn.setTitle("毫克", for: .normal)
        unitBtn.setTitleColor( UIColor.black, for: UIControl.State.normal)
        unitBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -120, bottom: 0, right: 0)
    }
    @objc func change13()
    {
        unitBtn.setTitle("公克", for: .normal)
        unitBtn.setTitleColor( UIColor.black, for: UIControl.State.normal)
        unitBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -120, bottom: 0, right: 0)
    }
    @objc func change14()
    {
        unitBtn.setTitle("公斤", for: .normal)
        unitBtn.setTitleColor( UIColor.black, for: UIControl.State.normal)
        unitBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -120, bottom: 0, right: 0)
    }
//    @objc func change15()
//    {
//        if unitBtn.titleLabel!.text == " "{
//        unitBtn.titleLabel!.text = inputUnit.text!
//        unitBtn.setTitleColor( UIColor.black, for: UIControl.State.normal)
//        unitBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -120, bottom: 0, right: 0)
//        }
//    }
    
    var delegate: FetchTextDelegate?
//    var tabledelegate: FetchTextDelegate?
    var numDelegate: FetchNumDelegate?
    var secondVC = QuantifyViewController()
    var tableVC = CustomTableViewCell()
    var segmentedControl = UISegmentedControl()
    var pageViewControl = UIPageViewController()
    var viewControllerArr = Array<UIViewController>()
    var selectedIndex: Int = 0
    var viewController2 = UIViewController()
    var viewController1 = UIViewController()
    var subDateBtn : UIButton!
    var subGTargetImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
    var triangleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 9, height: 4))
    var subGTargetField = UITextField(frame: CGRect(x: 0, y: 0, width: 240, height: 45))
    var unitTitle = Int()
    var myQTarget = UITextField(frame: CGRect(x: 0, y: 0, width: 380, height: 45))
    var myNumber = UITextField(frame: CGRect(x: 0, y: 0, width: 183, height: 45))


    override func viewDidLoad() {
        super.viewDidLoad()
       
        //設置日期樣式
        formatter.dateStyle = .full
        formatter.locale = Locale(identifier: "zh_TW")
        //客製化日期格式
        formatter.dateFormat = "yyyy/MM/dd"
        let nowDate = self.formatter.string(from: Date())
        
        let myTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        myTitle.center = CGPoint(x: 207, y:40)
        myTitle.textAlignment = .center
        myTitle.text = "新增目標"
        let customTitleFont:UIFont = UIFont.systemFont(ofSize: 20)
        myTitle.font = customTitleFont
        myTitle.font = UIFont.systemFont(ofSize: 20)
        myTitle.textColor = smartDarkBlue
        self.view.addSubview(myTitle)

        let cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.setTitleColor(smartDarkGold, for: UIControl.State.normal)
        cancelButton.addTarget(nil, action: #selector(AddTargetViewController.goBack), for: .touchUpInside)
        cancelButton.center = CGPoint(x: 35, y: 40)
        cancelButton.tintColor = smartDarkGold
        self.view.addSubview(cancelButton)

        let nextButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        nextButton.setTitle("下一步", for: .normal)
        nextButton.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        nextButton.addTarget(nil, action: #selector(AddTargetViewController.goQuantify), for: .touchUpInside)
        nextButton.center = CGPoint(x: 371, y: 40)
        nextButton.tintColor = smartDarkGold
        self.view.addSubview(nextButton)
        
        segmentedControl.insertSegment(withTitle: "量化目標", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "一般目標", at: 1, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .clear
        segmentedControl.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 18),
         NSAttributedString.Key.foregroundColor: smartDarkGold], for: .selected)
        segmentedControl.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 18),
         NSAttributedString.Key.foregroundColor:  UIColor.darkGray], for: .normal)
        
        segmentedControl.frame = CGRect.init(x:0,y:75,width: self.view.frame.width,height:54)
        segmentedControl.addTarget(self, action: #selector(segmentedChange), for: .valueChanged)
        self.view.addSubview(segmentedControl)
        pageViewControl = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewControl.view.frame = CGRect.init(x:0, y:128, width: self.view.frame.width, height: self.view.frame.height - 128)
        pageViewControl.delegate = self
        pageViewControl.dataSource = self
        pageViewControl.isEditing = true
        self.addChild(pageViewControl)
        self.view.addSubview(pageViewControl.view)
        
        
        let QTargetFont:UIFont = UIFont.systemFont(ofSize: 20)
        myQTarget.font = QTargetFont
        myQTarget.center = CGPoint(x: 207, y: 50)
        myQTarget.placeholder = "目標名稱"
        let indenttView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        myQTarget.leftView = indenttView
        myQTarget.leftViewMode = .always
        myQTarget.layer.cornerRadius = 10.0
        myQTarget.clearButtonMode = .whileEditing
        myQTarget.keyboardType = .default
        myQTarget.returnKeyType = .done
        myQTarget.textColor = UIColor.black
        myQTarget.backgroundColor = UIColor.white
        myQTarget.borderStyle = .none
        myQTarget.delegate = self
        
        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        myImageView.image = UIImage(named: "icon_home_goal_goal")
        myImageView.center = CGPoint(x:29,y:126)
        
        let myFinalGoal = UILabel(frame: CGRect(x: 50, y: 118, width: 104, height: 25))
        myFinalGoal.text = "最終目標"
        myFinalGoal.font = UIFont.systemFont(ofSize: 18)
        myFinalGoal.textColor = smartDarkBlue
        
        
        myNumber.center = CGPoint(x: 110, y: 175)
        let indentNumView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        myNumber.leftView = indentNumView
        myNumber.leftViewMode = .always
        myNumber.placeholder = "數字"
        let NumberFont:UIFont = UIFont.systemFont(ofSize: 18)
        myNumber.font = NumberFont
         myNumber.layer.cornerRadius = 10.0
        myNumber.clearButtonMode = .whileEditing
        myNumber.keyboardType = .default
        myNumber.returnKeyType = .done
        myNumber.textColor = UIColor.black
        myNumber.backgroundColor = UIColor.white
        myNumber.borderStyle = .none
        myNumber.delegate = self
        
        unitBtn = UIButton(frame: CGRect(x: 214, y: 153, width: 183, height: 45))
        unitBtn.backgroundColor = UIColor.white
        unitBtn.setTitle("單位", for: UIControl.State.normal)
        unitBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -120, bottom: 0, right: 0)
        unitBtn.setTitleColor(UIColor.lightGray,for: UIControl.State.normal)
        unitBtn.layer.cornerRadius = 10.0
        unitBtn.addTarget(self, action: #selector(AddTargetViewController.goUnit), for: .touchUpInside)
        
        let myQDateImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        myQDateImageView.image = UIImage(named: "icon_date_range")
        myQDateImageView.center = CGPoint(x:28,y:250)
        
        let myQDateText = UILabel(frame: CGRect(x: 47, y: 238, width: 104, height: 25))
        myQDateText.text = "日期"
        myQDateText.font = UIFont.systemFont(ofSize: 18)
        myQDateText.textColor = smartDarkBlue
        
        var dateQBtn : UIButton!
        dateQBtn = UIButton(frame: CGRect(x: 17, y: 274, width: 380, height: 45))
        dateQBtn.backgroundColor = UIColor.white
        dateQBtn.setTitle(nowDate, for: UIControl.State.normal)
        dateQBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -265, bottom: 0, right: 0)
        dateQBtn.setTitleColor(UIColor.lightGray, for: .normal)
        dateQBtn.layer.cornerRadius = 10.0
        dateQBtn.addTarget(nil, action: #selector(AddTargetViewController.selectDate), for: .touchUpInside)
        
        viewController1.view.backgroundColor =  smartLightBlue
        viewController1.view.tag = 0
        viewController1.view.addSubview(myQTarget)
        viewController1.view.addSubview(myImageView)
        viewController1.view.addSubview(myFinalGoal)
        viewController1.view.addSubview(myNumber)
        viewController1.view.addSubview(unitBtn)
        viewController1.view.addSubview(myQDateImageView)
        viewController1.view.addSubview(myQDateText)
        viewController1.view.addSubview(dateQBtn)
        
        
        let myGTarget = UITextField(frame: CGRect(x: 0, y: 0, width: 380, height: 45))
        let GTargetFont:UIFont = UIFont.systemFont(ofSize: 20)
        myGTarget.font = GTargetFont
        myGTarget.center = CGPoint(x: 207, y: 50)
        myGTarget.placeholder = "目標名稱"
        let GindenttView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        myGTarget.leftView = GindenttView
        myGTarget.leftViewMode = .always
        myGTarget.layer.cornerRadius = 10.0
        myGTarget.clearButtonMode = .whileEditing
        myGTarget.keyboardType = .default
        myGTarget.returnKeyType = .done
        myGTarget.textColor = UIColor.black
        myGTarget.backgroundColor = UIColor.white
        myGTarget.borderStyle = .none
        myGTarget.delegate = self
       
        let myDateImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        myDateImageView.image = UIImage(named: "icon_date_range")
        myDateImageView.center = CGPoint(x:25,y:126)
        
        let myDateText = UILabel(frame: CGRect(x: 44, y: 115, width: 104, height: 25))
        myDateText.text = "日期"
        myDateText.font = UIFont.systemFont(ofSize: 18)
        myDateText.textColor = smartDarkBlue
        
        var dateBtn : UIButton!
        dateBtn = UIButton(frame: CGRect(x: 17, y: 155, width: 380, height: 45))
        dateBtn.backgroundColor = UIColor.white
        dateBtn.setTitle(nowDate, for: UIControl.State.normal)
        dateBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -265, bottom: 0, right: 0)
        dateBtn.setTitleColor(UIColor.lightGray, for: .normal)
        dateBtn.layer.cornerRadius = 10.0
        dateBtn.addTarget(nil, action: #selector(AddTargetViewController.selectDate), for: .touchUpInside)
    
        subDateBtn = UIButton(frame: CGRect(x: 16, y: 280, width: 125, height: 45))
        subDateBtn.backgroundColor = smartMiddleBlue
        subDateBtn.setTitle(nowDate, for: UIControl.State.normal)
        subDateBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -19, bottom: 0, right: 0)
        subDateBtn.setTitleColor(UIColor.white, for: .normal)
        subDateBtn.layer.cornerRadius = 10.0
        subDateBtn.addTarget(nil, action: #selector(AddTargetViewController.selectDate), for: .touchUpInside)
        
        subGTargetImageView.image = UIImage(named: "assignment")
        subGTargetImageView.center = CGPoint(x:25,y:255)
        
        let subGTargetText = UILabel(frame: CGRect(x: 44, y: 242, width: 104, height: 25))
        subGTargetText.text = "子目標"
        subGTargetText.font = UIFont.systemFont(ofSize: 18)
        subGTargetText.textColor = smartDarkBlue
        
        triangleImageView.image = UIImage(named: "triangleButton")
        triangleImageView.center = CGPoint(x:124,y:305)
        
        
        let subGTargetFieldFont:UIFont = UIFont.systemFont(ofSize: 20)
        subGTargetField.font = subGTargetFieldFont
        subGTargetField.center = CGPoint(x: 278, y: 302)
        subGTargetField.placeholder = "名稱"
        let subGindentView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        subGTargetField.leftView = subGindentView
        subGTargetField.leftViewMode = .always
        subGTargetField.layer.cornerRadius = 10.0
        subGTargetField.clearButtonMode = .whileEditing
        subGTargetField.keyboardType = .default
        subGTargetField.returnKeyType = .done
        subGTargetField.textColor = UIColor.black
        subGTargetField.backgroundColor = UIColor.white
        subGTargetField.borderStyle = .none
        
        var addSubGBtn = UIButton()
        addSubGBtn = UIButton(frame: CGRect(x: 0, y: 610, width: 160, height: 40))
        addSubGBtn.setTitle("新增子目標", for: .normal)
        addSubGBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        addSubGBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 0)
        addSubGBtn.contentVerticalAlignment = .bottom
        addSubGBtn.setTitleColor(smartSubTBlue, for: .normal)
        addSubGBtn.setImage(UIImage(named: "addSubBtn"), for: .normal)
        addSubGBtn.addTarget(self,action: #selector(AddTargetViewController.clickButton),for: .touchUpInside)

        viewController2.view.backgroundColor = smartLightBlue
        viewController2.view.tag = 1
        viewController2.view.addSubview(myGTarget)
        viewController2.view.addSubview(myDateImageView)
        viewController2.view.addSubview(myDateText)
        viewController2.view.addSubview(dateBtn)
        viewController2.view.addSubview(subGTargetImageView)
        viewController2.view.addSubview(subGTargetText)
        viewController2.view.addSubview(subDateBtn)
        viewController2.view.addSubview(triangleImageView)
        viewController2.view.addSubview(subGTargetField)
        viewController2.view.addSubview(addSubGBtn)
        
        
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        buttonBar.backgroundColor = smartDarkGold
        view.addSubview(buttonBar)
        buttonBar.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor).isActive = true
        buttonBar.heightAnchor.constraint(equalToConstant: 3).isActive = true
        buttonBar.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor).isActive = true
        buttonBar.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments)).isActive = true
        viewControllerArr.append(viewController1)
        viewControllerArr.append(viewController2)
        
        pageViewControl.setViewControllers([viewControllerArr[0]], direction: .forward, animated: false)
        
    }
}

