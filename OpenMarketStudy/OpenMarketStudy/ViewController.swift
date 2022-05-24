//
//  ViewController.swift
//  OpenMarketStudy
//
//  Created by 이시원 on 2022/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboardHide(_ sender: Notification) {
        myTextView.contentInset.bottom = 0
    }
    
    @objc func keyboardShow(_ sender: Notification) {
        if let userInfo = sender.userInfo as NSDictionary?,
           let keyboardframe = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue {
            let keyboardHeight = keyboardframe.cgRectValue.height
            
            myTextView.contentInset.bottom = keyboardHeight
        }
    }
    
    
}

