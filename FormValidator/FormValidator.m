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

-(BOOL) isZipCode:(NSString *)zipString{
    BOOL rc = NO;
    
    NSCharacterSet * set = [NSCharacterSet characterSetWithCharactersInString:@"1234567890"];
    rc = ([zipString length]==5) && ([zipString rangeOfCharacterFromSet:set].location != NSNotFound);
    
    return rc;
    
}

@end
