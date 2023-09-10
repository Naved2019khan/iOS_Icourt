//
//  SettingWithTableViewController.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 28/04/23.
//

import UIKit

class SettingWithTableViewController: UIViewController {

 

    @IBOutlet weak var viewBlur: UIView!
    @IBOutlet weak var imageLeft: UIImageView!
    @IBOutlet weak var imageRight: UIImageView!
    var call = 0

    @IBOutlet weak var SettingWithMyTableView: UITableView!
    
    @IBAction func btnGet12(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "PickYourPlanViewController") as! PickYourPlanViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    var myData = ["Terms & conditions","Privacy policy","Delete account","Change pin","Contact us","Log out"]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if call == 1{
           
            SettingWithMyTableView.reloadData()
        }
        call += 1
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    let colors = [
        UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1),
        UIColor(red: 0.53, green: 0.463, blue: 0.979, alpha: 1),
        UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 1)
    ]
    func callingDesign(){
        blurView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async { [self] in
            callingDesign()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        
        
    }
}
extension SettingWithTableViewController{
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
    
    
    func blurView()
    {
        imageLeft.layer.cornerRadius = imageLeft.frame.height/2
        imageRight.layer.cornerRadius = imageRight.frame.height/2
        let blur =  UIBlurEffect(style: .dark)
        let eff = UIVisualEffectView(effect: blur)
        eff.frame = viewBlur.bounds
        eff.alpha = 1
        viewBlur.insertSubview(eff, at: 2)
    }
    
}


extension SettingWithTableViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1
        {
            return 6
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0
        {
        let cell = SettingWithMyTableView.dequeueReusableCell(withIdentifier: "SettingWithTableViewCell1") as! SettingWithTableViewCell1
         
        return cell
        }
        let cell = SettingWithMyTableView.dequeueReusableCell(withIdentifier: "SettingWithTableViewCell2") as! SettingWithTableViewCell2
        cell.notificationLabel.text = myData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == [1,5]
        {
            print("tap",indexPath)
        let vc = self.storyboard?.instantiateViewController(identifier: "PinCodeViewController") as! PinCodeViewController
        self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
        
    }

    
    
    
}
