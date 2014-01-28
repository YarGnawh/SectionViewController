//
//  SectionViewController.h
//  SectionViewController
//
//  Created by Ray Hwang on 1/28/14.
//  Copyright (c) 2014 Original Function. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SectionViewControllerDelegate;

@interface SectionViewController : UIViewController

@property(nonatomic,copy) NSArray *viewControllers;

@property(nonatomic,assign) UIViewController *selectedViewController; // This may return the "More" navigation controller if it exists.

@property(nonatomic) NSUInteger selectedIndex;

@property(nonatomic, strong) NSString *selectedKey;

@property(nonatomic,assign) id<SectionViewControllerDelegate> delegate;

@end

@protocol SectionViewControllerDelegate <NSObject>

@optional

- (void)sectionViewController:(SectionViewController *)sectionViewController didSelectViewController:(UIViewController *)viewController;

@end

@interface UIViewController (Sections)

@property (nonatomic, strong) NSString *sectionKey;

@end