//
//  ImageViewController.swift
//  ReadItForMe
//
//  Created by ehsan sat on 4/30/20.
//  Copyright © 2020 ehsan sat. All rights reserved.
//

import UIKit
import Vision

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var cameraButton: UIButton!
    
    var image: CIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false

        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage // ciImage?
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func analyzeImage (image: CGImage) -> String {
        var finalStr: String = ""
        let imageHandler = VNImageRequestHandler(cgImage: image, options: [:])
        let imageRequest = VNDetectTextRectanglesRequest { (request, error) in
            let results = request.results as! [VNTextObservation]
            
        }
        do {
            try  imageHandler.perform([imageRequest])
        } catch {
            print(error.localizedDescription)
        }
        
        return finalStr
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
        imagePicker.takePicture()
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
