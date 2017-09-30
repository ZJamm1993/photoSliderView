//
//  ViewController.m
//  PhotoSliderView
//
//  Created by bangju on 2017/9/30.
//  Copyright © 2017年 bangju. All rights reserved.
//

#import "ViewController.h"
#import "PhotoSliderView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PhotoSliderView* php=[[PhotoSliderView alloc]initWithFrame:self.view.bounds];
    php.images=[NSArray arrayWithObjects:@"0.jpg",@"1.jpg",@"100.png",@"2.jpg",@"3.jpg",@"4.jpg", nil];
    [self.view addSubview:php];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
