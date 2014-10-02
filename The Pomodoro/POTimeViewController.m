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

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        [self registerForNotifications];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    // add the settings icon to the nav bar
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingsIcon"] style:UIBarButtonItemStyleDone target:self action:@selector(viewSettings)];
    settingsButton.tintColor = [UIColor whiteColor];
    [self.navigationItem setRightBarButtonItem:settingsButton];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    // temporary until i can get the minutes selected into NSUserDefaults and read out again.
    //_minutes = 11;

    //load the minutes as saved from the settings screen and display in the label.
    _minutes = [[[NSUserDefaults standardUserDefaults] objectForKey:@"roundValue"] integerValue];
    _seconds = 0;
    _timeValue.text = [NSString stringWithFormat:@"%ld:0%ld", (long)_minutes, (long)_seconds];
    //NSLog(@"Initial minutes are: %ld", (long)_minutes);

}

- (void)viewSettings {
     POSettingsViewController *settingsController = [POSettingsViewController new];
    [self.navigationController pushViewController:settingsController animated:YES];
}

#pragma mark - Notifications
-(void)registerForNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChanged:) name:newTimeNotification object:nil];
}

-(void)unregisterForNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:newTimeNotification object:nil];
}

-(void) dealloc {
    [self unregisterForNotifications];
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

-(void)valueChanged:(NSNotification *)notification {
    _minutes = [notification.userInfo[newTimeNotification] integerValue];
    NSLog(@"Value changed minutes value is: %li", (long)_minutes);
    _seconds = 0;

    [self updateTimeLabel];
}



@end
