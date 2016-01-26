//
//  ViewController.m
//  MasonryDemo
//
//  Created by 张员外 on 16/1/26.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
{
    UISlider* _slider;
    UIView* _bgView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 20, self.view.frame.size.width - 100, 20)];
    _slider.minimumValue = 100;
    _slider.maximumValue = self.view.frame.size.width - 100;
    _slider.value = 100;
    [_slider addTarget:self action:@selector(changeValue) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
    
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, _slider.value, _slider.value)];
    _bgView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_bgView];
    
    UIView* view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    [_bgView addSubview:view1];
    
    UIView* view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [_bgView addSubview:view2];
    //
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(100, 100));
//        make.edges.mas_equalTo(_bgView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
        make.centerY.mas_equalTo(_bgView.mas_centerY);
        make.left.mas_equalTo(_bgView.mas_left).offset(20);
        make.right.mas_equalTo(view2.mas_left).offset(-20);
        
        make.width.mas_equalTo(view2.mas_width);
        make.height.mas_equalTo(@50);
    }];
    //
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_bgView.mas_centerY);
        make.right.mas_equalTo(_bgView.mas_right).offset(-20);
        make.left.mas_equalTo(view1.mas_right).offset(20);
        
//        make.width.mas_equalTo(view1.mas_width);
        make.height.mas_equalTo(@60);
    }];
}

//
- (void)changeValue{
    _bgView.frame = CGRectMake(50, 50, _slider.value, _slider.value);
}


@end
