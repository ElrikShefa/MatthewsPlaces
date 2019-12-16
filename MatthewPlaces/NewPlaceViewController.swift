//
//  NewPlaceViewController.swift
//  MatthewPlaces
//
//  Created by Матвей Чернышев on 16.12.2019.
//  Copyright © 2019 Matvey Chernyshov. All rights reserved.
//

import UIKit

class NewPlaceViewController: UITableViewController {
    
    
    @IBOutlet var imageOfPlaces: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // убрали разлиновку
        tableView.tableFooterView = UIView()
    }
    
    //MARK: - Table View delegate
    // hiding the keyboard by tapping on cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let cameraIcon = #imageLiteral(resourceName: "camera")
            let phototIcon = #imageLiteral(resourceName: "photo")
            
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Camera",
                                       style: .default) { _ in
                                        self.chooseImagePicker(source: .camera)
            }
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let photo = UIAlertAction(title: "Photo",
                                      style: .default) { _ in
                                        self.chooseImagePicker(source: .photoLibrary)
                                        
            }
            photo.setValue(phototIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "Cancel",
                                       style: .cancel) { _ in
                                        
            }
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated:  true)
            
        } else {
            view.endEditing(true)
        }
    }
    
}


//MARK: - Text field delegate
extension NewPlaceViewController: UITextFieldDelegate {
    
    // hiding the keyboard by pressing Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - Work with image

extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    //добавление и ред image
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageOfPlaces.image = info[.editedImage] as? UIImage
        imageOfPlaces.contentMode = .scaleAspectFit
        imageOfPlaces.clipsToBounds = true
        dismiss(animated: true)
    }
}
