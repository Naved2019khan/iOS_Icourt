//
//  BeginViewController.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 17/04/23.
//

import UIKit

class BeginViewController: UIViewController {
    
    
    @IBOutlet weak var viewBlur: UIView!
    @IBOutlet weak var imageLeft: UIImageView!
    @IBOutlet weak var imageRight1: UIImageView!
    @IBOutlet weak var imageRight2: UIImageView!
    var call = 0
    
    
    //    navigation
    
    @IBAction func btnContinue(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LuckyViewController") as! LuckyViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
        let alert = UIAlertController(title: "Notice", message: "Enter Complete Otp", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    func imageView(_ viewImage : UIImageView)
    {
        viewImage.layer.cornerRadius = viewImage.frame.height/2
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    let colors = [
        UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1),
        UIColor(red: 0.53, green: 0.463, blue: 0.979, alpha: 1),
        UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 1)
    ]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        blurView()
        imageView(imageLeft)
        imageView(imageRight1)
        imageView(imageRight2)
        
        
    }
}
extension BeginViewController{
    func gradientForItem(view0 : UIView? , colorSet : [UIColor] , cornerRadiusValue : CGFloat,startPt : CGPoint?,endPt : CGPoint?, loc : [NSNumber]?,lineWidth: CGFloat?)
    {
        let gradient = CAGradientLayer()
        if view0 != nil {
            gradient.frame =  CGRect(origin: CGPoint.zero, size: view0!.frame.size)
        }
        gradient.locations = loc
        gradient.startPoint = startPt ?? CGPoint(x: 0, y: 0)
        gradient.endPoint = endPt ?? CGPoint(x: 1, y: 1)
        gradient.colors = colorSet.map(\.cgColor)
        gradient.cornerRadius = cornerRadiusValue
        view0!.layer.cornerRadius = cornerRadiusValue
        
        if let lw = lineWidth   {
            let rect = view0!.bounds.insetBy(dx: lw , dy: lw )
            let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadiusValue)
            let shape = CAShapeLayer()
            shape.lineWidth = lw
            shape.path = path.cgPath
            shape.strokeColor = UIColor.black.cgColor
            shape.fillColor = UIColor.clear.cgColor
            view0!.layer.addSublayer(gradient)
            gradient.mask = shape
        }
        else{
            view0!.layer.insertSublayer(gradient, at: 0)
        }
        
    }
    
    
    func blurView()
    {
        let blur =  UIBlurEffect(style: .dark)
        let eff = UIVisualEffectView(effect: blur)
        eff.frame = viewBlur.bounds
        eff.alpha = 1
        viewBlur.insertSubview(eff, at: 3)
    }
    
}
