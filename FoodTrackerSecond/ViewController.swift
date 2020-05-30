//
//  ViewController.swift
//  FoodTrackerSecond
//
//  Created by admin on 3/15/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }
    
    // MARK: UItextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hire the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = nameTextField.text
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hire the keyboard
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a viewController that lets user picker from the photo library
//        let imagePickerController = UIImagePickerController()
//
//        // only allow image to be picker, not taken
//        imagePickerController.sourceType = .photoLibrary
//
//        // Make sure viewController is notifile when user picker image
//        imagePickerController.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
//
//        present(imagePickerController, animated: true, completion: nil)
        
        // UIImagePickerController is a viewControllerr that lets user picker from the photo libary
        let imagePickerController = UIImagePickerController()
        
        // only allow image to be picker, not taken
        imagePickerController.sourceType = .photoLibrary
        
        // Make sủe viewController í notìile ưhen ủe picker image
        imagePickerController.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate 
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("cái này đã không có giá trị, cái thằng này có khả năng nil")
        }
        
        // Set photoImageView to display to selected image
        photoImageView.image = selectedImage
        // dismiss picker
        dismiss(animated: true, completion: nil)
    }


}

