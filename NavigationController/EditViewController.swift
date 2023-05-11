//
//  EditViewController.swift
//  NavigationController
//
//  Created by 권민수 on 2023/05/11.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {

    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate : EditDelegate?
    var isOn = false
    var isZoom = false
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    @IBOutlet var chaneBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swIsOn.isOn = isOn
        if isZoom {
            chaneBtn.setTitle("현재 전구 상태: 축소", for: .normal)
        } else {
            chaneBtn.setTitle("현재 전구 상태: 확대", for: .normal)
        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageZoomDone(self, isZoom: isZoom)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func btnChangeSize(_ sender: UIButton) {
        if isZoom {
            sender.setTitle("현재 전구 상태: 확대", for: .normal)
            isZoom = false
        } else {
            sender.setTitle("현재 전구 상태: 축소", for: .normal)
            isZoom = true
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
