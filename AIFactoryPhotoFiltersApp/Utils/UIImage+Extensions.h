//
//  UIImage+Extensions.h
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extensions)

- (UIImage *)fixOrientation;
- (UIImage *)scaleToSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
