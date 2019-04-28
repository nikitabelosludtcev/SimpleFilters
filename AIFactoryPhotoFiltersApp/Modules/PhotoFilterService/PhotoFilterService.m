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
    return @[[NSNumber numberWithInt:kSepiaFilter],
             [NSNumber numberWithInt:kTonalFilter],
             [NSNumber numberWithInt:kColorMonochromeBlueFilter],
             [NSNumber numberWithInt:kColorMonochromeRedFilter],
             [NSNumber numberWithInt:kColorMonochromeGreenFilter]];
}

- (NSString*)filterNameForType:(PhotoFilterType)filterType {
    switch (filterType) {
        case kSepiaFilter:
            return @"Sepia";
        case kTonalFilter:
            return @"Tonal";
        case kColorMonochromeBlueFilter:
            return @"Blue";
        case kColorMonochromeRedFilter:
            return @"Red";
        case kColorMonochromeGreenFilter:
            return @"Green";
    }
}

- (void)applyFilter:(PhotoFilterType)filterType toImage:(UIImage*)originalImage withCompletionBlock:(void (^)(UIImage* __nullable image))completionBlock {
    switch (filterType) {
        case kSepiaFilter:
            [self applySepiaFilterToImage:originalImage withCompletionBlock:completionBlock];
            break;
        case kTonalFilter:
            [self applyTonalFilterToImage:originalImage withCompletionBlock:completionBlock];
            break;
        case kColorMonochromeBlueFilter:
            [self applyColorMonochromeFilterToImage:originalImage withColor:[CIColor blueColor] withCompletionBlock:completionBlock];
            break;
        case kColorMonochromeRedFilter:
            [self applyColorMonochromeFilterToImage:originalImage withColor:[CIColor redColor] withCompletionBlock:completionBlock];
            break;
        case kColorMonochromeGreenFilter:
            [self applyColorMonochromeFilterToImage:originalImage withColor:[CIColor greenColor] withCompletionBlock:completionBlock];
            break;
    }
}

- (void)applySepiaFilterToImage:(UIImage*)originalImage withCompletionBlock:(void (^)(UIImage* __nullable image))completionBlock {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        let sepiaFilter = [CIFilter filterWithName: @"CISepiaTone"];
        [sepiaFilter setValue:[[CIImage alloc] initWithImage:originalImage] forKey:kCIInputImageKey];
        [sepiaFilter setValue:[NSNumber numberWithDouble:0.9] forKey:kCIInputIntensityKey];
        let outputImage = [[UIImage alloc] initWithCIImage:sepiaFilter.outputImage];;
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(outputImage);
        });
    });
}

- (void)applyTonalFilterToImage:(UIImage*)originalImage withCompletionBlock:(void (^)(UIImage* __nullable image))completionBlock {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        let tonalFilter = [CIFilter filterWithName: @"CIPhotoEffectTonal"];
        [tonalFilter setValue:[[CIImage alloc] initWithImage:originalImage] forKey:kCIInputImageKey];
        let outputImage = [[UIImage alloc] initWithCIImage:tonalFilter.outputImage];;
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(outputImage);
        });
    });
}

- (void)applyColorMonochromeFilterToImage:(UIImage*)originalImage withColor:(CIColor*)color withCompletionBlock:(void (^)(UIImage* __nullable image))completionBlock {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        let tonalFilter = [CIFilter filterWithName: @"CIColorMonochrome"];
        [tonalFilter setValue:[[CIImage alloc] initWithImage:originalImage] forKey:kCIInputImageKey];
        [tonalFilter setValue:color forKey:kCIInputColorKey];
        let outputImage = [[UIImage alloc] initWithCIImage:tonalFilter.outputImage];;
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(outputImage);
        });
    });
}


@end
