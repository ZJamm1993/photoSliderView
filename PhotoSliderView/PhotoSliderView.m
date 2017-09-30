//
//  PhotoSliderView.m
//  PhotoSliderView
//
//  Created by bangju on 2017/9/30.
//  Copyright © 2017年 bangju. All rights reserved.
//

#import "PhotoSliderView.h"

const NSInteger ScrollViewBgTag=10;
const NSInteger ScrollViewImgTag=20;

@interface PhotoSliderView()<UIScrollViewDelegate>

@end

@implementation PhotoSliderView

-(void)setImages:(NSArray *)images
{
    _images=[NSArray arrayWithArray:images];
    
    [self layoutImages];
}

-(void)layoutImages
{
    self.backgroundColor=[UIColor blackColor];
    
    NSArray* subviews=[self subviews];
    for (UIView* sub in subviews) {
        [sub removeFromSuperview];
    }
    
    NSInteger count=self.images.count;
    
    CGRect fra=self.frame;
    CGSize siz=fra.size;
    
    UIScrollView* bgScrollview=[[UIScrollView alloc]initWithFrame:self.bounds];
    bgScrollview.contentSize=CGSizeMake(count*siz.width, siz.height);
    [self addSubview:bgScrollview];
    bgScrollview.delegate=self;
    bgScrollview.pagingEnabled=YES;
    bgScrollview.tag=ScrollViewBgTag;

    for (int i=0; i<count; i++) {
        UIScrollView* imageBg=[[UIScrollView alloc]initWithFrame:CGRectMake(i*siz.width, 0, siz.width, siz.height)];
        imageBg.delegate=self;
        imageBg.tag=ScrollViewImgTag;
        imageBg.maximumZoomScale=2;
        imageBg.minimumZoomScale=1;
        
        UIImageView* imgeVi=[[UIImageView alloc]initWithFrame:imageBg.bounds];
        [imageBg addSubview:imgeVi];
        [bgScrollview addSubview:imageBg];
        
        NSObject* obj=[self.images objectAtIndex:i];
        
        UIImage* img;
        if ([obj isKindOfClass:[UIImage class]]) {
            img=(UIImage*)obj;
        }
        else if([obj isKindOfClass:[NSString class]])
        {
            img=[UIImage imageNamed:(NSString*)obj];
        }
        imgeVi.image=img;
        imgeVi.contentMode=UIViewContentModeScaleAspectFit;
        
//        continue;
        CGFloat rateImgWh=img.size.width/img.size.height;
        CGFloat rateScrWh=siz.width/siz.height;
        
        CGSize newImageSize=CGSizeZero;
        if (rateImgWh>rateScrWh) {
            newImageSize=CGSizeMake(siz.width, siz.width/rateImgWh);
        }
        else
        {
            newImageSize=CGSizeMake(siz.height*rateImgWh, siz.height);
        }
        imgeVi.frame=CGRectMake(siz.width/2-newImageSize.width/2, siz.height/2-newImageSize.height/2, newImageSize.width, newImageSize.height);
    }
}

-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    if (scrollView.tag==ScrollViewImgTag) {
        return scrollView.subviews.firstObject;
    }
    return nil;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    if (scrollView.tag==ScrollViewImgTag) {
        CGFloat xcenter = scrollView.bounds.size.width/2;
        CGFloat ycenter = scrollView.bounds.size.height/2;
        
        xcenter = scrollView.contentSize.width > scrollView.frame.size.width ? scrollView.contentSize.width/2 : xcenter;
        ycenter = scrollView.contentSize.height > scrollView.frame.size.height ? scrollView.contentSize.height/2 : ycenter;
        
        [scrollView.subviews.firstObject setCenter:CGPointMake(xcenter, ycenter)];
    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag==ScrollViewBgTag) {
        CGPoint contentOffset=scrollView.contentOffset;
        CGSize boundsSize=scrollView.bounds.size;
        NSArray* subviews=scrollView.subviews;
        for (int i=0;i<subviews.count;i++) {
            UIView* sub=[subviews objectAtIndex:i];
            CGFloat leftx=contentOffset.x;
            CGRect showingRect=CGRectMake(leftx, 0, boundsSize.width, boundsSize.height);
            BOOL isShowing=CGRectIntersectsRect(showingRect, sub.frame);
            if (!isShowing) {
                if ([sub isKindOfClass:[UIScrollView class]]) {
                    UIScrollView* subScr=(UIScrollView*)sub;
                    subScr.zoomScale=subScr.minimumZoomScale;
                }
            }
        }
    }
}

@end
