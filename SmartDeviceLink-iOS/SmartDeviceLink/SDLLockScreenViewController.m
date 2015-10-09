//
//  SDLLockScreenViewController.m
//  SmartDeviceLink-iOS
//
//  Created by Joel Fischer on 10/7/15.
//  Copyright © 2015 smartdevicelink. All rights reserved.
//

#import "SDLLockScreenViewController.h"

@interface SDLLockScreenViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *primaryImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondaryImageView;
@property (weak, nonatomic) IBOutlet UIImageView *vehicleIconImageView;

@end


@implementation SDLLockScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self sdl_layoutImages];
}


#pragma mark - Setters

- (void)setAppIcon:(UIImage *)appIcon {
    [self sdl_layoutImages];
}

- (void)setVehicleIcon:(UIImage *)vehicleIcon {
    [self sdl_layoutImages];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [self sdl_setBackgroundColor];
}


#pragma mark - Layout

- (void)sdl_layoutImages {
    if (self.vehicleIcon) {
        self.vehicleIconImageView.image = self.vehicleIcon;
    }
    
    if (self.appIcon) {
        self.primaryImageView.image = self.appIcon;
        self.secondaryImageView.image = [self.class sdl_sdlImage];
    } else {
        self.primaryImageView.image = [self.class sdl_sdlImage];
        self.secondaryImageView.image = nil;
    }
}

- (void)sdl_setBackgroundColor {
    self.view.backgroundColor = self.backgroundColor;
}


#pragma mark - Private Image

+ (UIImage *)sdl_sdlImage {
    NSBundle *sdlBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"SmartDeviceLink" ofType:@"bundle"]];
    
    return [UIImage imageNamed:@"sdl_logo" inBundle:sdlBundle compatibleWithTraitCollection:nil];
}

@end
