//
//  PickYourPlanTableViewCell4.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 27/04/23.
//

import UIKit

class PickYourPlanTableViewCell4: UITableViewCell {

    @IBOutlet weak var recommendedView: UIView!
    @IBOutlet weak var seeBenefitsBtn: UIButton!
    @IBOutlet weak var landScapeView: UIView!
    var call  = 0
    
   
    let colors = [
        UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1),
        UIColor(red: 0.53, green: 0.463, blue: 0.979, alpha: 1),
        UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 1)
    ]
    let colors2
    = [
        UIColor(red: 1, green: 1, blue: 1, alpha: 0.15),
        UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
    ]
    override func awakeFromNib() {
        super.awakeFromNib()
           
    landScapeView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15)
        // Initialization code
    }
    let gradient = CAGradientLayer()

    
    override func layoutSubviews() {
        super.layoutSubviews()
        if call  == 1
        {
        gradientForItem(view0: recommendedView, colorSet: colors, cornerRadiusValue: 5, startPt: nil, endPt: nil, loc: nil, lineWidth: nil)
        }
        call += 1
    }

}


extension PickYourPlanTableViewCell4{
    
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
