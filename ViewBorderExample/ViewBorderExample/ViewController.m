//
//  ViewController.m
//  ViewBorderExample
//
//  Created by lkeg on 15/11/3.
//  Copyright © 2015年 lkeg. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Border.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation ViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self.view setBorder:UIViewBorderAll width:1 color:[UIColor whiteColor]];
    [self.leftView setBorder:UIViewBorderAll width:1 color:[UIColor whiteColor]];
    [self.rightView setBorder:UIViewBorderAll width:1 color:[UIColor whiteColor]];
    [self.bottomView setBorder:UIViewBorderAll width:1 color:[UIColor whiteColor]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
