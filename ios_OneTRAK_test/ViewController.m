//
//  ViewController.m
//  ios_OneTRAK_test
//
//  Created by user on 06.07.17.
//  Copyright © 2017 ISA. All rights reserved.
//

#import "ViewController.h"

NSInteger DefaultPower = 2;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (assign, nonatomic) NSInteger calculationsCount;
@end

@implementation ViewController

#pragma mark LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.calculationsCount = 0;
    _resultLabel.text = @"";
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Setters

-(void)setCalculationsCount:(NSInteger)calculationsCount{
    _calculationsCount = calculationsCount;
    _countLabel.text = [NSString stringWithFormat:@"%ld", (long)calculationsCount];
}

#pragma mark Actions

- (IBAction)countButtonAction:(UIButton *)sender {
    
    if (_inputTextField.text.length>0) {
        
        NSInteger number = _inputTextField.text.integerValue;
        _resultLabel.text = [NSString stringWithFormat:@"%ld", (long)[self raiseNumber:number toPowerOf:DefaultPower]];
        _inputTextField.text = @"";
        self.calculationsCount++;
        
    }
    
}
- (IBAction)cleanButtonAction:(UIButton *)sender {
    self.calculationsCount = 0;
    _resultLabel.text = @"";
}

#pragma mark Private Methods

-(NSInteger)raiseNumber:(NSInteger)number toPowerOf:(NSInteger)power {
    
    if (power==1) {
        return number;
    }
    
    NSInteger sum = 0;
    for (int i = 0; i<number; i++) {
        sum += [self raiseNumber:number toPowerOf:(power-1)];
    }
    
    return sum;
}

@end
