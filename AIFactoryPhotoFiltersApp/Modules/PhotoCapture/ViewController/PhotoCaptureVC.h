//
//  PhotoCaptureVC.h
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//


NS_ASSUME_NONNULL_BEGIN

@class PhotoCaptureViewModel;

@interface PhotoCaptureVC : UIImagePickerController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong, nullable) PhotoCaptureViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
