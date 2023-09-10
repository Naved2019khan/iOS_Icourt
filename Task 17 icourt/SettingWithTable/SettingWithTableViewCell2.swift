//
//  SettingWithTableViewCell2.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 01/05/23.
//

import UIKit

class SettingWithTableViewCell2: UITableViewCell {

    @IBOutlet weak var chevronbtn: UIButton!
    @IBOutlet weak var notificationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var call = 0
    let colors = [
        UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1),
        UIColor(red: 0.53, green: 0.463, blue: 0.979, alpha: 1),
        UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 1)
    ]
    @IBOutlet weak var transparentView: UIView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async { [self] in
            gradientForItem(view0: transparentView, colorSet: colors, cornerRadiusValue: 10, startPt: nil, endPt: nil, loc: nil, lineWidth: 2)
        }
        if call == 1
        {
         
        }
        call += 1
    }
}

extension SettingWithTableViewCell2{
    func gradientForItem(view0 : UIView? , colorSet : [UIColor] , cornerRadiusValue : CGFloat,startPt : CGPoint?,endPt : CGPoint?, loc : [NSNumber]?,lineWidth: CGFloat?)
    {
        let gradient = CAGradientLayer()
        if view0 != nil {
//            gradient.frame =  CGRect(origin: CGPoint.zero, size: view0!.frame.size)
            gradient.frame = view0!.bounds
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
