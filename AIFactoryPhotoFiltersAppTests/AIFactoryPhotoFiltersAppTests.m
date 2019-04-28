//
//  AIFactoryPhotoFiltersAppTests.m
//  AIFactoryPhotoFiltersAppTests
//
//  Created by NIkita on 28/04/2019.
//  Copyright © 2019 Nikita Belosludtcev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PhotoEditorViewModel.h"
#import "FilterButtonViewModel.h"
#import "PhotoFilterService.h"
#import "UIImage+Extensions.h"

@interface AIFactoryPhotoFiltersAppTests : XCTestCase

@property (strong, nonatomic) PhotoEditorViewModel *photoEditorViewModel;
@property (strong, nonatomic) UIImage *testImage;

@end

@implementation AIFactoryPhotoFiltersAppTests

- (void)setUp {
    self.photoEditorViewModel = nil;
    self.testImage = [UIImage imageNamed:@"AppLogo"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testPhotoEditorFiltersViewModels {
    let filterService = [[PhotoFilterServiceImpl alloc] init];
    self.photoEditorViewModel = [[PhotoEditorViewModel alloc] initWithPhoto:self.testImage filterService:filterService];
    XCTAssertEqual(filterService.avaliableFilters.count, self.photoEditorViewModel.filters.count);
    for (NSInteger i = 0; i < filterService.avaliableFilters.count; i++) {
        FilterButtonViewModel *filterViewModel = self.photoEditorViewModel.filters[i];
        NSString *filterName = [filterService filterNameForType: [filterService.avaliableFilters[i] integerValue]];
        XCTAssertEqual(filterViewModel.filterName, filterName);
    }
}

- (void)testPhotoEditorOriginalFilterApply {
    
    let filterService = [[PhotoFilterServiceImpl alloc] init];
    
    self.photoEditorViewModel = [[PhotoEditorViewModel alloc] initWithPhoto:self.testImage filterService:filterService];
    
    
    UIImage *originalImage = [self.photoEditorViewModel.currentPhoto copy];
    
    var originalFilterButtonViewModel = [self.photoEditorViewModel.filters firstObject];
    XCTAssertNotNil(originalFilterButtonViewModel);
    XCTAssertEqual(originalFilterButtonViewModel.filterName, @"Original");
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"wait"];
    originalFilterButtonViewModel.didChooseFilter();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [expectation fulfill];
    });
    [self waitForExpectations:@[expectation] timeout:2.0];
    XCTAssertEqual(self.photoEditorViewModel.currentPhoto, originalImage);
}

- (void)testPhotoEditorEditFilterApply {
    
    let filterService = [[PhotoFilterServiceImpl alloc] init];
    
    self.photoEditorViewModel = [[PhotoEditorViewModel alloc] initWithPhoto:self.testImage filterService:filterService];
    
    UIImage *originalImage = [self.photoEditorViewModel.currentPhoto copy];
    
    var lastFilterButtonViewModel = [self.photoEditorViewModel.filters lastObject];
    XCTAssertNotNil(lastFilterButtonViewModel);
    XCTAssertNotEqual(lastFilterButtonViewModel.filterName, @"Original");
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"wait"];
    lastFilterButtonViewModel.didChooseFilter();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [expectation fulfill];
    });
    [self waitForExpectations:@[expectation] timeout:2.0];
    XCTAssertNotEqual(self.photoEditorViewModel.currentPhoto, originalImage);
}

- (void)testPhotoEditorFilterResult {
    
    let filterService = [[PhotoFilterServiceMock alloc] init];
    
    self.photoEditorViewModel = [[PhotoEditorViewModel alloc] initWithPhoto:self.testImage filterService:filterService];
    
    var lastFilterButtonViewModel = [self.photoEditorViewModel.filters lastObject];
    XCTAssertNotNil(lastFilterButtonViewModel);
    XCTAssertNotEqual(lastFilterButtonViewModel.filterName, @"Original");
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"wait"];
    lastFilterButtonViewModel.didChooseFilter();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [expectation fulfill];
    });
    [self waitForExpectations:@[expectation] timeout:2.0];
    XCTAssertEqual(self.photoEditorViewModel.currentPhoto, self.testImage);
}

- (void)testImageScale {
    let checkSize = CGSizeMake(150, 150);
    XCTAssertNotEqual(self.testImage.size.width, checkSize.width);
    XCTAssertNotEqual(self.testImage.size.height, checkSize.height);
    let scaledImage = [self.testImage scaleToSize:checkSize];
    XCTAssertEqual(scaledImage.size.width, checkSize.width);
    XCTAssertEqual(scaledImage.size.height, checkSize.height);
}

@end
