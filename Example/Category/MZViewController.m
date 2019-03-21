//
//  MZViewController.m
//  Category
//
//  Created by MaricleZhang on 03/21/2019.
//  Copyright (c) 2019 MaricleZhang. All rights reserved.
//

#import "MZViewController.h"
#import "MZCategory.h"

@interface MZViewController ()

@end

@implementation MZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addTextField];
    [self addButton];
    [self addCustomStyleButton];
    [self addEnlargeAreaButton];
    [self addColorImageView];
}

- (void)addTextField
{
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(100, 100, 150, 50);
    textField.backgroundColor = [UIColor redColor];
    textField.limitLength = @(5);
    [self.view addSubview:textField];
}

- (void)addButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 200, 100, 50);
    button.touchInterval = 5;
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)addCustomStyleButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 300, 50, 80);
    [button setTitle:@"首页" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setImage:[UIImage imageNamed:@"home"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    [button layoutButtonWithEdgeInsetsStyle:CustomButtonStyleTop imageTitleSpace:10];
}

- (void)addEnlargeAreaButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 400, 20, 20);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button.isDefaultEnlargeArea = YES;
    //    [button setEnlargeEdgeWithTop:20 left:20 bottom:20 right:20];
}

- (void)addColorImageView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(100, 500, 50, 50);
    
    //    imageView.image = [UIImage imageWithColor:[UIColor greenColor]];
    imageView.image = [UIImage imageColors:@[[UIColor greenColor],[UIColor redColor]] size:imageView.bounds.size gradientDirection:ImageColorGradientDirectionVertical];
    [self.view addSubview:imageView];
}

#pragma mark - Responce

- (void)buttonAction
{
    NSLog(@"1111");
}

@end
