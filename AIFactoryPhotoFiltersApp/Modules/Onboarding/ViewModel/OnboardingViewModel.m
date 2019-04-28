//
//  OnboardingViewModel.m
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import "OnboardingViewModel.h"
#import <AVFoundation/AVFoundation.h>

@implementation OnboardingViewModel

- (void)didTapTakePhoto {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted){
        if (granted) {
            if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
                self.onSelectTakePhoto();
            } else {
                self.onShowMessage(@"Your device doesn't have camera");
            }
        } else{
            self.onShowMessage(@"Please enable access to the camera in Settings");
        }
    }];
}

- (void)didTapChoosePhoto {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted){
        if (granted) {
            if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary]) {
                self.onSelectChoosePhotoFromGallery();
            } else {
                self.onShowMessage(@"Your device doesn't have Gallery");
            }
        } else{
            self.onShowMessage(@"Please enable access to the gallery in Settings");
        }
    }];
}

@end
