//
//  ViewController.swift
//  OpenMarketStudy
//
//  Created by 이시원 on 2022/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myImageView: UIImageView!
    
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
    }
    
    @IBAction func albumButtonTapped(_ sender: Any) {
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
    }
    
    @IBAction func cameButtonTapped(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("카메라를 쓸 수 없습니다")
            return
        }
        
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage]
            as? UIImage else {
            fatalError("Error")
        }
        
        myImageView.image = image
        dismiss(animated: true, completion: nil) // 반드시 dismiss 하기.
    }
}

