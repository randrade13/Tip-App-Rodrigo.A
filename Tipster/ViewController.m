//
//  ViewController.m
//  Tipster
//
//  Created by rodrigoandrade on 6/25/19.
//  Copyright © 2019 rodrigoandrade. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UIView *tipMenu;

@end

@implementation ViewController

double tip_percentage_1;
double tip_percentage_2;
double tip_percentage_3;


- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)onTap:(id)sender {
    NSLog(@"Close Keyboard on Screen");
    [self.view endEditing:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSUserDefaults *tipPercentage1 = [NSUserDefaults standardUserDefaults];
    tip_percentage_1 = [tipPercentage1 doubleForKey:@"tipPercentage1"];
    
    NSUserDefaults *tipPercentage2 = [NSUserDefaults standardUserDefaults];
    tip_percentage_2 = [tipPercentage2 doubleForKey:@"tipPercentage2"];
    
    NSUserDefaults *tipPercentage3 = [NSUserDefaults standardUserDefaults];
    tip_percentage_3 = [tipPercentage3 doubleForKey:@"tipPercentage3"];
    
    [self.tipControl setTitle:[NSString stringWithFormat:@"%.0f%%", tip_percentage_1]  forSegmentAtIndex:0];
    
    [self.tipControl setTitle:[NSString stringWithFormat:@"%.0f%%", tip_percentage_2]  forSegmentAtIndex:1];
    
    [self.tipControl setTitle:[NSString stringWithFormat:@"%.0f%%", tip_percentage_3]  forSegmentAtIndex:2];
    
    [self onEdit:self];
    
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSUserDefaults *defaultTipPercentage1 = [NSUserDefaults standardUserDefaults];
    [defaultTipPercentage1 setDouble:tip_percentage_1 forKey:@"default_tip_percentage_1"];
    [defaultTipPercentage1 synchronize];
    
    NSUserDefaults *defaultTipPercentage2 = [NSUserDefaults standardUserDefaults];
    [defaultTipPercentage2 setDouble:tip_percentage_2 forKey:@"default_tip_percentage_2"];
    [defaultTipPercentage2 synchronize];
    
    NSUserDefaults *defaultTipPercentage3 = [NSUserDefaults standardUserDefaults];
    [defaultTipPercentage3 setDouble:tip_percentage_3 forKey:@"default_tip_percentage_3"];
    [defaultTipPercentage3 synchronize];
}

- (IBAction)onEdit:(id)sender {
    
    double bill = [self.billField.text doubleValue];
    
    NSArray *percentages = @[@(round((tip_percentage_1/100)*100)/100), @(round((tip_percentage_2/100)*100)/100), @(round((tip_percentage_3/100)*100)/100)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue] ;
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}
- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.tipMenu.alpha = 1;
    }];
}
- (IBAction)onEditingEnd:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.tipMenu.alpha = 0;
    }];
}



@end
