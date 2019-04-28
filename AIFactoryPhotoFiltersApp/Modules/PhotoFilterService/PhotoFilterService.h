//
//  PhotoFilterService.h
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreImage;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, PhotoFilterType) {
    kSepiaFilter = 1,
    kTonalFilter = 2,
    kColorMonochromeBlueFilter = 3,
    kColorMonochromeRedFilter = 4,
    kColorMonochromeGreenFilter = 5
};

@protocol PhotoFilterService

- (NSArray<NSNumber*>*)avaliableFilters;
- (NSString*)filterNameForType:(PhotoFilterType)filterType;
- (void)applyFilter:(PhotoFilterType)filterType toImage:(UIImage*)originalImage withCompletionBlock:(void (^)(UIImage* __nullable image))completionBlock;

@end

@interface PhotoFilterServiceImpl : NSObject <PhotoFilterService>

@end

NS_ASSUME_NONNULL_END
