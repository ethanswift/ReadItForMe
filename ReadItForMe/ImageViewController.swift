//
//  ImageViewController.swift
//  ReadItForMe
//
//  Created by ehsan sat on 4/30/20.
//  Copyright © 2020 ehsan sat. All rights reserved.
//

import UIKit
import Vision

@available(iOS 13.0, *)
class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    
    var image: CIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false

        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        let resultImageCI = CIImage(image: image)
        if resultImageCI != nil {
            self.analyzeImage(image: resultImageCI!)
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @available(iOS 13.0, *)
    func analyzeImage (image: CIImage) -> String {
        var finalStr: String = ""
        let imageHandler = VNImageRequestHandler(ciImage: image, orientation: .right, options: [:])
            let imageRequest = VNRecognizeTextRequest { (request, error) in
                if let resutls = request.results as? [VNRecognizedTextObservation] {
                    for result in resutls {
                        
                    }
                }
            }
        do {
            try  imageHandler.perform([imageRequest])
        } catch {
            print(error.localizedDescription)
        }
        return finalStr
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
