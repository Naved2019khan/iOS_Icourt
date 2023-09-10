//
//  SettingPickerViewController.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 25/04/23.
//

import UIKit

protocol  sendData {
    func setData(flag : Bool)
}

class SettingPickerViewController: UIViewController {

    var del : sendData?
    
    var metric = ["100  FT","200 FT","300 FT","400 FT","500 FT","600 FT","700 FT"]
    @IBOutlet weak var myMiiniView: UIView!
    @IBOutlet weak var viewBack: UIView!
    
    @IBOutlet weak var btnContinue: UIButton!
    
    @IBOutlet weak var pickerFeet: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerFeet.delegate = self
        pickerFeet.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewBackCorner()
        gradientForView()
        gradientForbtn()
    }
    
    var call1 = 0
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       if call1 == 1
       {
        viewBackCorner()
        gradientForView()
        gradientForbtn()
       }
        call1 += 1
     
    }
   
    

    @IBAction func btnContinue(_ sender: Any) {
//        let inputData = metric[pickerFeet.selectedRow(inComponent: 0)]
//        print(inputData)
//        self.view.endEditing(true)
      
//        let vc1 = self.storyboard?.instantiateViewController(identifier: "SettingViewController") as! SettingViewController
        del!.setData(flag: true)
//        vc1.nav = false
//        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SettingPickerViewController : UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return metric.count
    }

    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        pickerFeet.subviews.first?.subviews.first?.subviews[2].layer.insertSublayer(gradientBackground((pickerFeet.subviews.first!.subviews.first?.subviews[2].bounds)!), at: 0)
        let label = (view as? UILabel) ?? UILabel()
        let title = NSAttributedString(string: metric[row], attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)])
        label.textColor = .white
        label.attributedText = title
        label.textAlignment = .center
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    
    func gradientBackground(_ fr : CGRect) -> CAGradientLayer
    {
        let layer0 = CAGradientLayer()
        layer0.frame = fr
        layer0.colors = [
          UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1).cgColor,
          UIColor(red: 0.435, green: 0.533, blue: 0.988, alpha: 1).cgColor
        ]
        layer0.cornerRadius = 5
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        return layer0
    }
    
    
    func gradientForbtn()
    {
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: self.btnContinue.frame.size)
        gradient.colors = [
            UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1).cgColor,
            UIColor(red: 0.53, green: 0.463, blue: 0.979, alpha: 1).cgColor,
            UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 1).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.cornerRadius = 15
        btnContinue.layer.insertSublayer(gradient, at: 0)
    }
  

    func gradientForView()
    {
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: self.myMiiniView.frame.size)
        gradient.colors = [
          UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1).cgColor,
          UIColor(red: 0.435, green: 0.533, blue: 0.988, alpha: 1).cgColor
        ]
        gradient.cornerRadius = 15
        myMiiniView.layer.insertSublayer(gradient, at: 0)
    }
    func viewBackCorner(){

        if #available(iOS 11.0, *) {
            viewBack.layer.cornerRadius = 15
            viewBack.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

            }
    }
    
}
