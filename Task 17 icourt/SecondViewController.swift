//
//  secondViewController.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 19/04/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    var call = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if call == 1
        {
            btnConfigFunc()
            blurView()
        }
        call += 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    @IBAction func btnAvatar(_ sender: Any) {
        let vc =  self.storyboard?.instantiateViewController(identifier: "NameViewController") as! NameViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SecondViewController{
    
    func blurView()
    {
        leftImage.layer.cornerRadius = leftImage.frame.size.height/2
        rightImage.layer.cornerRadius = rightImage.frame.size.height/2
        let blur =  UIBlurEffect(style: .dark)
        let eff = UIVisualEffectView(effect: blur)
        eff.frame = backView.bounds
        eff.alpha = 1
        backView.insertSubview(eff, at: 2)
    }
    
    
    func btnConfigFunc()
    {
        let gradient = CAGradientLayer()
             gradient.frame =  CGRect(x: 0, y:  0, width: btnCreate.frame.size.width, height: btnCreate.frame.size.height)
             gradient.colors = [ UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1).cgColor,
                                 UIColor(red: 0.435, green: 0.533, blue: 0.988, alpha: 1).cgColor,
                                 UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 1).cgColor
             ]
                            
             gradient.cornerRadius = 15
        
             gradient.startPoint = CGPoint(x: 0, y: 0)
             gradient.endPoint = CGPoint(x: 1, y: 1)
             btnCreate.layer.insertSublayer(gradient, at: 0)
        btnCreate.layer.cornerRadius = 15
        
    }

}
