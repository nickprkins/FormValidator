//
//  FormValidator.h
//  FormValidator
//
//  Created by Nick Perkins on 4/26/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormValidator : NSObject

-(BOOL) validateName:(NSString*) nameString;
-(BOOL) isValidAddress:(NSString *) addressString;
-(BOOL) isValidCity:(NSString *) cityString;
-(BOOL) isValidState:(NSString *) stateString;
-(BOOL) isZipCode:(NSString *) zipString;
-(BOOL) isValidPhone:(NSString *) phoneString;

@end
