//
//  PickYourPlanViewController.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 27/04/23.
//

import UIKit

class PickYourPlanViewController: UIViewController {
//    func reloadData(_ newFlag: Bool) {
//        pickYourPlanTableView.reloadData()
//        pickYourPlanTableView.reloadSections([0], with: .none)
//    }
//

    

   
    @IBOutlet weak var imageLeft: UIImageView!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var pickYourPlanTableView: UITableView!
    @IBOutlet weak var viewBlur: UIView!
    
    
    var btnMonth : Bool? = nil
    var btnCall = 0
    var btnCall1 = 0
    var rectForMonths = CGRect()
    var rectForYears = CGRect()
    var landScapeViewContent = Int()
    var call3 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func continueBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SettingWithTableViewController") as! SettingWithTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    let colors = [
        UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1),
        UIColor(red: 0.53, green: 0.463, blue: 0.979, alpha: 1),
        UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 1)
    ]
//
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        if call3 == 1
//             {
//
//                 blurView()
//
//             }
//        call3 += 1
//    }
//
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       bottomViewAndBtn()
       
       
      
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        DispatchQueue.main.async {
          
        }
     
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        DispatchQueue.main.async {
            self.pickYourPlanTableView.reloadData()
            self.blurView()
        }
        
    }
    
    func bottomViewAndBtn()
    {
        let colorBottom
        =  [
            UIColor(red: 0.039, green: 0.157, blue: 0.298, alpha: 0),
            UIColor(red: 0.039, green: 0.157, blue: 0.298, alpha: 1).withAlphaComponent(1)
          ]
        gradientForItem(view0: bottomView, colorSet: colorBottom, cornerRadiusValue: 0, startPt: nil, endPt: nil, loc: nil, lineWidth: nil)
        gradientForItem(view0: continueBtn, colorSet: colors, cornerRadiusValue: 15, startPt: nil, endPt: nil, loc: nil, lineWidth: nil)
        
    }

}

extension PickYourPlanViewController{
    
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
    func gradientForTableViewCellButton(view0 : UIView? , colorSet : [UIColor] , cornerRadiusValue : CGFloat,startPt : CGPoint?,endPt : CGPoint?, loc : [NSNumber]?,lineWidth: CGFloat?,gradient : CAGradientLayer,boundBtn : CGRect)
    {
        if view0 != nil {
            gradient.frame =  boundBtn
        }
        gradient.locations = loc
        gradient.startPoint = startPt ?? CGPoint(x: 0, y: 0)
        gradient.endPoint = endPt ?? CGPoint(x: 1, y: 1)
        gradient.colors = colorSet.map(\.cgColor)
        gradient.cornerRadius = cornerRadiusValue
        view0!.layer.cornerRadius = cornerRadiusValue
        
        if let lw = lineWidth   {
            let rect = boundBtn.insetBy(dx: lw , dy: lw )
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
        imageLeft.layer.cornerRadius = imageLeft.frame.size.height/2
        imageRight.layer.cornerRadius = imageRight.frame.size.height/2
        let blur =  UIBlurEffect(style: .dark)
        let eff = UIVisualEffectView(effect: blur)
        eff.frame = viewBlur.bounds
        eff.alpha = 1
        viewBlur.insertSubview(eff, at: 2)
    }
    
}


extension PickYourPlanViewController : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2
        {
            return 3
        }
        return  1
    }
    
    
    fileprivate func extractedFunc(_ cell : PickYourPlanTableViewCell1,_ b : Bool) {
        cell.gradient1.removeFromSuperlayer()
        cell.gradient2.removeFromSuperlayer()
        if b {
   
            gradientForTableViewCellButton(view0: cell.monthlyBtn, colorSet: colors, cornerRadiusValue: 10, startPt: nil, endPt: nil, loc: nil, lineWidth: nil, gradient: cell.gradient1,boundBtn: rectForMonths)
            
            gradientForTableViewCellButton(view0: cell.yearlyBtn, colorSet: colors, cornerRadiusValue: 10, startPt: nil, endPt: nil, loc: nil, lineWidth: 2, gradient: cell.gradient2,boundBtn: rectForYears)
            
            
            cell.monthlyBtn.isUserInteractionEnabled = false
            cell.yearlyBtn.isUserInteractionEnabled = true
           
            
          
        }
        else{
            
            gradientForTableViewCellButton(view0: cell.yearlyBtn, colorSet: colors, cornerRadiusValue: 10, startPt: nil, endPt: nil, loc: nil, lineWidth: nil, gradient: cell.gradient2,boundBtn: rectForYears)
             gradientForTableViewCellButton(view0: cell.monthlyBtn, colorSet: colors, cornerRadiusValue: 10, startPt: nil, endPt: nil, loc: nil, lineWidth: 2, gradient: cell.gradient1,boundBtn: rectForMonths)
            cell.monthlyBtn.isUserInteractionEnabled = true
            cell.yearlyBtn.isUserInteractionEnabled = false
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0
        {
            
            let cell = pickYourPlanTableView.dequeueReusableCell(withIdentifier: "PickYourPlanTableViewCell1", for: indexPath) as! PickYourPlanTableViewCell1
          
            if btnMonth != nil{
              
            extractedFunc(cell,btnMonth!)
            
            }
            else{
                if btnCall == 1 {
                    gradientForItem(view0: cell.yearlyBtn, colorSet: colors, cornerRadiusValue: 10, startPt: nil, endPt: nil, loc: nil, lineWidth: 2)
                    gradientForItem(view0: cell.monthlyBtn, colorSet: colors, cornerRadiusValue: 10, startPt: nil, endPt: nil, loc: nil, lineWidth: 2)
                    rectForYears = cell.yearlyBtn.bounds
                    rectForMonths = cell.monthlyBtn.bounds
                }
                btnCall += 1
          
            }
            
            cell.monthlyBtn.addTarget(self, action: #selector(changeColor(_:)), for: .touchUpInside)
            cell.yearlyBtn.addTarget(self, action: #selector(changeColorOther(_:)), for: .touchUpInside)
            
            return  cell
        }
        
        
        
        if indexPath.section == 1
        {
            let cell = pickYourPlanTableView.dequeueReusableCell(withIdentifier: "PickYourPlanTableViewCell2", for: indexPath) as! PickYourPlanTableViewCell2
            return  cell
        }
        
        
        // 3nd land scape
        
        let cell = pickYourPlanTableView.dequeueReusableCell(withIdentifier: "PickYourPlanTableViewCell4", for: indexPath) as! PickYourPlanTableViewCell4
       
      
        if indexPath.section == 2 && landScapeViewContent == indexPath.row + 10
        {
            
            gradientForTableViewCell(view0: cell.landScapeView, colorSet: colors, cornerRadiusValue: 10, startPt: nil, endPt: nil, loc: nil, lineWidth: 2, gradient: cell.gradient)
        }
        else{
            
                let colorSet2 =
                   [
                       UIColor(red: 1, green: 1, blue: 1, alpha: 0.15),
                       UIColor(red: 1, green: 1, blue: 1, alpha: 0.2),
                   ]
               cell.gradient.removeFromSuperlayer()
               gradientForTableViewCell(view0: cell.landScapeView, colorSet: colorSet2, cornerRadiusValue: 10, startPt: nil, endPt: nil, loc: nil, lineWidth: 2, gradient: cell.gradient)
            

            
            
            }
        if indexPath.row == 1
        {
            cell.recommendedView.isHidden = false
            cell.landScapeView.addSubview(cell.recommendedView)
        }
        pickYourPlanTableView.tag = indexPath.row  + 10
        return  cell
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2{
        landScapeViewContent = indexPath.row + 10
        pickYourPlanTableView.reloadData()
        }
    
        
    }
    
    
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2
        {
            return 220
        }
        if indexPath.section == 1
        {
            return 80
        }
        return 100
    }
    

    @objc func changeColor(_ sender:UIButton)
    {
        if btnMonth != nil && !btnMonth!{
        btnMonth = true

        }
        else if btnMonth == nil
        {
            btnMonth = true
        }
        DispatchQueue.main.async {
            self.pickYourPlanTableView.reloadSections([0], with: .none)
        }
    }
    
    @objc func changeColorOther(_ sender:UIButton)
    {
        if btnMonth != nil && btnMonth!
        {
         btnMonth = false
            
        }
        else if btnMonth == nil
        {
            btnMonth = false
        }
        DispatchQueue.main.async {
            self.pickYourPlanTableView.reloadSections([0], with: .none)
        }
    }
    
}
