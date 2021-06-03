//
//  UnitViewController.swift
//  test
//
//  Created by Yu hsuan Yang on 2021/4/15.
//  Copyright © 2021 graduateproj. All rights reserved.
//

import UIKit


protocol GetData : class {
      func  receiveData(data: String)
}
//protocol UnitInputDelegate {
//    func passData(text: String)
//}
class UnitViewController: UIViewController, UITextFieldDelegate {

    weak var delegate: GetData?
    var inputUnit:UITextField!
//        var delegate: UnitViewControllerDelegate?
//    func jump(sender:UIButton!) {
////    let leftAllowBtn = sender! //把sender傳遞過來的資料強制轉型成UIButton的型態
//        let viewController = AddTargetViewController()
//        viewController.unitBtn.titleLabel!.text = inputUnit.text!
//        present(viewController, animated: true, completion: nil)
//
//        return
//    }
    func jump(_sender: UIButton){
//           let viewController = AddTargetViewController()
           //传递数据
        dismiss(animated: true, completion: nil)
        delegate?.receiveData(data: inputUnit.text! )
        
       }


        var QTargetFont:UIFont!
        var addUnit: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        self.view.backgroundColor = .white
        self.addUnit = UIView(frame: CGRect(x: 0, y: 75, width: 415, height: 770))
        self.addUnit.backgroundColor = .white
        self.addUnit.layer.borderWidth = 1
        self.addUnit.layer.borderColor = CGColor.init(srgbRed: 163/225, green: 163/225, blue: 163/225, alpha: 1.0)
        
        let unitPageTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        unitPageTitle.center = CGPoint(x: 207, y:40)
        unitPageTitle.textAlignment = .center
        unitPageTitle.text = "選擇目標單位"
        unitPageTitle.font = UIFont.systemFont(ofSize: 20)
        unitPageTitle.textColor = smartDarkBlue
        self.view.addSubview(unitPageTitle)
        
        
        inputUnit = UITextField(frame: CGRect(x: 0, y: 0, width: 330, height: 43))
        QTargetFont = UIFont.systemFont(ofSize: 18)
        inputUnit.font = QTargetFont
        inputUnit.center = CGPoint(x: 235, y: 110)
        inputUnit.placeholder = "請輸入單位"
        inputUnit.clearButtonMode = .whileEditing
        inputUnit.keyboardType = .default
        inputUnit.returnKeyType = .done
        inputUnit.textColor = UIColor.black
        inputUnit.backgroundColor = UIColor.white
        inputUnit.borderStyle = .roundedRect
        inputUnit.layer.cornerRadius = 10.0
        inputUnit.delegate = self
        inputUnit.resignFirstResponder();
//        Uinput = inputUnit.text
        inputUnit.setLeftPaddingPoints(10)
        self.view.addSubview(inputUnit)
        

    
        func textFieldShouldReturn(inputUnit: UITextField) -> Bool {
            inputUnit.resignFirstResponder();
            return true;
        }
        
        var leftAllowBtn = UIButton()
        leftAllowBtn = UIButton(frame: CGRect(x: 3, y: 20, width: 40, height: 40))
        leftAllowBtn.setImage(UIImage(named: "btn_leftarrow"), for: .normal)
        leftAllowBtn.addTarget(self,action: #selector(AddTargetViewController.goBack),for: .touchUpInside)
//        leftAllowBtn.addTarget(self,action: #selector(AddTargetViewController.change15), for: .touchUpInside)
        leftAllowBtn.addTarget(self,action: Selector(("jump")),for: .touchUpInside)
        self.view.addSubview(leftAllowBtn)
        
        
        
        let grayLineImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 415, height: 4))
        grayLineImageView.image = UIImage(named: "grayLine")
        grayLineImageView.center = CGPoint(x:207,y:70)
        self.view.addSubview(grayLineImageView)

        let customText = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        customText.center = CGPoint(x: 33, y:110)
        customText.textAlignment = .center
        customText.text = "自訂"
        customText.font = UIFont.systemFont(ofSize: 18)
        customText.textColor = smartDarkBlue
        self.view.addSubview(customText)
        
        
        
        
        let oneYellowLineImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 121, height: 2))
        oneYellowLineImageView.image = UIImage(named: "yellowLine")
        oneYellowLineImageView.center = CGPoint(x:78,y:175)
        self.view.addSubview(oneYellowLineImageView)
        
        let twoYellowLineImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 121, height: 2))
        twoYellowLineImageView.image = UIImage(named: "yellowLine")
        twoYellowLineImageView.center = CGPoint(x:336,y:175)
        self.view.addSubview(twoYellowLineImageView)
        
        let orText = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        orText.center = CGPoint(x: 208, y:175)
        orText.textAlignment = .center
        orText.text = "或者"
        orText.font = UIFont.systemFont(ofSize: 18)
        orText.textColor = smartDarkBlue
        self.view.addSubview(orText)

        let generalText = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        generalText.center = CGPoint(x: 36, y:219)
        generalText.textAlignment = .center
        generalText.text = "一般"
        generalText.font = UIFont.systemFont(ofSize: 18)
        generalText.textColor = smartDarkBlue
        self.view.addSubview(generalText)
        
        let timesBtn = UIButton(frame: CGRect(x: 18, y: 246, width: 67, height: 45))
        timesBtn.layer.cornerRadius = 10.0
        timesBtn.addTarget(nil, action: #selector(AddTargetViewController.goBack), for: .touchUpInside)
        timesBtn.addTarget(nil, action: #selector(AddTargetViewController.change1), for: .touchUpInside)
        timesBtn.setTitle("次", for: .normal)
        timesBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        timesBtn.backgroundColor = smartMiddleBlue
        timesBtn.setTitleColor(.white, for: .normal)
        self.view.addSubview(timesBtn)
        
        let thisBtn = UIButton(frame: CGRect(x: 111, y: 246, width: 67, height: 45))
        thisBtn.layer.cornerRadius = 10.0
        thisBtn.addTarget(nil, action: #selector(AddTargetViewController.goBack), for: .touchUpInside)
        thisBtn.addTarget(nil, action: #selector(AddTargetViewController.change2), for: .touchUpInside)
        thisBtn.setTitle("本", for: .normal)
        thisBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        thisBtn.backgroundColor = smartMiddleBlue
        thisBtn.setTitleColor(.white, for: .normal)
        self.view.addSubview(thisBtn)
        
        let pageBtn = UIButton(frame: CGRect(x: 204, y: 246, width: 67, height: 45))
        pageBtn.layer.cornerRadius = 10.0
        pageBtn.addTarget(nil, action: #selector(AddTargetViewController.goBack), for: .touchUpInside)
        pageBtn.addTarget(nil, action: #selector(AddTargetViewController.change3), for: .touchUpInside)
        pageBtn.setTitle("頁", for: .normal)
        pageBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        pageBtn.backgroundColor = smartMiddleBlue
        pageBtn.setTitleColor(.white, for: .normal)
        self.view.addSubview(pageBtn)
        
        let chapterBtn = UIButton(frame: CGRect(x: 297, y: 246, width: 67, height: 45))
        chapterBtn.layer.cornerRadius = 10.0
        chapterBtn.addTarget(nil, action: #selector(AddTargetViewController.goBack), for: .touchUpInside)
        chapterBtn.addTarget(nil, action: #selector(AddTargetViewController.change4), for: .touchUpInside)
        chapterBtn.setTitle("章節", for: .normal)
        chapterBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        chapterBtn.backgroundColor = smartMiddleBlue
        chapterBtn.setTitleColor(.white, for: .normal)
        self.view.addSubview(chapterBtn)
        
        let timeText = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        timeText.center = CGPoint(x: 36, y:351)
        timeText.textAlignment = .center
        timeText.text = "時間"
        timeText.font = UIFont.systemFont(ofSize: 18)
        timeText.textColor = smartDarkBlue
        self.view.addSubview(timeText)
        
        let secondBtn = UIButton(frame: CGRect(x: 18, y: 378, width: 67, height: 45))
        secondBtn.layer.cornerRadius = 10.0
        secondBtn.addTarget(nil, action: #selector(AddTargetViewController.goBack), for: .touchUpInside)
        secondBtn.addTarget(nil, action: #selector(AddTargetViewController.change5), for: .touchUpInside)
        secondBtn.setTitle("秒", for: .normal)
        secondBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        secondBtn.backgroundColor = smartMiddleBlue
        secondBtn.setTitleColor(.white, for: .normal)
        self.view.addSubview(secondBtn)
        
        let minuteBtn = UIButton(frame: CGRect(x: 111, y: 378, width: 67, height: 45))
        minuteBtn.layer.cornerRadius = 10.0
        minuteBtn.addTarget(nil, action: #selector(AddTargetViewController.goBack), for: .touchUpInside)
        minuteBtn.addTarget(nil, action: #selector(AddTargetViewController.change6), for: .touchUpInside)
        minuteBtn.setTitle("分鐘", for: .normal)
        minuteBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        minuteBtn.backgroundColor = smartMiddleBlue
        minuteBtn.setTitleColor(.white, for: .normal)
        self.view.addSubview(minuteBtn)
        
        let hourBtn = UIButton(frame: CGRect(x: 204, y: 378, width: 67, height: 45))
        hourBtn.layer.cornerRadius = 10.0
        hourBtn.addTarget(nil, action: #selector(AddTargetViewController.goBack), for: .touchUpInside)
        hourBtn.addTarget(nil, action: #selector(AddTargetViewController.change7), for: .touchUpInside)
        hourBtn.setTitle("小時", for: .normal)
        hourBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        hourBtn.backgroundColor = smartMiddleBlue
        hourBtn.setTitleColor(.white, for: .normal)
        self.view.addSubview(hourBtn)
        
        let lengthText = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        lengthText.center = CGPoint(x: 36, y:483)
        lengthText.textAlignment = .center
        lengthText.text = "長度"
        lengthText.font = UIFont.systemFont(ofSize: 18)
        lengthText.textColor = smartDarkBlue
        self.view.addSubview(lengthText)
        
        let mmBtn = UIButton(frame: CGRect(x: 18, y: 510, width: 67, height: 45))
        mmBtn.layer.cornerRadius = 10.0
        mmBtn.addTarget(nil, action: #selector(AddTargetViewController.goBack), for: .touchUpInside)
        mmBtn.addTarget(nil, action: #selector(AddTargetViewController.change8), for: .touchUpInside)
        mmBtn.setTitle("公厘", for: .normal)
        mmBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        mmBtn.backgroundColor = smartMiddleBlue
        mmBtn.setTitleColor(.white, for: .normal)
        self.view.addSubview(mmBtn)
        
        let cmBtn = UIButton(frame: CGRect(x: 111, y: 510, width: 67, height: 45))
        cmBtn.layer.cornerRadius = 10.0
        cmBtn.addTarget(nil, action: #selector(AddTargetViewController.goBack), for: .touchUpInside)
        cmBtn.addTarget(nil, action: #selector(AddTargetViewController.change9), for: .touchUpInside)
        cmBtn.setTitle("公分", for: .normal)
        cmBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        cmBtn.backgroundColor = smartMiddleBlue
        cmBtn.setTitleColor(.white, for: .normal)
        self.view.addSubview(cmBtn)
        
        let mBtn = UIButton(frame: CGRect(x: 204, y: 510, width: 67, height: 45))
        mBtn.layer.cornerRadius = 10.0
        mBtn.addTarget(nil, action: #selector(AddTargetViewController.goBack), for: .touchUpInside)
        mBtn.addTarget(nil, action: #selector(AddTargetViewController.change10), for: .touchUpInside)
        mBtn.setTitle("公尺", for: .normal)
        mBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        mBtn.backgroundColor = smartMiddleBlue
        mBtn.setTitleColor(.white, for: .normal)
        self.view.addSubview(mBtn)

        let kmBtn = UIButton(frame: CGRect(x: 297, y: 510, width: 67, height: 45))
        kmBtn.layer.cornerRadius = 10.0
        kmBtn.addTarget(nil, action: #selector(AddTargetViewController.goBack), for: .touchUpInside)
        kmBtn.addTarget(nil, action: #selector(AddTargetViewController.change11), for: .touchUpInside)
        kmBtn.setTitle("公里", for: .normal)
        kmBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        kmBtn.backgroundColor = smartMiddleBlue
        kmBtn.setTitleColor(.white, for: .normal)
        self.view.addSubview(kmBtn)

        let weightText = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        weightText.center = CGPoint(x: 36, y:615)
        weightText.textAlignment = .center
        weightText.text = "重量"
        weightText.font = UIFont.systemFont(ofSize: 18)
        weightText.textColor = smartDarkBlue
        self.view.addSubview(weightText)
        
        let mgBtn = UIButton(frame: CGRect(x: 18, y: 642, width: 67, height: 45))
        mgBtn.layer.cornerRadius = 10.0
        mgBtn.addTarget(nil, action: #selector(AddTargetViewController.goBack), for: .touchUpInside)
        mgBtn.addTarget(nil, action: #selector(AddTargetViewController.change12), for: .touchUpInside)
        mgBtn.setTitle("毫克", for: .normal)
        mgBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        mgBtn.backgroundColor = smartMiddleBlue
        mgBtn.setTitleColor(.white, for: .normal)
        self.view.addSubview(mgBtn)
        
        let gBtn = UIButton(frame: CGRect(x: 111, y: 642, width: 67, height: 45))
        gBtn.layer.cornerRadius = 10.0
        gBtn.addTarget(nil, action: #selector(AddTargetViewController.goBack), for: .touchUpInside)
        gBtn.addTarget(nil, action: #selector(AddTargetViewController.change13), for: .touchUpInside)
        gBtn.setTitle("公克", for: .normal)
        gBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        gBtn.backgroundColor = smartMiddleBlue
        gBtn.setTitleColor(.white, for: .normal)
        self.view.addSubview(gBtn)
        
        let kgBtn = UIButton(frame: CGRect(x: 204, y: 642, width: 67, height: 45))
        kgBtn.layer.cornerRadius = 10.0
        kgBtn.addTarget(nil, action: #selector(AddTargetViewController.goBack), for: .touchUpInside)
        kgBtn.addTarget(nil, action: #selector(AddTargetViewController.change14), for: .touchUpInside)
        kgBtn.setTitle("公斤", for: .normal)
        kgBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        kgBtn.backgroundColor = smartMiddleBlue
        kgBtn.setTitleColor(.white, for: .normal)
        self.view.addSubview(kgBtn)
    }
    private func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        // 結束編輯 把鍵盤隱藏起來
        self.view.endEditing(true)
        return true
    }
    @objc func goBack()
       {
           self.dismiss(animated: true, completion:nil)
       }

    @objc func goDetail()
    {
        self.present(AddTargetViewController(), animated: true, completion: nil)
    }
//    @objc func insertHashtag(sender: UIButton!) {
//        inputUnit.text = sender as UIButton
//        inputUnit.text.stringByAppendingString(unitBtn.titleLabel!.text)
//    }
//    @objc func insertHashtag(unitBtn: UIButton ) {
//        inputUnit.text = sender as UIButton
//        inputUnit.text.stringByAppendingString(unitBtn.titleLabel!.text)
//    }

    
//    @objc func changeUnit(){
//        = inputUnit.text
//    }
}




