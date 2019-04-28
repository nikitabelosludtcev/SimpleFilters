//
//  OnboardingViewModel.h
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OnboardingViewModel : NSObject

@property (nonatomic, copy) void (^onSelectTakePhoto)(void);
@property (nonatomic, copy) void (^onSelectChoosePhotoFromGallery)(void);
@property (nonatomic, copy) void (^onShowMessage)(NSString * _Nullable message);

- (void)didTapTakePhoto;
- (void)didTapChoosePhoto;

@end

NS_ASSUME_NONNULL_END
