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

@property (weak, nonatomic) IBOutlet UITextField * nameTextField;
@property (weak, nonatomic) IBOutlet UITextField * addressTextField;
@property (weak, nonatomic) IBOutlet UITextField * zipTextField;
@property (weak, nonatomic) IBOutlet UITextField * stateTextField;
@property (weak, nonatomic) IBOutlet UITextField * cityTextField;
@property (weak, nonatomic) IBOutlet UITextField * phoneTextField;

@property (weak, nonatomic) IBOutlet UILabel * mailingAddressField;

@property (strong, nonatomic) FormValidator * formValidator;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Validator";
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
            [self.cityTextField becomeFirstResponder];
            return YES;
        }
        
    }else if([textField isEqual:self.cityTextField]){
        if( [self.formValidator isValidCity:self.cityTextField.text]){
            [self.cityTextField resignFirstResponder];
            [self.stateTextField becomeFirstResponder];
            return YES;
        }
        
    }else if([textField isEqual:self.stateTextField]){
        if( [self.formValidator isValidState:self.stateTextField.text]){
            [self.stateTextField resignFirstResponder];
            [self.zipTextField becomeFirstResponder];
            return YES;
        }
    }else if([textField isEqual:self.zipTextField]){
        if ( [self.formValidator isZipCode:self.zipTextField.text]){
            [self.zipTextField resignFirstResponder];
            [self.phoneTextField becomeFirstResponder];
            return YES;
        }
    }else if([textField isEqual:self.phoneTextField]){
        if( [self.formValidator isValidPhone:self.phoneTextField.text]){
            self.mailingAddressField.text = @"Hello World!";
            return YES;
        }
    }

    return NO;
}
@end
