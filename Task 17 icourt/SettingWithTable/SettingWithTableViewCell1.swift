//
//  SettingWithTableViewCell1.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 01/05/23.
//

import UIKit

class SettingWithTableViewCell1: UITableViewCell {

    @IBOutlet weak var transparentView: UIView!
    @IBOutlet weak var swtichBtn: UIButton!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var onLabel: UILabel!
    @IBOutlet weak var offLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    var call = 0
    
    let colors = [
        UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1),
        UIColor(red: 0.53, green: 0.463, blue: 0.979, alpha: 1),
        UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 1)
    ]
    @IBAction func switchBtn(_ sender: Any) {
        
        //initial right hidden and
        if leftImage.isHidden == false
        {
            onLabel.isHidden = false
            offLabel.isHidden = true
            
            leftImage.isHidden = true
            rightImage.isHidden = false
            swtichBtn.backgroundColor = UIColor(red: 0.63, green: 0.39, blue: 0.97, alpha: 1)
        }
        else{
            onLabel.isHidden = true
            offLabel.isHidden = false
            
            leftImage.isHidden = false
            rightImage.isHidden = true
//            0.63, 0.39, 0.97, 1.0
            swtichBtn.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15)
            
        }
    }
    func switchBtnFunc(){
        onLabel.isHidden = true
        swtichBtn.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 0.15)
        swtichBtn.layer.cornerRadius = swtichBtn.frame.height/2
        leftImage.layer.cornerRadius = leftImage.frame.height/2
        rightImage.layer.cornerRadius = rightImage.frame.height/2
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if call == 1
        {
            switchBtnFunc()
        gradientForItem(view0: transparentView, colorSet: colors, cornerRadiusValue: 10, startPt: nil, endPt: nil, loc: nil, lineWidth: 2)
        }
        call += 1
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension SettingWithTableViewCell1{
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
