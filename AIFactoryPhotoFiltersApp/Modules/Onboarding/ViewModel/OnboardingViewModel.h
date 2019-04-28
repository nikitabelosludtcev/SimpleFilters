//
//  OnboardingViewModel.h
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OnboardingViewModel : NSObject

@property (nonatomic, copy, nullable) void (^onSelectTakePhoto)(void);
@property (nonatomic, copy, nullable) void (^onSelectChoosePhotFromGallery)(void);

@end
