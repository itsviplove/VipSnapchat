//
//  TakePhotoViewController.swift
//  VipSnapchat
//
//  Created by Apple on 3/5/17.
//  Copyright © 2017 itsviplove. All rights reserved.
//

import UIKit
import Firebase


class TakePhotoViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate , UITextFieldDelegate  {
    
    var imagePicker = UIImagePickerController()
    var imageURL2 = ""
    

    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    var imageUIUD = NSUUID().uuidString
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        nextButton.isEnabled = false
        nextButton.setTitle("Next", for: .normal)
        descriptionTextField.delegate = self
    }
    
    /**
     * Called when 'return' key pressed. return NO to ignore.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    /**
     * Called when the user click on the view (outside the UITextField).
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        nextButton.isEnabled = true
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        nextButton.isEnabled = false
        nextButton.setTitle("Uploading..", for: .normal)
        let imagesFolder = FIRStorage.storage().reference().child("images")
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)
        
        
        
        imagesFolder.child("\(imageUIUD).jpeg").put(imageData!, metadata: nil) { (metadata, error) in
            
            self.imageURL2 = (metadata?.downloadURL()?.absoluteString)!
            print("we tring to upload")
            if error != nil {
                print("we have an error while uploading")
            } else {
                
                self.performSegue(withIdentifier: "photoToSendSegue", sender: nil)
                self.viewDidLoad()
            }
        }
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! PhotoToSendViewController
        nextVC.descrip = descriptionTextField.text!
        nextVC.imageURl = imageURL2
        nextVC.imageUiud = imageUIUD
    }
    
}
