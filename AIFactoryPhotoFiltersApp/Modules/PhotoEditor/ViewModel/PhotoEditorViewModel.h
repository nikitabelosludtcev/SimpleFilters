//
//  PhotoEditorViewModel.h
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoFilterService.h"

NS_ASSUME_NONNULL_BEGIN

@class FilterButtonViewModel;

@interface PhotoEditorViewModel : NSObject

@property (nonatomic, strong) UIImage* currentPhoto;
@property (nonatomic, strong) NSArray<FilterButtonViewModel*> *filters;
@property (nonatomic, copy, nullable) void (^didUpdatePhoto)(UIImage *image);

- (instancetype)initWithPhoto:(UIImage*)takenPhoto filterService:(id<PhotoFilterService>) service;

@end

NS_ASSUME_NONNULL_END
