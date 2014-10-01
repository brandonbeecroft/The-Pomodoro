//
//  POSettingsViewController.m
//  The Pomodoro
//
//  Created by Brandon Beecroft on 9/27/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "POSettingsViewController.h"

@interface POSettingsViewController ()

@property (weak, nonatomic) IBOutlet UISlider *roundLengthSlider;
@property (weak, nonatomic) IBOutlet UISlider *breakLengthSlider;
@property (nonatomic, strong) NSArray *numbers;

@end

@implementation POSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Settings";
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Avenir" size:20],
                                                                      NSForegroundColorAttributeName: [UIColor blackColor]}];
    _numbers = @[@(5), @(10), @(15), @(20), @(25), @(30)];
    NSInteger numberOfSteps = [self.numbers count]-1;

    NSLog(@"%li",(long)numberOfSteps);

    _roundLengthSlider.maximumValue = numberOfSteps;
    _roundLengthSlider.minimumValue = 0;
    _breakLengthSlider.maximumValue = numberOfSteps;
    _roundLengthSlider.minimumValue = 0;

    _roundLengthSlider.continuous = YES;
    _breakLengthSlider.continuous = YES;

}

- (IBAction)valueChanged:(id)sender {
    NSInteger index = (NSInteger)(_roundLengthSlider.value + 0.5);
    [_roundLengthSlider setValue:index animated:NO];
    //[_breakLengthSlider setValue:index animated:NO];
    NSNumber *number = _numbers[index];
    NSLog(@"number: %@",number);
}


@end
