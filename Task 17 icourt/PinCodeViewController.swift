//
//  PinCodeViewController.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 02/05/23.
//

import UIKit

class PinCodeViewController: UIViewController {

    @IBOutlet weak var viewBlur: UIView!
    @IBOutlet weak var otherImage: UIImageView!
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var lockerImage: UIImageView!
    
    @IBOutlet var dotViewCollection: [UIView]!
    @IBOutlet weak var roundedImageVIew: UIView!
    
    @IBOutlet var btnCollection: [UIButton]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnCollectionTag()
    }
    let colrsRainbow
    = [
        UIColor(red: 0.996, green: 0.212, blue: 0.91, alpha: 1),
        UIColor(red: 1, green: 0.906, blue: 0.035, alpha: 1),
        UIColor(red: 0.588, green: 0.835, blue: 0.412, alpha: 1),
        UIColor(red: 0.016, green: 0.761, blue: 0.973, alpha: 1),
        UIColor(red: 0.059, green: 0.761, blue: 0.933, alpha: 1),
        UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)
      ]
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.blurView()
            self.dotView()
            self.gradientForItem(view0: self.roundedImageVIew, colorSet: self.colrsRainbow, cornerRadiusValue: self.roundedImageVIew.frame.width/2, startPt: CGPoint(x: 0.25, y: 0), endPt: nil, loc: nil, lineWidth: 15)
       
        }
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidAppear(true)
//        DispatchQueue.main.async {
//
//        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
    }
    func btnCollectionTag(){
        var tg = 1
        for b in btnCollection{
            b.tag = tg
            tg += 1
        }
    }
    var sizeOfInput = 0
    var  arrForPin = [Int]()
    @IBAction func btnCollection(_ sender: UIButton) {
      
        if sender.tag != 11 && sizeOfInput < 4
        {
           
            arrForPin.append(sender.tag%10)
            dotViewCollection[sizeOfInput].backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
            sizeOfInput += 1
           
        }
        else if sizeOfInput > 0  && sender.tag == 11{
            arrForPin.removeLast()
            dotViewCollection[sizeOfInput - 1].backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
            sizeOfInput -= 1
        }
        print(arrForPin)
    }
    
  
    
    
    func dotView(){
        for v in dotViewCollection{
            v.layer.cornerRadius = v.frame.height/2
            v.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        }
        
    }
        
}



extension PinCodeViewController
{
    
    
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
            let rect = view0!.bounds.insetBy(dx: 0 , dy: 0 )
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
    func gradientForTableViewCell(view0 : UIView? , colorSet : [UIColor] , cornerRadiusValue : CGFloat,startPt : CGPoint?,endPt : CGPoint?, loc : [NSNumber]?,lineWidth: CGFloat?,gradient : CAGradientLayer)
    {
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
        leftImage.layer.cornerRadius = leftImage.frame.size.height/2
        imageRight.layer.cornerRadius = imageRight.frame.size.height/2
       otherImage.layer.cornerRadius = otherImage.frame.size.height/2
        let blur =  UIBlurEffect(style: .dark)
        let eff = UIVisualEffectView(effect: blur)
        eff.frame = viewBlur.bounds
        eff.alpha = 1
        viewBlur.insertSubview(eff, at: 3)
    }
    
}

extension PinCodeViewController{
    
    
    
}
