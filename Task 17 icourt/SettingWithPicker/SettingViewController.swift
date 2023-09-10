//
//  SettingViewController.swift
//  Task 17 icourt
//
//  Created by Naved Khan on 25/04/23.
//

import UIKit
import MapKit

class SettingViewController: UIViewController ,sendData{
    func setData(flag: Bool) {
        if flag {
            self.dismiss(animated: true, completion: nil)
            let vc = self.storyboard?.instantiateViewController(identifier: "SetupViewController") as!
                SetupViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapFuncConfig()
      
    }
//    28.60967921533521, 77.38700196741412
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentScreen()
    }
//    var nav = Bool(){
//        didSet{
//            if nav == false
//            {
//            let vc = self.storyboard?.instantiateViewController(identifier: "SetupViewController") as! SetupViewController
//            self.navigationController?.pushViewController(vc, animated: true)
//            }
//        }
//    }


}
extension SettingViewController{
   func mapFuncConfig()
   {
    let letitude : CLLocationDegrees = 28.60967921533521
    let longitude : CLLocationDegrees = 77.38700196741412
    let letDelta : CLLocationDegrees = 0.01
    let longDelta : CLLocationDegrees = 0.01
    
    let loc = CLLocationCoordinate2DMake(letitude, longitude)
    let span = MKCoordinateSpan(latitudeDelta: letDelta, longitudeDelta: longDelta)
    let region = MKCoordinateRegion(center: loc, span: span)
    self.mapView.setRegion(region, animated: true)
    let annotate = MKPointAnnotation()
    annotate.coordinate = loc
    annotate.title = "Agicent"
    self.mapView.addAnnotation(annotate)
 
    
   }
    
   func presentScreen()
   {
  
    let vc = self.storyboard?.instantiateViewController(identifier: "SettingPickerViewController") as!
        SettingPickerViewController
    vc.del = self
        self.present(vc, animated: true, completion: nil)
    
   }
}
