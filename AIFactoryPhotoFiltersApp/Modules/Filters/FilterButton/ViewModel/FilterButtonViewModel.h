//
//  FilterButtonViewModel.h
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FilterButtonViewModel : NSObject

@property (nonatomic, strong) NSString *filterName;
@property (nonatomic, strong) UIImage *previewImage;
@property (nonatomic, copy, nullable) void (^didChooseFilter)(void);
@property (nonatomic, copy, nullable) void (^didUpdatePreview)(UIImage *filterPreviewImage);

@end

NS_ASSUME_NONNULL_END
