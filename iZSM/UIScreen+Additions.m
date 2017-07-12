//
//  UIScreen+Additions.m
//  Additions
//
//  Created by Johnil on 13-6-15.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import "UIScreen+Additions.h"

@implementation UIScreen (Additions)

+ (CGFloat)screenWidth{
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0) {
            return [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale;
        } else {
            return [UIScreen mainScreen].bounds.size.height;
        }
    } else {
        if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0) {
            return [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale;
        } else {
            return [UIScreen mainScreen].bounds.size.width;
        }
    }
}

+ (CGFloat)screenHeight{
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0) {
            if ([UIApplication sharedApplication].statusBarFrame.size.width>20) {
                return [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale-20;
            }
            return [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale;
        } else {
            if ([UIApplication sharedApplication].statusBarFrame.size.width>20) {
                return [UIScreen mainScreen].bounds.size.width-20;
            }
            return [UIScreen mainScreen].bounds.size.width;
        }
    } else {
        if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0) {
            if ([UIApplication sharedApplication].statusBarFrame.size.height>20) {
                return [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale-20;
            }
            return [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale;
        } else {
            if ([UIApplication sharedApplication].statusBarFrame.size.height>20) {
                return [UIScreen mainScreen].bounds.size.height-20;
            }
            return [UIScreen mainScreen].bounds.size.height;
        }
    }
}

+ (BOOL)isRetina{
    if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0) {
        return [UIScreen mainScreen].nativeScale>=2;
    } else {
        return [UIScreen mainScreen].scale>=2;
    }
}

+ (CGFloat)scale{
    if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0) {
        return [UIScreen mainScreen].nativeScale;
    } else {
        return [UIScreen mainScreen].scale;
    }
}

+ (BOOL)isSmallScreen {
    return [UIScreen screenWidth] < 350;
}

@end
