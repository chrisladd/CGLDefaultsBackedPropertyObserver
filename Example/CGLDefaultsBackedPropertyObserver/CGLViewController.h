//
//  CGLViewController.h
//  CGLDefaultsBackedPropertyObserver
//
//  Created by Chris Ladd on 04/25/2015.
//  Copyright (c) 2014 Chris Ladd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGLViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *bizSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *bangSwitch;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end
