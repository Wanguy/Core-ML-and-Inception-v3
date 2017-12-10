//
//  ViewController.swift
//  MLTest
//
//  Created by Alex Wulff on 6/6/17.
//  Copyright © 2017 Conifer Apps. All rights reserved.
//

import UIKit
import Vision

class ViewController: UIViewController {
    
    // TODO:- label display
    
    // MARK:- IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ChoosePhoto: UIButton!
    @IBOutlet weak var InformationLabel: UILabel!
    
    // MARK:- Properties
    var image: UIImage?
    let vowels: [Character] = ["a", "e", "i", "o", "u"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        guard let image = UIImage(named: "sun") else {
//            fatalError("no starting image")
//        }
//
//        imageView.image = image
//        guard let ciImage = CIImage(image: image) else {
//            fatalError("couldn't convert UIImage to CIImage")
//        }
        
//        detectScene(image: ciImage)
    }
}

// MARK:- IBActions
extension ViewController {
    @IBAction func ChoosePhotoButton() {
        pickPhoto()
    }
}

// MARK:- Methods
extension ViewController {
    
    func detectScene(image: CIImage) {
        //        加载模型
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Couldn't initialize Model")
        }
        
        //        创建一个带有 completion handler 的 Vision 请求
        let request = VNCoreMLRequest(model: model) { [weak self] request, error in
            guard let results = request.results as? [VNClassificationObservation],
                let topResult = results.first else {
                    fatalError("unexpected result type from VNCoreMLRequest")
            }
            
            //            在主线程上更新 UI
            let article = (self?.vowels.contains(topResult.identifier.first!))! ? "an" : "a"
            DispatchQueue.main.async { [weak self] in
                self?.InformationLabel.text = "\(Int(topResult.confidence * 100))% it's \(article) \(topResult.identifier.components(separatedBy: ",")[0])"
                print("\(Int(topResult.confidence * 100))% it's \(article) \(topResult.identifier)")
            }
            
        }
        
        //        在主线程上运行 Core ML GoogLeNetPlaces 分类器
        let handler = VNImageRequestHandler(ciImage: image)
        DispatchQueue.global(qos: .userInteractive).async {
            do {
                try handler.perform([request])
            } catch {
                print(error)
            }
        }
        
    }
}

// MARK:- ImagePickerControllerDelegate
extension ViewController: UIImagePickerControllerDelegate {
    
    // MARK:- Image Picker Delegates
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        image = info[UIImagePickerControllerEditedImage] as? UIImage
        if let theImage = image {
            show(image: theImage)
        }
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("couldn't load image from Photos")
        }
        
        imageView.image = image
        guard let ciImage = CIImage(image: image) else {
            fatalError("couldn't convert UIImage to CIImage")
        }
        
        detectScene(image: ciImage)
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func takePhotoWithCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    func choosePhotoFromLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    func pickPhoto() {
        
        /**
            Simulator does not have camera, So use `if true || UIImagePickerController.isSourceTypeAvailable(.camera) {`
            instead `if UIImagePickerController.isSourceTypeAvailable(.camera) {`.
        */
        if true || UIImagePickerController.isSourceTypeAvailable(.camera) {
            showPhotoMenu()
        } else {
            choosePhotoFromLibrary()
        }
    }
    
    func showPhotoMenu() {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        let actCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actCancel)
        
        let actPhoto = UIAlertAction(title: "Take Photo",
                                     style: .default,
                                     handler: {
                                        _ in self.takePhotoWithCamera()
        })
        alert.addAction(actPhoto)
        
        let actLibrary = UIAlertAction(title: "Choose From Library",
                                       style: .default,
                                       handler: {
                                        _ in self.choosePhotoFromLibrary()
        })
        alert.addAction(actLibrary)
        
        present(alert, animated: true, completion: nil)
    }
    
    func show(image: UIImage) {
        imageView.image = image
        imageView.isHidden = false
        imageView.frame = CGRect(x: 60, y: 155, width: 257, height: 170)
    }
}

// MARK:- UINavigationControllerDelegate
extension ViewController: UINavigationControllerDelegate {
    
}

