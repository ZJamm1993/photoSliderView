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
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showImg:(id)sender {
    NSArray* imgs=[NSArray arrayWithObjects:
                   //                @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1508838600421&di=657bb23fe8427c3b0bd101fe297214d2&imgtype=0&src=http%3A%2F%2Fwww.im4s.cn%2Ftrade%2Fuploads%2Fallimg%2F160606%2F456-160606114A6326.jpg",
                   //                @"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1889566272,4112726323&fm=27&gp=0.jpg",
                                   @"0.jpg",@"1.jpg",@"100.png",@"2.jpg",@"3.jpg",@"4.jpg", nil];
//    PhotoSliderView* php=[[PhotoSliderView alloc]initWithFrame:self.view.bounds];
//    php.images=[NSArray arrayWithObjects:
//                @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1508838600421&di=657bb23fe8427c3b0bd101fe297214d2&imgtype=0&src=http%3A%2F%2Fwww.im4s.cn%2Ftrade%2Fuploads%2Fallimg%2F160606%2F456-160606114A6326.jpg",
//                @"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1889566272,4112726323&fm=27&gp=0.jpg",
//                @"0.jpg",@"1.jpg",@"100.png",@"2.jpg",@"3.jpg",@"4.jpg", nil];
//    php.title=@"公路最速e理论";
//    //    [self.view addSubview:php];
//    [php showFromFrame:CGRectZero toFrame:[UIScreen mainScreen].bounds];
    
    UINavigationController* nav=[PhotoSliderViewController navgationControllerWithPhotoSlider:^(PhotoSliderViewController *sliderController) {
        sliderController.images=imgs;
    }];
    [self presentViewController:nav animated:YES completion:nil];
}

@end
