//
//  ViewController.swift
//  OpenMarketStudy
//
//  Created by 이시원 on 2022/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var costField: UITextField!
    @IBOutlet var stockField: UITextField!
    
    @IBOutlet var myTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        costField.delegate = self
        stockField.delegate = self
        
        
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

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let charcterSet = CharacterSet.decimalDigits.inverted
        let strComponents = string.components(separatedBy: charcterSet)
        let numberFilter = strComponents.joined(separator: "")

        let currentString = textField.text! as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        print("string: ", string)
        print("filter: ", numberFilter)
        
        return string == numberFilter
    }
}

