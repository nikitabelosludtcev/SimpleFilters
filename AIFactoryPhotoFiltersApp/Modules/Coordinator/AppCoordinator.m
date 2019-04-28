//
//  AppCoordinator.m
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import "AppCoordinator.h"

#import "OnboardingVC.h"
#import "OnboardingViewModel.h"

#import "PhotoCaptureViewModel.h"
#import "PhotoCaptureVC.h"

#import "PhotoEditorViewModel.h"
#import "PhotoEditorVC.h"
#import "PhotoFilterService.h"

@interface AppCoordinator ()

@property (strong, nonatomic, nonnull) UIWindow *keyWindow;
@property (strong, nonatomic, nonnull) UINavigationController *nvc;

@end

@implementation AppCoordinator

- (instancetype)initWithKeyWindow:(UIWindow *)window {
    self = [super init];
    if (self) {
        self.keyWindow = window;
        self.nvc = [[UINavigationController alloc] init];
    }
    return self;
}

- (void)strat {
    [self showOnboarding];
}

- (void)showOnboarding {
    let viewModel = [[OnboardingViewModel alloc] init];
    __weak AppCoordinator *weakSelf = self;
    viewModel.onSelectTakePhoto = ^{
        [weakSelf showPhotoPickerWithType:UIImagePickerControllerSourceTypeCamera];
    };
    viewModel.onSelectChoosePhotFromGallery = ^{
        [weakSelf showPhotoPickerWithType:UIImagePickerControllerSourceTypePhotoLibrary];
    };
    let vc = [OnboardingVC instantiate];
    vc.viewModel = viewModel;
    [self.nvc setViewControllers:@[vc]];
    self.keyWindow.rootViewController = self.nvc;
}

- (void)showPhotoPickerWithType:(UIImagePickerControllerSourceType)sourceType {
    let viewModel = [[PhotoCaptureViewModel alloc] init];
    __weak AppCoordinator *weakSelf = self;
    viewModel.onPhotoDidTaken = ^(UIImage *takenPhoto){
        [weakSelf showPhotoEditorWithPhoto:takenPhoto];
        [weakSelf.nvc dismissViewControllerAnimated:YES completion:nil];
    };
    let vc = [[PhotoCaptureVC alloc] init];
    vc.viewModel = viewModel;
    vc.delegate = vc;
    vc.sourceType = sourceType;
    [self.nvc presentViewController:vc animated:YES completion:nil];
}

- (void)showPhotoEditorWithPhoto:(UIImage*)takenPhoto {
    let filterService = [[PhotoFilterServiceImpl alloc] init];
    let viewModel = [[PhotoEditorViewModel alloc] initWithPhoto:takenPhoto filterService:filterService];
    let vc = [PhotoEditorVC instantiate];
    vc.viewModel = viewModel;
    [self.nvc pushViewController:vc animated:FALSE];
}

@end
