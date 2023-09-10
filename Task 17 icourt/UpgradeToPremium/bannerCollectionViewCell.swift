//
//  bannerCollectionViewCell.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 27/04/23.
//

import UIKit

class bannerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bannerViewSave: UIView!
    @IBOutlet weak var bannerMainView: UIView!
    @IBOutlet weak var numericLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var months: UILabel!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
//    override var isSelected: Bool {
//           didSet {
//               UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
//                   self.layer.zPosition = self.isSelected ? 1 : -1
//                self.transform = self.isSelected ? CGAffineTransform(scaleX: 1.1, y: 1.1) : CGAffineTransform.identity
//               }, completion: nil)
//           }
//    }
}


