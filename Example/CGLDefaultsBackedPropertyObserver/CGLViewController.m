//
//  CGLViewController.m
//  CGLDefaultsBackedPropertyObserver
//
//  Created by Chris Ladd on 04/25/2015.
//  Copyright (c) 2014 Chris Ladd. All rights reserved.
//

#import "CGLViewController.h"
#import "CGLDefaultsBackedPropertyObserver.h"

@interface CGLViewController () <UITextFieldDelegate>
@property (nonatomic) NSString *foo;
@property (nonatomic) BOOL biz;
@property (nonatomic) BOOL bang;
@property (nonatomic) float bopLevel;
@end

@implementation CGLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // here, we're using the default, generated defaults key, and the default value, which, in this case, equates to NO.
    [[CGLDefaultsBackedPropertyObserver sharedObserver] observeProperty:@"biz" object:self key:nil defaultValue:nil];

    // here, we're setting a custom defaults key, and a default value of YES.
    [[CGLDefaultsBackedPropertyObserver sharedObserver] observeProperty:@"bang" object:self key:@"bang" defaultValue:@YES];
    
    [[CGLDefaultsBackedPropertyObserver sharedObserver] observeProperty:@"foo" object:self key:nil defaultValue:nil];
    
    [[CGLDefaultsBackedPropertyObserver sharedObserver] observeProperty:@"bopLevel" object:self key:nil defaultValue:nil];
    
    self.bizSwitch.on = self.biz;
    self.bangSwitch.on = self.bang;
    self.textField.text = self.foo;
    self.slider.value = self.bopLevel;
}

- (IBAction)bopChanged:(id)sender {
    self.bopLevel = self.slider.value;
}

- (IBAction)toggleBiz:(id)sender {
    self.biz = !self.biz;
}

- (IBAction)toggleBang:(id)sender {
    self.bang = !self.bang;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.foo = textField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField endEditing:YES];
    return NO;
}

@end
