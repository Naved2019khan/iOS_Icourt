//
//  LuckyViewController.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 24/04/23.
//

import UIKit

class LuckyViewController: UIViewController {

    @IBOutlet weak var btnContinue: UIButton!
    
    @IBAction func btnContinue(_ sender: Any) {
   
     let vc = storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
    self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    var call = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    
    }
    let color = [
        UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 0.5).cgColor,
        UIColor(red: 0.53, green: 0.463, blue: 0.979, alpha: 0.3).cgColor,
        UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 0.3).cgColor
      ]
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if call == 1 {
            gradientFunc(view, color)
            btnLoginFunc()
           
        }
        call += 1
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
        
    }
    
    
}
extension LuckyViewController {
    
    
    func btnLoginFunc(){
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(x: 0, y:  0, width: btnContinue.frame.size.width, height: btnContinue.frame.size.height)
        gradient.colors = [
            UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1).cgColor,
            UIColor(red: 0.53, green: 0.463, blue: 0.979, alpha: 1).cgColor,
            UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 1).cgColor
        ]
        gradient.cornerRadius = 15
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        btnContinue.layer.insertSublayer(gradient, at: 0)
        btnContinue.layer.cornerRadius = 15
    }
    func gradientFunc(_ myView : UIView, _ color : Any){
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(x: 0, y:  0, width: myView.frame.size.width, height: myView.frame.size.height)
        gradient.colors = color as? [Any]
        gradient.locations = [0, 0.43, 1]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
//        gradient.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1.07, b: 0.18, c: -0.43, d: 0.87, tx: 0.22, ty: -0.11))
        gradient.position = myView.center
        myView.layer.insertSublayer(gradient, at: 0)

    }


}
