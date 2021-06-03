//
//  QuantifyViewController.swift
//  test
//
//  Created by Yu hsuan Yang on 2021/5/3.
//  Copyright © 2021 graduateproj. All rights reserved.
//

import UIKit
class QuantifyViewController: UIViewController {
    var textView: UITextView!
    var quantify: UIView!
    var numLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 80))
    var quantifyPageTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
    @objc func goBack()
    {
    self.dismiss(animated: true, completion:nil)
    }
    @objc func goToday(_ sender: UIButton)
    {
     self.view.window?.rootViewController?.dismiss(animated:  true , completion:  nil )
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        self.view.backgroundColor = .white
        self.quantify = UIView(frame: CGRect(x: 0, y: 75, width: 415, height: 770))
        self.quantify.backgroundColor = .white
        self.quantify.layer.borderWidth = 1
        self.quantify.layer.borderColor = CGColor.init(srgbRed: 163/225, green: 163/225, blue: 163/225, alpha: 1.0)
        
        
        quantifyPageTitle.center = CGPoint(x: 207, y:40)
        quantifyPageTitle.textAlignment = .center
        quantifyPageTitle.font = UIFont.systemFont(ofSize: 20)
        quantifyPageTitle.textColor = smartDarkBlue
        self.view.addSubview(quantifyPageTitle)
        
        let cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        cancelButton.setTitle("上一步", for: .normal)
        cancelButton.setTitleColor(smartDarkGold, for: UIControl.State.normal)
        cancelButton.addTarget(nil, action: #selector(QuantifyViewController.goBack), for: .touchUpInside)
        cancelButton.center = CGPoint(x: 40, y: 40)
        cancelButton.tintColor = smartDarkGold
        self.view.addSubview(cancelButton)


        let nextButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        nextButton.setTitle("完成", for: .normal)
        nextButton.setTitleColor(smartDarkGold, for: UIControl.State.normal)
        nextButton.addTarget(nil, action: #selector(QuantifyViewController.goToday), for: .touchUpInside)
        nextButton.center = CGPoint(x: 371, y: 40)
        nextButton.tintColor = smartDarkGold
        self.view.addSubview(nextButton)
        
        
        numLabel.center = CGPoint(x: 40, y:350)
        numLabel.textAlignment = .center
        numLabel.font = UIFont.systemFont(ofSize: 20)
        numLabel.textColor = smartDarkBlue
        self.view.addSubview(numLabel)
        
        
    }
}
extension QuantifyViewController: FetchTextDelegate{
    func fetchText(_ text: String) {
        quantifyPageTitle.text = text
    }
}
extension QuantifyViewController: FetchNumDelegate{
    func fetchNum(_ text: Int) {
        numLabel.text = String(text)
    }
}
