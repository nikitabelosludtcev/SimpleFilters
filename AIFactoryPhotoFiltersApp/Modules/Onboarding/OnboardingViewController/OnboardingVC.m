//
//  OnboardingVC.m
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import "OnboardingVC.h"
#import "OnboardingViewModel.h"

@interface OnboardingVC ()

@property (weak, nonatomic) IBOutlet UIStackView *buttonsStackView;
@property (weak, nonatomic) IBOutlet UIButton *cameraButton;
@property (weak, nonatomic) IBOutlet UIButton *galleryButton;

@end

@implementation OnboardingVC

+ (instancetype)instantiate {
    return [[UIStoryboard storyboardWithName:@"Onboarding" bundle:nil] instantiateViewControllerWithIdentifier:@"OnboardingVC"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didTapCameraButton:(UIButton *)sender {
    self.viewModel.onSelectTakePhoto();
}

- (IBAction)didTapGalleryButton:(UIButton *)sender {
    self.viewModel.onSelectChoosePhotFromGallery();
}

@end
