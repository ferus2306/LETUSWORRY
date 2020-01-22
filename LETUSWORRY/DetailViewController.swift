//
//  DetailViewController.swift
//  LETUSWORRY
//
//  Created by Firus Hanov on 10/11/19.
//  Copyright © 2019 Firus Hanov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var weightField: UITextField!
    @IBOutlet var bagsField: UITextField!
    
    @IBOutlet var pickUpDateField: UITextField!
    @IBOutlet var dropOffDateField: UITextField!
    @IBOutlet var imageViewUser: UIImageView!
    
    
    var item: Item!{
        didSet {
            navigationItem.title = item.name // displays the title of item in DetailCOntroller view. At the bar section
            
        }
    }
    
//
//    let dateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .none
//        return formatter
//    }()
    
    var imageStore: ImageStore!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        bagsField.text = item.bags
        weightField.text = item.weight
        pickUpDateField.text = item.pickUpDate
        dropOffDateField.text = item.dropOffDate
        
        
        
        
        
        // Get the item key
        let key = item.itemKey
        
        // If there is an associated image with the item
        // display it on the image view
        let imageToDisplay = imageStore.image(forKey: key)
        imageView.image = imageToDisplay
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)


        // Clear first responder
        view.endEditing(true)

        // "Save" changes to item
        item.name = nameField.text ?? ""
        item.bags = bagsField.text ?? ""
        item.weight = weightField.text ?? ""
        item.pickUpDate = pickUpDateField.text ?? ""
        item.dropOffDate = dropOffDateField.text ?? ""
    }
    
    // INSERT USER IMAGE
    @IBAction func insertUserPicture(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    // IMAGE FUNCTIONS
    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        
        let imagePicker = UIImagePickerController()
        
        // If the device has a camera, take a picture; otherwise,
        // jusr pick from photo library
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.delegate = self
        // Place image picker on the screen
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Get picked image from info dictionary
        let image = info[.originalImage] as! UIImage
        
        // Store the image in the ImageStore for the item's key
        imageStore.setImage(image, forKey: item.itemKey)
        
        // Put that image onto the screen in our image view
        imageView.image = image
        
        // Take image picker off the screen -
        // you must call this dismiss method
        dismiss(animated: true, completion: nil)
    }

    // dismiss the keyboard when pressed anywhere on the screen
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    // on return dismiss a keyboard. Don't forget to delegate the text fields.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
