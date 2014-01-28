//
//  DemoViewController.h
//  SectionViewController
//
//  Created by Ray Hwang on 1/28/14.
//  Copyright (c) 2014 Original Function. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoViewController : UIViewController

@property (nonatomic, strong) UIColor *color;

- (id)initWithColor:(UIColor *)color sectionKey:(NSString *)key;

@end
