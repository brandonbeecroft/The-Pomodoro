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

@property (nonatomic) NSInteger *minutes;
@property (nonatomic) NSInteger *seconds;
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
    

}


- (void)viewSettings {
    NSLog(@"view settings method");

    POSettingsViewController *settingsController = [POSettingsViewController new];
    [self.navigationController pushViewController:settingsController animated:YES];
}

- (IBAction)tapToStart:(id)sender {
    NSLog(@"start the timer");
    _tapButton.hidden = YES;

}


@end
