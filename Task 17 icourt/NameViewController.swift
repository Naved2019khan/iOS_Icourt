//
//  NameViewController.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 17/04/23.
//

import UIKit

class NameViewController: UIViewController{

    @IBOutlet weak var vieContent: UIView!
    @IBOutlet weak var viewImagePlayer: UIView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var innerView: UIView!
    
    var colors = [
        UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1),
        UIColor(red: 0.53, green: 0.463, blue: 0.979, alpha: 1),
        UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 1)
    ]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        txtField.becomeFirstResponder()
        txtField.autocorrectionType = .no
         
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async { [self] in
            forViewDidDesign()
        }
    }

    
    @IBAction func btnContinue(_ sender: Any) {
        
//        && !txtField.text!.hasSuffix(" ") if need space in last valditation
        if txtField.text!.isValidFullName
        {
            let vc =  self.storyboard?.instantiateViewController(identifier: "FourthViewController") as! FourthViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else{
            txtField.text!.removeAll()
            let alert = UIAlertController(title: "InValid Name", message: "Please enter valid name", preferredStyle: .alert)
                  alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
                  self.present(alert, animated: true, completion: nil)
            txtField.becomeFirstResponder()
        }
        
        
    }

    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}

extension NameViewController{
    func forViewDidDesign()
    {
        textFieldConfig()
        forCenterImageCollection()
        playerBackground()
        btnGradient()
        imageCorner()
        blurView()
    }

    func textFieldConfig(){
           gradientForItem(view0: txtField, colorSet: colors, cornerRadiusValue: 10, startPt: nil, endPt: nil, loc: nil, lineWidth: 2)
           let indentView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
           txtField.leftView = indentView
           txtField.leftViewMode = .always
    }
    
    func forCenterImageCollection()
    {
        myView.layer.cornerRadius = myView.frame.size.height/2
        myView.layer.borderColor = UIColor.white.cgColor
        innerView.layer.cornerRadius = innerView.frame.size.height/2
        viewImagePlayer.layer.cornerRadius = viewImagePlayer.frame.size.height/2
        viewImagePlayer.backgroundColor = .clear
    }
    
    func playerBackground(){
        let newColor = [ UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1),
                         UIColor(red: 0.435, green: 0.533, blue: 0.988, alpha: 1)]
        gradientForItem(view0: innerView, colorSet: newColor, cornerRadiusValue: innerView.frame.height/2, startPt: nil, endPt: nil, loc: nil, lineWidth: nil)
    }
    
   
    
    func btnGradient(){
        gradientForItem(view0: btnContinue, colorSet: colors, cornerRadiusValue: 15, startPt: nil, endPt: nil, loc: nil, lineWidth: nil)
    }

    
    func imageCorner(){
        if #available(iOS 11.0, *) {
            playerImage.layer.cornerRadius = playerImage.frame.size.width/2
            playerImage.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            }
    }

    func blurView()
    {
        leftImage.layer.cornerRadius = leftImage.frame.size.height/2
        rightImage.layer.cornerRadius = rightImage.frame.size.height/2
        let blur =  UIBlurEffect(style: .dark)
        let eff = UIVisualEffectView(effect: blur)
        eff.frame = backgroundView.bounds
        eff.alpha = 1
        backgroundView.insertSubview(eff, at: 2)
    }
    
}

extension NameViewController{
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
    
}

extension String {
    var  containAlpha: Bool
  {
    let exp =  "[A-Za-z\\s]"
    let pred =   NSPredicate(format: "SELF MATCHES %@", exp)
    return pred.evaluate(with: self)
  }
    
    var isValidFullName : Bool{
        let exp =  #"^([\p{L},.'’-]+(\s|$))+"#
        let pred =   NSPredicate(format: "SELF MATCHES %@", exp)
        return pred.evaluate(with: self)
    }
}
