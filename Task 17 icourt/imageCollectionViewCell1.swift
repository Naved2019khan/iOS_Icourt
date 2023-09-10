//
//  imageCollectionViewCell1.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 19/04/23.
//

import UIKit

class imageCollectionViewCell1: UICollectionViewCell {
    @IBOutlet weak var transparentView1: UIView!
    let gradient = CAGradientLayer()
    override func layoutSublayers(of layer: CALayer) {
           super.layoutSublayers(of: self.layer)
           gradient.frame = transparentView1.bounds
        gradient.colors = [
            UIColor(red: 0.22, green: 0.29, blue: 0.404, alpha: 0).cgColor,
            UIColor(red: 0.024, green: 0.114, blue: 0.255, alpha: 0.5).withAlphaComponent(1).cgColor,
            UIColor(red: 5/255, green: 32/255, blue: 73/255, alpha: 1).withAlphaComponent(1).cgColor
          ]
         //gradient.locations = [0.0, 1.0]
         gradient.frame = transparentView1.bounds
         gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
         gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.backgroundColor = .none
        
         transparentView1.layer.insertSublayer(gradient, at: 0)
//        transparentView1.addGradient(with: gradient, colorSet: colorSet, locations: location)
       }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
//        transparentView1Func()
        
    }
    
}
