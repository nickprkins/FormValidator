//
//  ViewController.m
//  FormValidator
//
//  Created by Nick Perkins on 4/26/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

#import "ViewController.h"
#import "FormValidator.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic)IBOutlet UITextField * nameTextField;
@property (weak, nonatomic) IBOutlet UITextField * addressTextField;
@property (weak, nonatomic) IBOutlet UITextField * zipTextField;
@property (strong, nonatomic) FormValidator * formValidator;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.addressTextField.placeholder = @"Address";
    
    self.formValidator = [[FormValidator alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//called when 'return' key pressed. return NO to ignore.
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([textField isEqual: self.nameTextField]){
        if( [self.formValidator validateName:self.nameTextField.text]){
            [self.nameTextField resignFirstResponder];
            [self.addressTextField becomeFirstResponder];
            return YES;
        }

    }else if([textField isEqual:self.addressTextField]){
        if( [self.formValidator isValidAddress:self.addressTextField.text]){
            [self.addressTextField resignFirstResponder];
            [self.zipTextField becomeFirstResponder];
            return YES;
        }
    }else if([textField isEqual:self.zipTextField]){
        return [self.formValidator isZipCode:self.zipTextField.text];
    }

    return NO;
}
@end
