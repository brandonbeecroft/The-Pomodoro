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
@property (nonatomic, assign) NSNumber *number;
@property (nonatomic, assign) NSInteger *sliderValue;

@end

@implementation POSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    NSLog(@"Slider value is: %fl",self.roundLengthSlider.value);

    self.title = @"Settings";
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Avenir" size:20],
                                                                      NSForegroundColorAttributeName: [UIColor blackColor]}];
    _numbers = @[@(5), @(10), @(15), @(20), @(25), @(30)];
    NSInteger numberOfSteps = [self.numbers count]-1;

    _roundLengthSlider.minimumValue = 0;
    _roundLengthSlider.maximumValue = numberOfSteps;

//    _breakLengthSlider.maximumValue = numberOfSteps;
//    _breakLengthSlider.minimumValue = 0;

    _roundLengthSlider.continuous = YES;
    NSNumber *roundValue = [[NSUserDefaults standardUserDefaults] objectForKey:@"roundSliderValue"];
    _roundLengthSlider.value = roundValue.floatValue;
    NSLog(@"slider value: %f",_roundLengthSlider.value);
    NSLog(@"round value: %@", roundValue);

//    _breakLengthSlider.continuous = YES;

}

- (IBAction)valueChanged:(id)sender {
    NSInteger index = (NSInteger)(_roundLengthSlider.value + 0.5);
    [_roundLengthSlider setValue:index animated:NO];
    //NSLog(@"AFter slider changed - slider value is: %@l",_number);
    //[_breakLengthSlider setValue:index animated:NO];
    _number = _numbers[index];
    [self postMinutes];

    [[NSUserDefaults standardUserDefaults] setObject:@(_roundLengthSlider.value) forKey:@"roundSliderValue"];
    [[NSUserDefaults standardUserDefaults] setObject:_number forKey:@"roundValue"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)postMinutes {
    [[NSNotificationCenter defaultCenter] postNotificationName:newTimeNotification object:nil userInfo:@{newTimeNotification: _number}];
}

@end
