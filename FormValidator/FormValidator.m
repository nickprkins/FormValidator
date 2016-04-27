
//
//  FormValidator.m
//  FormValidator
//
//  Created by Nick Perkins on 4/26/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

#import "FormValidator.h"

@implementation FormValidator

-(BOOL) validateName:(NSString*) nameString {
    
    return [[nameString componentsSeparatedByString:@" "] count] > 1;
}

-(BOOL) isValidAddress:(NSString *) addressString{
    NSTextCheckingType detectorType = NSTextCheckingTypeAddress;
    
    NSError * error;
    
    NSDataDetector * dataDetector = [NSDataDetector dataDetectorWithTypes:detectorType error:&error];
    
    __block BOOL rc = NO;
    
    [dataDetector enumerateMatchesInString:addressString options:kNilOptions range:NSMakeRange(0, [addressString length]) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        rc = YES;
    
    }];
    
    return rc;
}

-(BOOL) isValidCity:(NSString *)cityString{
    BOOL rc = NO;
    if(cityString.length >= 2){
        rc = YES;
    }else{
        rc = NO;
    }
    
    return rc;
}

-(BOOL) isValidState:(NSString *)stateString{
    BOOL rc = NO;
    if(stateString.length == 2){
        rc = YES;
    }else{
        rc = NO;
    }
    
    return rc;
}

-(BOOL) isValidPhone:(NSString *)phoneString{
    NSTextCheckingType detectorType = NSTextCheckingTypePhoneNumber;
    
    NSError * error;
    
    NSDataDetector * dataDetector = [NSDataDetector dataDetectorWithTypes:detectorType error:&error];
    
    __block BOOL rc = NO;
    
    [dataDetector enumerateMatchesInString:phoneString options:kNilOptions range:NSMakeRange(0, [phoneString length]) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        rc = YES;
        
    }];
    
    return rc;

}

-(BOOL) isZipCode:(NSString*)zipString{
    BOOL rc =NO;
    NSCharacterSet * set = [NSCharacterSet characterSetWithCharactersInString:@"1234567890"];
    
    set = [set invertedSet];
    
    NSRange myRange =[zipString rangeOfCharacterFromSet:set];
    
    rc =(myRange.location == NSNotFound);
    
    rc = ([zipString length]==5) && rc;
    
    return rc;
}

@end
