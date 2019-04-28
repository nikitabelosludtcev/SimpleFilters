//
//  PhotoEditorViewModel.m
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import "PhotoEditorViewModel.h"

@implementation PhotoEditorViewModel

- (instancetype)initWithPhoto:(UIImage*)takenPhoto {
    self = [super init];
    if (self) {
        self.takenPhoto = takenPhoto;
    }
    return self;
}

@end
