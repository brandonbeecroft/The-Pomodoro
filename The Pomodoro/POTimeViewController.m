//
//  POTimeViewController.m
//  The Pomodoro
//
//  Created by Brandon Beecroft on 9/27/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "POTimeViewController.h"
#import "POSettingsViewController.h"

@interface POTimeViewController ()

@property (nonatomic, assign) NSInteger minutes;
@property (nonatomic, assign) NSInteger seconds;
@property (nonatomic) BOOL isWork;
@property (weak, nonatomic) IBOutlet UIButton *tapButton;

@property (weak, nonatomic) IBOutlet UILabel *roundValue;
@property (weak, nonatomic) IBOutlet UILabel *breakValue;
@property (weak, nonatomic) IBOutlet UILabel *timeValue;

@end

@implementation POTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    // add the settings icon to the nav bar
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingsIcon"] style:UIBarButtonItemStyleDone target:self action:@selector(viewSettings)];
    settingsButton.tintColor = [UIColor whiteColor];
    [self.navigationItem setRightBarButtonItem:settingsButton];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    // temporary until i can get the minutes selected into NSUserDefaults and read out again.
    _minutes = 11;
    _seconds = 9;
    _timeValue.text = [NSString stringWithFormat:@"%ld:0%ld", (long)_minutes, (long)_seconds];
}


- (void)viewSettings {
     POSettingsViewController *settingsController = [POSettingsViewController new];
    [self.navigationController pushViewController:settingsController animated:YES];
}

- (IBAction)tapToStart:(id)sender {
    NSLog(@"start the timer");
    _tapButton.hidden = YES;

    [self decreaseTime];

}

-(void)decreaseTime {
    _isWork = YES;
    if (_seconds > 0 ) {
        _seconds--;
    }

    if (_minutes > 0) {
        if (_seconds == 0) {
            _seconds = 59;
            _minutes--;

        }
    } else {

        if (_seconds == 0) {
            NSLog(@"Time has ended");

            _isWork = NO;
        }
    }

    [self updateTimeLabel];

    if (_isWork) {
        [self performSelector:@selector(decreaseTime) withObject:nil afterDelay:1.0];
    }

}

-(void)updateTimeLabel {
    if (_seconds < 10) {
        _timeValue.text = [NSString stringWithFormat:@"%ld:0%ld", (long)_minutes, (long)_seconds];
    } else {
        _timeValue.text = [NSString stringWithFormat:@"%ld:%ld",(long)_minutes, (long)_seconds];
    }
}


@end
