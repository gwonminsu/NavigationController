//
//  ViewController.swift
//  NavigationController
//
//  Created by 권민수 on 2023/05/11.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let scale:CGFloat = 1.5
    
    var isOn = true
    var isZoom = true
    var newWidth:CGFloat?, newHeight:CGFloat?

    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use button"
        } else/*if segue.identifier == "editBarButton"*/ {
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = isZoom
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        if isZoom {
            if self.isZoom == true {
                newWidth = imgView.frame.width
                newHeight = imgView.frame.height
            } else {
                newWidth = imgView.frame.width/scale
                newHeight = imgView.frame.height/scale
                self.isZoom = true
            }
        } else {
            if self.isZoom == false {
                newWidth = imgView.frame.width
                newHeight = imgView.frame.height
            } else {
                newWidth = imgView.frame.width*scale
                newHeight = imgView.frame.height*scale
                self.isZoom = false
            }
        }
        imgView.frame.size = CGSize(width: newWidth!, height: newHeight!)
    }
    
}
