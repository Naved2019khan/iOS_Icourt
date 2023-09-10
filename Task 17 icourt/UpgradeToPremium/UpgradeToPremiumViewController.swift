//
//  UpgradeToPremiumViewController.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 26/04/23.
//

import UIKit

class UpgradeToPremiumViewController: UIViewController {

    @IBOutlet weak var viewBlur: UIView!
    @IBOutlet weak var imageLeft: UIImageView!
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var viewOfBall: UIView!
    @IBOutlet weak var btnGet12: UIButton!
    var call = 0
    @IBOutlet weak var clickHereLabel: UILabel!

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    @IBAction func btnGet12(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "PickYourPlanViewController") as! PickYourPlanViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    var bannerContent = Int()
    var bannerBtnText = [["12","$166"],[ "6" ,"$200"],["1", "$300"]]
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if call == 1{
            gradientForItem(view0: viewOfBall, colorSet: colors, cornerRadiusValue: 10, startPt: nil, endPt: nil, loc: nil, lineWidth: 2)
            gradientForItem (view0: btnGet12, colorSet: colors, cornerRadiusValue: 15, startPt: nil, endPt: nil, loc: nil, lineWidth: nil)
            callingDesign()
        }
        call += 1
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        underlineToText(clickHereLabel)
        imageLeft.layer.cornerRadius = imageLeft.frame.size.height/2
        imageRight.layer.cornerRadius = imageRight.frame.size.height/2
    }
    
    let colors = [
        UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1),
        UIColor(red: 0.53, green: 0.463, blue: 0.979, alpha: 1),
        UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 1)
    ]
    func callingDesign(){
        blurView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {
            
        }
       
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.bannerCollectionView.reloadData()
        }
       
    }
}
extension UpgradeToPremiumViewController{
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
        viewBlur.insertSubview(eff, at: 2)
    }
    
}



extension UpgradeToPremiumViewController :
    UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as! bannerCollectionViewCell
        cell.bannerMainView.layer.cornerRadius = 5
        bannerCollectionView.tag = indexPath.section
        let colorBannner =  [
            UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1),
            UIColor(red: 0.435, green: 0.533, blue: 0.988, alpha: 1)
          ]
        cell.numericLabel.textAlignment = .center
        cell.numericLabel.text = bannerBtnText[indexPath.section][0]
        cell.priceLabel.textAlignment = .center
        cell.priceLabel.text = bannerBtnText[indexPath.section][1] + "/MT"
        
        if bannerContent == indexPath.section
        {
            gradientText(label: cell.months,colorSet: colorBannner)
            gradientText(label: cell.numericLabel,colorSet: colorBannner)
            gradientText(label: cell.priceLabel,colorSet: colorBannner)
            btnGet12.setTitle("Get " + bannerBtnText[bannerContent][0] + " Month/" + bannerBtnText[bannerContent][1], for: .normal)
        }
        else{
            cell.numericLabel.textColor = .black
            cell.months.textColor = .black
            cell.priceLabel.textColor = .black
        }
         
       
        gradientForItem(view0: cell.bannerViewSave, colorSet: colorBannner, cornerRadiusValue: 0, startPt: nil, endPt:  nil, loc:  nil, lineWidth: nil)
       
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollectionView.frame.size.width/3 , height: bannerCollectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
//            self.bannerCollectionView.transform =  CGAffineTransform.identity
//                   }, completion: nil)
        bannerContent = indexPath.section
//        bannerCollectionView.reloadItems(at: [indexPath])
        bannerCollectionView.reloadData()
    }
    
    func gradientText(label : UILabel , colorSet : [UIColor])
    {
        let gradient = UIImage.gradientImage(bounds: label.bounds, colors: colorSet)
        label.textColor = UIColor(patternImage: gradient)
    }
    
        
}


extension UpgradeToPremiumViewController{
    func underlineToText(_ label : UILabel)
    {
    
        let attText = NSMutableAttributedString(string : label.text ?? "")
        let range = (label.text! as NSString).range(of: "Click here")
        let len = (label.text! as NSString).range(of: "to see the features of premium")
        let attributedString = attText
            
        // Add Underline Style Attribute.
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: range);
        gradientText(label: label, colorSet: colors)
        attributedString.addAttribute(.foregroundColor,value : UIColor.white,range: len)
    

        label.attributedText = attributedString
    }
}



extension UIImage {
    static func gradientImage(bounds: CGRect, colors: [UIColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)
        // This makes it left to right, default is top to bottom
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { ctx in
            gradientLayer.render(in: ctx.cgContext)
        }
    }
}
