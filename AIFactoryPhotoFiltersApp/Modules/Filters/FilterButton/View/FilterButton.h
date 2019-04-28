//
//  FilterButton.h
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FilterButtonViewModel;

@interface FilterButton : UIButton

- (instancetype)initWithViewModel:(FilterButtonViewModel*)viewModel;

@end

NS_ASSUME_NONNULL_END
