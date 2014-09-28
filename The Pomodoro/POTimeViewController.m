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

@end

@implementation POTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    // add the settings icon to the nav bar
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingsIcon"] style:UIBarButtonItemStyleDone target:self action:@selector(viewSettings)];
    settingsButton.tintColor = [UIColor whiteColor];
    [self.navigationItem setRightBarButtonItem:settingsButton];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewSettings {
    NSLog(@"view settings method");

    POSettingsViewController *settingsController = [POSettingsViewController new];
    [self.navigationController pushViewController:settingsController animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
