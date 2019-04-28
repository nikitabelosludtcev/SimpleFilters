//
//  PhotoEditorViewModel.h
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoEditorViewModel : NSObject

@property (nonatomic, strong) UIImage* takenPhoto;

- (instancetype)initWithPhoto:(UIImage*)takenPhoto;

@end

NS_ASSUME_NONNULL_END
