//
//  FilterButton.m
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import "FilterButton.h"
#import "FilterButtonViewModel.h"

@interface FilterButton()

@property (strong, nonatomic) FilterButtonViewModel *viewModel;

@end

@implementation FilterButton

- (instancetype)initWithViewModel:(FilterButtonViewModel*)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
        
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.widthAnchor constraintEqualToConstant:120.0].active = YES;
        [self.heightAnchor constraintEqualToConstant:120.0].active = YES;
        
        self.layer.cornerRadius = 10.0;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [UIColor darkGrayColor].CGColor;
        
        self.contentMode = UIViewContentModeScaleAspectFill;
        
        [self setTitle:viewModel.filterName forState:UIControlStateNormal];
        
        self.titleLabel.shadowOffset = CGSizeMake(2, 2);
        self.titleLabel.font = [UIFont systemFontOfSize:20.0];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self setBgImage:viewModel.previewImage];
        __weak FilterButton *weakSelf = self;
        viewModel.didUpdatePreview = ^(UIImage * _Nonnull filterPreviewImage) {
            __strong FilterButton *strongSelf = weakSelf;
            [strongSelf setBgImage:filterPreviewImage];
        };
        [self addTarget:self action:@selector(didTap) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)didTap {
    self.viewModel.didChooseFilter();
}

- (void)setBgImage:(UIImage*)image {
    [self setBackgroundImage:image forState:UIControlStateNormal];
    [self layoutIfNeeded];
    [self.subviews firstObject].contentMode = UIViewContentModeScaleAspectFill;
}

@end
