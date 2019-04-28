//
//  PhotoFilterService.m
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import "PhotoFilterService.h"

@implementation PhotoFilterServiceImpl

- (NSArray<NSNumber*>*)avaliableFilters {
    return @[[NSNumber numberWithInt:kOriginal],
             [NSNumber numberWithInt:kInstant],
             [NSNumber numberWithInt:kComic],
             [NSNumber numberWithInt:kLineOverlay],
             [NSNumber numberWithInt:kSepia],
             [NSNumber numberWithInt:kNoir],
             [NSNumber numberWithInt:kColorMonochromeBlue],
             [NSNumber numberWithInt:kColorMonochromeRed],
             [NSNumber numberWithInt:kColorMonochromeGreen]];
}

- (NSString*)filterNameForType:(PhotoFilterType)filterType {
    switch (filterType) {
        case kOriginal:
            return @"Original";
        case kInstant:
            return @"Instant";
        case kComic:
            return @"Comic";
        case kLineOverlay:
            return @"Draw";
        case kSepia:
            return @"Sepia";
        case kNoir:
            return @"Noir";
        case kColorMonochromeBlue:
            return @"Blue";
        case kColorMonochromeRed:
            return @"Red";
        case kColorMonochromeGreen:
            return @"Green";
    }
}

- (void)applyFilter:(PhotoFilterType)filterType toImage:(UIImage*)originalImage withCompletionBlock:(void (^)(UIImage* __nullable image))completionBlock {
    switch (filterType) {
        case kOriginal: {
            completionBlock(originalImage);
            break;
        }
        case kInstant:
            [self applyInstantFilterToImage:originalImage withCompletionBlock:completionBlock];
            break;
        case kComic:
            [self applyComicFilterToImage:originalImage withCompletionBlock:completionBlock];
            break;
        case kLineOverlay:
            [self applyLineOverlayFilterToImage:originalImage withCompletionBlock:completionBlock];
            break;
        case kSepia:
            [self applySepiaFilterToImage:originalImage withCompletionBlock:completionBlock];
            break;
        case kNoir:
            [self applyNoirFilterToImage:originalImage withCompletionBlock:completionBlock];
            break;
        case kColorMonochromeBlue:
            [self applyColorMonochromeFilterToImage:originalImage withColor:[CIColor blueColor] withCompletionBlock:completionBlock];
            break;
        case kColorMonochromeRed:
            [self applyColorMonochromeFilterToImage:originalImage withColor:[CIColor redColor] withCompletionBlock:completionBlock];
            break;
        case kColorMonochromeGreen:
            [self applyColorMonochromeFilterToImage:originalImage withColor:[CIColor greenColor] withCompletionBlock:completionBlock];
            break;
    }
}

- (void)applyInstantFilterToImage:(UIImage*)originalImage withCompletionBlock:(void (^)(UIImage* __nullable image))completionBlock {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        let filter = [CIFilter filterWithName: @"CIPhotoEffectInstant"];
        [filter setValue:[[CIImage alloc] initWithImage:originalImage] forKey:kCIInputImageKey];
        let outputImage = [[UIImage alloc] initWithCIImage:filter.outputImage];;
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(outputImage);
        });
    });
}

- (void)applySepiaFilterToImage:(UIImage*)originalImage withCompletionBlock:(void (^)(UIImage* __nullable image))completionBlock {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        let sepiaFilter = [CIFilter filterWithName: @"CISepiaTone"];
        [sepiaFilter setValue:[[CIImage alloc] initWithImage:originalImage] forKey:kCIInputImageKey];
        [sepiaFilter setValue:[NSNumber numberWithDouble:0.9] forKey:kCIInputIntensityKey];
        let outputImage = [[UIImage alloc] initWithCIImage:sepiaFilter.outputImage];;
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(outputImage);
        });
    });
}

- (void)applyNoirFilterToImage:(UIImage*)originalImage withCompletionBlock:(void (^)(UIImage* __nullable image))completionBlock {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        let tonalFilter = [CIFilter filterWithName: @"CIPhotoEffectNoir"];
        [tonalFilter setValue:[[CIImage alloc] initWithImage:originalImage] forKey:kCIInputImageKey];
        let outputImage = [[UIImage alloc] initWithCIImage:tonalFilter.outputImage];;
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(outputImage);
        });
    });
}

- (void)applyColorMonochromeFilterToImage:(UIImage*)originalImage withColor:(CIColor*)color withCompletionBlock:(void (^)(UIImage* __nullable image))completionBlock {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        let tonalFilter = [CIFilter filterWithName: @"CIColorMonochrome"];
        [tonalFilter setValue:[[CIImage alloc] initWithImage:originalImage] forKey:kCIInputImageKey];
        [tonalFilter setValue:color forKey:kCIInputColorKey];
        [tonalFilter setValue:[NSNumber numberWithDouble:0.5] forKey:kCIInputIntensityKey];
        let outputImage = [[UIImage alloc] initWithCIImage:tonalFilter.outputImage];;
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(outputImage);
        });
    });
}

- (void)applyComicFilterToImage:(UIImage*)originalImage withCompletionBlock:(void (^)(UIImage* __nullable image))completionBlock {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        let filter = [CIFilter filterWithName: @"CIComicEffect"];
        [filter setValue:[[CIImage alloc] initWithImage:originalImage] forKey:kCIInputImageKey];
        let outputImage = [[UIImage alloc] initWithCIImage:filter.outputImage];;
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(outputImage);
        });
    });
}

- (void)applyLineOverlayFilterToImage:(UIImage*)originalImage withCompletionBlock:(void (^)(UIImage* __nullable image))completionBlock {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        let filter = [CIFilter filterWithName: @"CILineOverlay"];
        [filter setValue:[[CIImage alloc] initWithImage:originalImage] forKey:kCIInputImageKey];
        let outputImage = [[UIImage alloc] initWithCIImage:filter.outputImage];;
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(outputImage);
        });
    });
}

@end
