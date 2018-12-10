//
//  ViewController.m
//  calculate
//
//  Created by QQ Shih on 2017/4/19.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "CalculateViewController.h"
#import "CalculateViewModel.h"

@interface CalculateViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (nonatomic) CalculateViewModel *viewModel;

@end

@implementation CalculateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[CalculateViewModel alloc] init];
    [self.viewModel addObserver:self forKeyPath:@"displayString" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"displayString"]) {
        self.displayLabel.text = [change objectForKey:@"new"];
    }
}

- (IBAction)operationButtonTouchUpInside:(UIButton *)sender {
    NSDictionary *operationDict = @{@"C"    : @(kOperationTypeClear),
                                    @"Sqrt" : @(kOperationTypeSqrt),
                                    @"^"    : @(kOperationTypeSquare),
                                    @"/"    : @(kOperationTypeDivide),
                                    @"*"    : @(kOperationTypeMultiple),
                                    @"-"    : @(kOperationTypeMinor),
                                    @"+"    : @(kOperationTypeAdd),
                                    @"="    : @(kOperationTypeEqual),
                                    @"Pi"   : @(kOperationTypePi),
                                    @"±"    : @(kOperationTypePlusMinus)};
    [self.viewModel performOperationType:(OperationType)[operationDict[sender.titleLabel.text] integerValue]];
}

- (IBAction)digitTouchUpInside:(UIButton *)sender {
    [self.viewModel appendDigit:sender.titleLabel.text];
}

@end
