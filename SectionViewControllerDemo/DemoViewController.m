//
//  DemoViewController.m
//  SectionViewController
//
//  Created by Ray Hwang on 1/28/14.
//  Copyright (c) 2014 Original Function. All rights reserved.
//

#import "DemoViewController.h"

#import "SectionViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (id)initWithColor:(UIColor *)color sectionKey:(NSString *)key
{
    self = [super init];
    if (self) {
        self.color = color;
        self.sectionKey = key;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = self.color;
}

@end
