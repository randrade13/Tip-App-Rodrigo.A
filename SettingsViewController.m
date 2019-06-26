//
//  SettingsViewController.m
//  Tipster
//
//  Created by rodrigoandrade on 6/25/19.
//  Copyright © 2019 rodrigoandrade. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISlider *option1Slider;
@property (weak, nonatomic) IBOutlet UISlider *option2Slider;
@property (weak, nonatomic) IBOutlet UISlider *option3Slider;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentage1Label;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentage2Label;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentage3Label;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaultTipPercentage1 = [NSUserDefaults standardUserDefaults];
    double default_tip_percentage_1 = [defaultTipPercentage1 doubleForKey:@"default_tip_percentage_1"];
    
    NSUserDefaults *defaultTipPercentage2 = [NSUserDefaults standardUserDefaults];
    double default_tip_percentage_2 = [defaultTipPercentage2 doubleForKey:@"default_tip_percentage_2"];
    
    NSUserDefaults *defaultTipPercentage3 = [NSUserDefaults standardUserDefaults];
    double default_tip_percentage_3 = [defaultTipPercentage3 doubleForKey:@"default_tip_percentage_3"];
    
    [self.option1Slider setValue:(float) default_tip_percentage_1 animated:NO
     ];
    [self.option2Slider setValue:(float) default_tip_percentage_2 animated:NO
     ];
    [self.option3Slider setValue:(float) default_tip_percentage_3 animated:NO
     ];
    self.tipPercentage1Label.text = [NSString stringWithFormat:@"Option 1 Tip: %.0f%%", default_tip_percentage_1];
    self.tipPercentage2Label.text = [NSString stringWithFormat:@"Option 2 Tip: %.0f%%", default_tip_percentage_2];
    self.tipPercentage3Label.text = [NSString stringWithFormat:@"Option 3 Tip: %.0f%%", default_tip_percentage_3];
}

- (IBAction)didChangeOption1:(id)sender {
    double option1TipPercentage = self.option1Slider.value;
    self.tipPercentage1Label.text = [NSString stringWithFormat:@"Option 1 Tip: %.0f%%", option1TipPercentage];
    
    NSUserDefaults *tipPercentage1 = [NSUserDefaults standardUserDefaults];
    [tipPercentage1 setDouble:option1TipPercentage forKey:@"tipPercentage1"];
    [tipPercentage1 synchronize];
}
- (IBAction)didChangeOption2:(id)sender {
    double option2TipPercentage = self.option2Slider.value;
    self.tipPercentage2Label.text = [NSString stringWithFormat:@"Option 2 Tip: %.0f%%", option2TipPercentage];
    
    NSUserDefaults *tipPercentage2 = [NSUserDefaults standardUserDefaults];
    [tipPercentage2 setDouble:option2TipPercentage forKey:@"tipPercentage2"];
    [tipPercentage2 synchronize];
}
- (IBAction)didChangeOption3:(id)sender {
    double option3TipPercentage = self.option3Slider.value;
    self.tipPercentage3Label.text = [NSString stringWithFormat:@"Option 3 Tip: %.0f%%", option3TipPercentage];
    
    NSUserDefaults *tipPercentage3 = [NSUserDefaults standardUserDefaults];
    [tipPercentage3 setDouble:option3TipPercentage forKey:@"tipPercentage3"];
    [tipPercentage3 synchronize];
}

@end
