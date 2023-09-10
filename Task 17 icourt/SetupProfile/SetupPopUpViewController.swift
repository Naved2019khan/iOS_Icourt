//
//  SetupPopUpViewController.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 25/04/23.
//

import UIKit
protocol  sendData1{
    func setData(flag : Bool)
}
class SetupPopUpViewController: UIViewController {
        @IBOutlet weak var myMiiniView: UIView!
        @IBOutlet weak var viewBack: UIView!
        @IBOutlet weak var labelSetupProfile: UILabel!
        @IBOutlet weak var btnContinue: UIButton!
        var del : sendData1!
        override func viewDidLoad() {
            super.viewDidLoad()
            setupGrad()
         
        }
  
    var call1 = 0
    @IBAction func btnContinue(_ sender: Any) {
        del!.setData(flag: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if call1 == 1{
            viewBackCorner()
           gradientForItem(view0: myMiiniView, colorSet: colors, cornerRadiusValue: 15, startPt: nil, endPt: nil, loc: nil,lineWidth: nil)
           gradientForItem(view0: btnContinue, colorSet: colors, cornerRadiusValue: 15, startPt: nil, endPt: CGPoint(x: 1, y: 1), loc: nil,lineWidth: nil)
        }
        call1 += 1
       
    }
    
    let colors = [
        UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1),
        UIColor(red: 0.53, green: 0.463, blue: 0.979, alpha: 1),
        UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 1)
    ]
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
     
    }

    }
extension SetupPopUpViewController{
    
    func  setupGrad(){
        let colors1 = [
            UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1),
            UIColor(red: 0.53, green: 0.463, blue: 0.979, alpha: 1)
        ]
        let gradient = UIImage.gradientImage(bounds: labelSetupProfile.bounds, colors: colors1)
        labelSetupProfile.textColor = UIColor(patternImage: gradient)
    }
    
   
}
extension SetupPopUpViewController{
        func viewBackCorner(){
            if #available(iOS 11.0, *) {
                viewBack.layer.cornerRadius = 15
                viewBack.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

                }
        }
        func gradientForItem(view0 : UIView? , colorSet : [UIColor] , cornerRadiusValue : CGFloat,startPt : CGPoint?,endPt : CGPoint?, loc : [NSNumber]?,lineWidth: CGFloat?)
        {
            let gradient = CAGradientLayer()
            if view0 != nil {
                gradient.frame =  CGRect(origin: CGPoint.zero, size: view0!.frame.size)
            }
            gradient.locations = loc
            gradient.startPoint = startPt ?? CGPoint(x: 0, y: 0)
            gradient.endPoint = endPt ?? CGPoint(x: 1, y: 1)
            gradient.colors = colorSet.map{$0.cgColor}
            gradient.cornerRadius = cornerRadiusValue
            
            if let lw = lineWidth   {
                let rect = view0!.bounds.insetBy(dx: lw , dy: lw )
                let path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
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

