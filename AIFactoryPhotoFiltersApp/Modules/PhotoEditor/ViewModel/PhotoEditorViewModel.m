//
//  PhotoEditorViewModel.m
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import "PhotoEditorViewModel.h"
#import "FilterButtonViewModel.h"
#import "UIImage+Extensions.h"

@interface PhotoEditorViewModel()

@property (nonatomic, strong) id<PhotoFilterService> service;

@end

@implementation PhotoEditorViewModel

- (instancetype)initWithPhoto:(UIImage*)takenPhoto filterService:(id<PhotoFilterService>) service {
    self = [super init];
    if (self) {
        self.currentPhoto = takenPhoto;
        self.service = service;
        
        let previewImage = [self previewFromOriginalImage:takenPhoto];
        
        var filters = [NSMutableArray array];
        [self.service.avaliableFilters enumerateObjectsUsingBlock:^(NSNumber * _Nonnull filterTypeValue, NSUInteger idx, BOOL * _Nonnull stop) {
            let filterViewModel = [[FilterButtonViewModel alloc] init];
            PhotoFilterType filterType = [filterTypeValue integerValue];
            filterViewModel.filterName = [service filterNameForType:filterType];
            [service applyFilter:filterType toImage:previewImage withCompletionBlock:^(UIImage * _Nullable previewImage) {
                if (previewImage) {
                    filterViewModel.previewImage = previewImage;
                    if (filterViewModel.didUpdatePreview) {
                        filterViewModel.didUpdatePreview(previewImage);
                    }
                }
            }];
            [filters addObject:filterViewModel];
            
            __weak PhotoEditorViewModel* weakSelf = self;
            filterViewModel.didChooseFilter = ^{
                [weakSelf.service applyFilter:filterType toImage:takenPhoto withCompletionBlock:^(UIImage * _Nullable editedImage) {
                    if (editedImage) {
                        weakSelf.didUpdatePhoto(editedImage);
                    }
                }];
            };
        }];
        self.filters = filters;
    }
    return self;
}

- (UIImage*)previewFromOriginalImage:(UIImage*)image {
    let previewSize = 120.0;
    let width = image.size.width;
    let height = image.size.height;
    if (height > width) {
        return [image scaleToSize:CGSizeMake(previewSize, previewSize * height / width)];
    } else {
        return [image scaleToSize:CGSizeMake(previewSize * width / height, previewSize)];
    }
}

@end
