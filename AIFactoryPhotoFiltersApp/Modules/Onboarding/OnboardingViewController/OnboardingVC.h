//
//  OnboardingVC.h
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@class OnboardingViewModel;

@interface OnboardingVC : UIViewController

+ (instancetype)instantiate;

@property (nonatomic, strong, nullable) OnboardingViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
