//
//  ImagePickerView.swift
//  LearningSwiftUI
//
//  Created by Deepak Kumar on 23/06/20.
//  Copyright © 2020 macadmin. All rights reserved.
//

import SwiftUI

final class ImagePickerCoordinator: NSObject {
        @Binding var image: UIImage?
        @Binding var takePhoto: Bool

        init(image: Binding<UIImage?>, takePhoto: Binding<Bool>) {
            _image = image
            _takePhoto = takePhoto
        }
    }

    struct ShowImagePicker: UIViewControllerRepresentable {
        @Binding var image: UIImage?
        @Binding var takePhoto: Bool

        func makeCoordinator() -> ImagePickerCoordinator {
            ImagePickerCoordinator(image: $image, takePhoto: $takePhoto)
        }

        func makeUIViewController(context: Context) -> UIImagePickerController {

            let pickerController = UIImagePickerController()
            pickerController.delegate = context.coordinator

            guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return pickerController }

            switch self.takePhoto {
            case true:
                pickerController.sourceType = .camera
            case false:
                pickerController.sourceType = .photoLibrary
            }

            pickerController.allowsEditing = true
            return pickerController
        }

        func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    }

    extension ImagePickerCoordinator: UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            guard let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }

            self.image = uiImage
            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }

}
