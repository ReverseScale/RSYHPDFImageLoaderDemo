//
//  ViewController.m
//  RSYHPDFImageLoaderDemo
//
//  Created by WhatsXie on 2017/8/11.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+YHPDFIcon.h"
#import "UIImage+Vector.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)

@interface ViewController ()<UIScrollViewDelegate> {
    UIScrollView *_scrollview;
}

@property (nonatomic, strong) UIImageView *pdfImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.clipsToBounds = YES;

    
    [self setupScrollView];
    
    [self setupUI];

}
- (void)setupScrollView {
    _scrollview=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_scrollview];
    
    _scrollview.contentSize=CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    _scrollview.delegate=self;
    _scrollview.maximumZoomScale=2.0;
    _scrollview.minimumZoomScale=0.5;
}
#pragma mark - private method
- (void)setupUI {
    
    NSString *pdfName = @"bundle-pdf-test";
    [_scrollview addSubview:self.pdfImageView];

    UIImage *image = [UIImage yh_imageNamed:pdfName];
    image = [UIImage yh_imageWithPDFFileNamed:pdfName expectSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    [self updatePdfImageViewWithImage:image];
}

- (void)updatePdfImageViewWithImage:(UIImage *)image {
    self.pdfImageView.image = image;
    [self.pdfImageView sizeToFit];
}

- (UIImageView *)pdfImageView {
    if (!_pdfImageView) {
        _pdfImageView = [[UIImageView alloc] init];
        _pdfImageView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
    }
    return _pdfImageView;
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.pdfImageView;
}
- (void)scrollViewDidZoom:(UIScrollView *)aScrollView {
    CGFloat offsetX = (_scrollview.bounds.size.width > _scrollview.contentSize.width)?
    (_scrollview.bounds.size.width - _scrollview.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (_scrollview.bounds.size.height > _scrollview.contentSize.height)?
    (_scrollview.bounds.size.height - _scrollview.contentSize.height) * 0.5 : 0.0;
    _pdfImageView.center = CGPointMake(_scrollview.contentSize.width * 0.5 + offsetX,_scrollview.contentSize.height * 0.5 + offsetY);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
