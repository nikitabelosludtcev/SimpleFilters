//
//  PhotoEditorVC.m
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import "PhotoEditorVC.h"
#import "PhotoEditorViewModel.h"

@interface PhotoEditorVC ()

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@end

@implementation PhotoEditorVC

// MARK: - Lyfecycle

+ (instancetype)instantiate {
    return [[UIStoryboard storyboardWithName:@"PhotoEditor" bundle:nil] instantiateViewControllerWithIdentifier:@"PhotoEditorVC"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.photoImageView.image = self.viewModel.takenPhoto;
}

// MARK: - Actions

- (IBAction)didTapShare:(UIBarButtonItem *)sender {
    
}

@end
