//
//  FifthOtpViewController.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 19/04/23.
//

import UIKit

class FifthOtpViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var labelEnter: UILabel!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet var textFieldOtp: [UITextField]!
    @IBOutlet weak var btnContinue: UIButton!
    
    var layersToRemoveLater = [CAGradientLayer]()
    var call = 0
    
    let colors = [
        UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1),
        UIColor(red: 0.53, green: 0.463, blue: 0.979, alpha: 1),
        UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 1)
    ]
    let colors1 = [
        UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 0.4),
        UIColor(red: 0.53, green: 0.463, blue: 0.979, alpha: 0.4),
        UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 0.4),
        UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layersToRemoveLater = Array.init(repeating: CAGradientLayer(), count: 6)
        textFieldOtp[0].becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async { [self] in
            callingDesign()
        }
    }
    func callingDesign(){
     
   
        textFieldOtpFunc()
        labelEnterFunc()
        blurView()
        btnContinueFunc()
    }
    

  
    @IBAction func btnContinue(_ sender: Any) {
        if textFieldOtp[5].text != ""{
        let vc = storyboard?.instantiateViewController(withIdentifier: "LuckyViewController") as! LuckyViewController
        self.navigationController?.pushViewController(vc, animated: true)
        }
        else{
            textFieldOtp[0].isUserInteractionEnabled = true
            textFieldOtp[0].becomeFirstResponder()
            textFieldOtpFunc()
            let alert = UIAlertController(title: "Notice", message: "Enter Complete Otp", preferredStyle: UIAlertController.Style.alert)
            
                  alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
                  self.present(alert, animated: true, completion: nil)
          
           
              }
    }
    
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    
}

extension FifthOtpViewController {
    func textFieldOtpFunc(){
        var i = 0
        for tf in textFieldOtp{
            if !tf.isFirstResponder
            {
                tf.isUserInteractionEnabled = false
            }
            textFieldConfig(tf)
            tf.delegate = self
            layersToRemoveLater[i].removeFromSuperlayer()
            gradientForItem(view0:  tf, colorSet: colors1, cornerRadiusValue: 10, startPt: nil, endPt: nil, loc: nil, lineWidth: 2,tg: i)
            i += 1
            tf.text! = ""
            tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        }
    }
    
    func textFieldConfig(_ tf : UITextField){
        tf.borderStyle = .none
        tf.textColor = .white
        let f = UIFont.systemFont(ofSize: 18, weight: .bold)
        let fnt = UIFont(name: "Ebrima", size: 18)
        tf.font = fnt
        tf.font = f
        tf.textAlignment = .center
        tf.keyboardType = .numberPad
            
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
         if (textField.text!.count < 1 && string.count > 0) {
            layersToRemoveLater[textField.tag].removeFromSuperlayer()
            gradientForItem(view0:  textFieldOtp[textField.tag], colorSet: colors, cornerRadiusValue: 10, startPt: nil, endPt: nil, loc: nil, lineWidth: 4,tg : textField.tag)
            switch textField.tag {
            case 5:
                textFieldOtp[5].isUserInteractionEnabled = true
                textFieldOtp[5].resignFirstResponder()
            default:
                textFieldOtp[textField.tag].isUserInteractionEnabled = false
                textFieldOtp[textField.tag + 1].isUserInteractionEnabled = true
                textFieldOtp[textField.tag + 1].becomeFirstResponder()
              
            }
            textField.text = string
            
            return false
        }
        else if (textField.text!.count >= 1 && string.count == 0 )
        {
            layersToRemoveLater[textField.tag].removeFromSuperlayer()
            gradientForItem(view0:  textFieldOtp[textField.tag], colorSet: colors1, cornerRadiusValue: 10, startPt: nil, endPt: nil, loc: nil, lineWidth: 2,tg : textField.tag )
            switch textField.tag {
            case 0:
                textFieldOtp[0].isUserInteractionEnabled = true
                textFieldOtp[0].resignFirstResponder()
      
            default:
                textFieldOtp[textField.tag].isUserInteractionEnabled = false
                textFieldOtp[textField.tag-1].isUserInteractionEnabled = true
                textFieldOtp[textField.tag-1].becomeFirstResponder()
            }
            textField.text = ""
            return false
        }
        else if (textField.text!.count >= 1)
        {
            
            return false
        }
        return true
    }
    
    func labelEnterFunc(){
            let text = "Please Enter the code we just sent to   (+1 (996) 444 1001 to proceed"
            let attText = NSMutableAttributedString(string : text )
            let range = (text as NSString).range(of: "Please Enter the code we just sent to")
            let range2 = (text as NSString).range(of: "to proceed")
        attText.addAttribute(.foregroundColor,value : UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6),range: range)
        attText.addAttribute(.foregroundColor,value : UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6),range: range2)
            labelEnter.attributedText = attText
        }
   
    
    
    func blurView()
    {
        leftImage.layer.cornerRadius = leftImage.frame.size.height/2
        rightImage.layer.cornerRadius = rightImage.frame.size.height/2
        let blur =  UIBlurEffect(style: .systemChromeMaterialDark)
        let eff = UIVisualEffectView(effect: blur)
        eff.frame = viewBackground.bounds
        eff.alpha = 1
        viewBackground.insertSubview(eff, at : 2)
    }
    
    func btnContinueFunc(){
        gradientForItem(view0: btnContinue, colorSet: colors, cornerRadiusValue: 15, startPt: nil, endPt: nil, loc: nil, lineWidth: nil,tg: nil)
    }
    
}

extension FifthOtpViewController {
    func gradientForItem(view0 : UIView? , colorSet : [UIColor] , cornerRadiusValue : CGFloat,startPt : CGPoint?,endPt : CGPoint?, loc : [NSNumber]?,lineWidth: CGFloat?,tg : Int?)
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
            let rect = view0!.bounds.insetBy(dx: 0 , dy: 0)
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
        if tg != nil
        {
            layersToRemoveLater[tg!] = gradient
        }
    }
   
    
}
