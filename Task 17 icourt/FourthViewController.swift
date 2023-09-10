//
//  FourthViewController.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 19/04/23.
//

import UIKit

class FourthViewController: UIViewController,UICollectionViewDelegate{
    
    
    @IBOutlet weak var labelTextOTP: UILabel!
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    var call = 0
    
    @IBOutlet weak var imageCollectionView:
        UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTextOTPFunc()
        numberTextField.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if call == 1
        {
            numberTextFieldFunc()
            btnLoginFunc()
        }
        call += 1
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}
extension FourthViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UITextFieldDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionViewCell1", for: indexPath) as! imageCollectionViewCell1
        return cell
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        let vc =  self.storyboard?.instantiateViewController(identifier: "FifthOtpViewController") as! FifthOtpViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: imageCollectionView.frame.size.width, height: imageCollectionView.frame.size.height)
    }
  
    func numberTextFieldFunc(){
        
//        Gradient
        let lineWidth: CGFloat = 2.0
        numberTextField.backgroundColor = .clear
           let rect = numberTextField.bounds.insetBy(dx: lineWidth , dy: lineWidth )
           let path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
           let gradient = CAGradientLayer()
           gradient.frame =  CGRect(origin: CGPoint.zero, size: numberTextField.frame.size)
            var colorChange = [Any]()
            colorChange =   [ UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1).cgColor,
                              UIColor(red: 0.435, green: 0.533, blue: 0.988, alpha: 1).cgColor,
                              UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 1).cgColor
            ]
        gradient.colors = colorChange
           gradient.startPoint = CGPoint(x: 0, y: 1)
           gradient.endPoint = CGPoint(x: 1, y: 0)
//        border
           let shape = CAShapeLayer()
           shape.lineWidth = lineWidth
           shape.path = path.cgPath
           shape.strokeColor = UIColor.black.cgColor
           shape.fillColor = UIColor.clear.cgColor
        
        numberTextField.layer.addSublayer(gradient)
        gradient.mask = shape
//        padding
        let indentView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        numberTextField.leftView = indentView
        numberTextField.leftViewMode = .always
//        placeholder
        numberTextField.attributedPlaceholder = NSAttributedString(
            string: "Enter Phone Number",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)]
        )
        
        
//        image
        let image = UIImage(named: "Subtract")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 12, y: 10 , width: 14, height: 18)
        
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view1.addSubview(imageView)
        
        numberTextField.rightView = view1
        numberTextField.rightViewMode = .always
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 10
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
        if textField == numberTextField && newString.length <= maxLength  {
                        let allowedNum = "0123456789"
                        let allowedNumSet = CharacterSet(charactersIn: allowedNum)
                        let typedCharacterSet = CharacterSet(charactersIn: string)
                        let num = allowedNumSet.isSuperset(of: typedCharacterSet)
                        return num
              } else {
                return false
            }
    }
    func labelTextOTPFunc(){
        let text = "We will send you an One Time Password on this mobile number."
        let attText = NSMutableAttributedString(string : text )
        let range = (text as NSString).range(of: "One Time Password")
        attText.addAttribute(.foregroundColor,value : UIColor(red: 130/255, green: 101/255, blue: 227/255, alpha: 1),range: range)
        labelTextOTP.attributedText = attText
        
    }
    func btnLoginFunc(){
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(x: 0, y:  0, width: btnLogin.frame.size.width, height: btnLogin.frame.size.height)
        gradient.colors = [
            UIColor(red: 0.631, green: 0.388, blue: 0.969, alpha: 1).cgColor,
            UIColor(red: 0.53, green: 0.463, blue: 0.979, alpha: 1).cgColor,
            UIColor(red: 0.271, green: 0.89, blue: 1, alpha: 1).cgColor
        ]
        gradient.cornerRadius = 15
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        btnLogin.layer.insertSublayer(gradient, at: 0)
        btnLogin.layer.cornerRadius = 15
    }
    


}
