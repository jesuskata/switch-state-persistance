//
//  ViewController.m
//  switch-state-persistance
//
//  Created by Jesús Alejandro Romero Zárate on 03/07/18.
//  Copyright © 2018 Jesús Alejandro Romero Zárate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)switchLabelChanger:(UISwitch *)sender {
    if (_switchChanger.on) {
        _labelToChange.text = @"I am agree";
        _labelToChange.textColor = UIColor.greenColor;
    } else {
        _labelToChange.text = @"Is necessary accept";
        _labelToChange.textColor = UIColor.redColor;
    }
    
    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:_labelToChange.textColor];
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"myColor"];
    
    [[NSUserDefaults standardUserDefaults] setValue:self.labelToChange.text forKey:@"labelField"];
    [[NSUserDefaults standardUserDefaults] setBool:self.switchChanger.isOn forKey:@"switchState"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.switchChanger setOn:[[NSUserDefaults standardUserDefaults] boolForKey:@"switchState"]];
    self.labelToChange.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"labelField"];
    
    NSData *colorData = [[NSUserDefaults standardUserDefaults] objectForKey:@"myColor"];
    _labelToChange.textColor = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
}

@end
