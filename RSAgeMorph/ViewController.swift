//
//  ViewController.swift
//  RSAgeMorph
//
//  Created by RADHIKA SHARMA on 11/13/17.
//  Copyright © 2017 RADHIKA SHARMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITabBarDelegate   {
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var photoTab : UITabBarItem!
    @IBOutlet var cameraTab : UITabBarItem!
    
    var picker : UIImagePickerController = UIImagePickerController();
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        picker.delegate = self
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark delegate method
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        if let imgUrl = info["UIImagePickerControllerImageURL"] {
           print(imgUrl)
        } else {
            print("----------------------------------")
        }
        
        
        if let refUrl = info["UIImagePickerControllerRefrenceURL"] {
            print(refUrl)
        } else {
            print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
        }

        self.imageView.image = info["UIImagePickerControllerOriginalImage"] as? UIImage
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel() {
        dismiss(animated:true, completion: nil)
    }

    func tabBar(_ tabBar: UITabBar,
                didSelect item: UITabBarItem) {
        if item.tag == 0 {
            picker.allowsEditing = true
            picker.sourceType = .savedPhotosAlbum
            //picker.sourceType = .camera
            present(picker, animated: true, completion: nil)
        } else {
            if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)) {
                picker.sourceType = .camera
                present(picker, animated: true, completion: nil)
            }
            
        }
    }

}

