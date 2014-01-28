//
//  SectionViewController.m
//  SectionViewController
//
//  Created by Ray Hwang on 1/28/14.
//  Copyright (c) 2014 Original Function. All rights reserved.
//

#import "SectionViewController.h"

#import <objc/runtime.h>

@interface SectionViewController ()

- (void)updateFrontViewController:(UIViewController *)viewController;

@end

@implementation SectionViewController

@synthesize viewControllers = _viewControllers;
@synthesize selectedViewController = _selectedViewController;
@synthesize selectedIndex = _selectedIndex;
@synthesize selectedKey = _selectedKey;
@synthesize delegate = _delegate;

- (instancetype)init {
    if ((self = [super init])) {
        
    }
    return self;
}

#pragma mark - Getter and Setter Methods

- (void)setViewControllers:(NSArray *)viewControllers {
    _viewControllers = [viewControllers copy];
    [self setSelectedIndex:_selectedIndex];
}

- (void)setSelectedViewController:(UIViewController *)selectedViewController {
    [_viewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isEqual:selectedViewController]) {
            [self updateFrontViewController:selectedViewController];
            _selectedViewController = selectedViewController;
        }
    }];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    if (selectedIndex < [_viewControllers count]) {
        [self setSelectedViewController:[_viewControllers objectAtIndex:selectedIndex]];
        _selectedIndex = selectedIndex;
    }
}

- (void)setSelectedKey:(NSString *)selectedKey {
    [_viewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = (UIViewController *)obj;
        if ([[vc sectionKey] isEqualToString:selectedKey]) {
            [self setSelectedIndex:idx];
            _selectedKey = selectedKey;
        }
    }];
}

#pragma mark - Private Instance Methods

- (void)updateFrontViewController:(UIViewController *)viewController {
    [self.selectedViewController viewWillDisappear:NO];
    [viewController viewWillAppear:NO];
    
    [self.view addSubview:viewController.view];
    [self addChildViewController:viewController];
    [viewController didMoveToParentViewController:self];
    
    if ([self.delegate conformsToProtocol:@protocol(SectionViewControllerDelegate)]) {
        [self.delegate sectionViewController:self didSelectViewController:viewController];
    }
    
    [self.selectedViewController viewDidDisappear:NO];
    [viewController viewDidAppear:NO];
}

@end

static char assocatedObjKey;

@implementation UIViewController (Sections)

@dynamic sectionKey;

- (void)setSectionKey:(NSString *)sectionKey {
    objc_setAssociatedObject(self, &assocatedObjKey, sectionKey, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)sectionKey {
    return objc_getAssociatedObject(self, &assocatedObjKey);
}

@end