//
//  PhotoEditorVC.h
//  AIFactoryPhotoFiltersApp
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@class PhotoEditorViewModel;

@interface PhotoEditorVC : UIViewController

@property (nonatomic, strong, nullable) PhotoEditorViewModel *viewModel;

+ (instancetype)instantiate;

@end

NS_ASSUME_NONNULL_END
