//
//  PhotoEditorVC.m
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import "PhotoEditorVC.h"
#import "PhotoEditorViewModel.h"
#import "FilterButtonViewModel.h"
#import "FilterButton.h"

@interface PhotoEditorVC ()

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *filtersButtonsScrollView;
@property (weak, nonatomic) IBOutlet UIStackView *filtersButtonsStackView;

@end

@implementation PhotoEditorVC

// MARK: - Lyfecycle

+ (instancetype)instantiate {
    return [[UIStoryboard storyboardWithName:@"PhotoEditor" bundle:nil] instantiateViewControllerWithIdentifier:@"PhotoEditorVC"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.photoImageView.image = self.viewModel.currentPhoto;
    
    __weak PhotoEditorVC *weakSelf = self;
    
    self.viewModel.didUpdatePhoto = ^(UIImage * _Nonnull newImage) {
        weakSelf.photoImageView.image = newImage;
    };
    
    for (UIView* view in self.filtersButtonsStackView.subviews) {
        [view removeFromSuperview];
    }
    for (FilterButtonViewModel *filterViewModel in self.viewModel.filters) {
        let button = [[FilterButton alloc] initWithViewModel:filterViewModel];
        [weakSelf.filtersButtonsStackView addArrangedSubview:button];
    }
}

// MARK: - Actions

- (IBAction)didTapShare:(UIBarButtonItem *)sender {
    NSString * message = @"Check out my cool photo!";
    UIImage *sharingImage = self.photoImageView.image;
    //Fix empty CGImage after CIImage filter
    if (sharingImage.CGImage == nil) {
        let ciImage = self.photoImageView.image.CIImage;
        let cgImage = [[CIContext context] createCGImage:ciImage fromRect:ciImage.extent];
        sharingImage = [UIImage imageWithCGImage:cgImage];
    }
    NSArray * shareItems = @[message, sharingImage];
    UIActivityViewController * shareVC = [[UIActivityViewController alloc] initWithActivityItems:shareItems applicationActivities:nil];
    [self presentViewController:shareVC animated:YES completion:nil];
}

@end
