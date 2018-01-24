//
//  ViewController.m
//  12_21
//
//  Created by renren-mac on 2017/12/21.
//  Copyright © 2017年 renren-mac. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "Instance.h"
@interface ViewController ()<PassValueDelegate>
@property(nonatomic,strong)UILabel*               label;
@property(nonatomic,strong)UIButton*              firstbtn;

@end

@implementation ViewController

-(UILabel*)label
{
    if (_label==nil) {
        _label=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
        _label.backgroundColor=[UIColor blackColor];
        _label.textColor=[UIColor redColor];
        _label.font=[UIFont systemFontOfSize:20];
    }
    return _label;
}

-(UIButton *)firstbtn
{
    if(!_firstbtn)
    {
        _firstbtn=[[UIButton alloc]initWithFrame:CGRectMake(100, 300, 200, 40)];
        _firstbtn.backgroundColor=[UIColor redColor];
        [_firstbtn setTitle:@"跳转至下一页面" forState:UIControlStateNormal];
        [_firstbtn addTarget:self action:@selector(firstBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _firstbtn;
}

-(void)firstBtnClick
{
    NextViewController* next=[[NextViewController alloc]init];
    next.str=@"hello world";
    //单例正向传值
//   [Instance sharedInstace].str=self.label.text;
    //沙盒正向传值
    //   [[NSUserDefaults standardUserDefaults] setObject:@"hello Nsuser" forKey:@"1"];
//    [[NSUserDefaults standardUserDefaults]synchronize];
//
    //代理
    next.delegate=self;
    
//    next.block=^(NSString *str){
//        //self.label.text=str;
//    };
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notHandle:) name:@"notify" object:nil];
    [self presentViewController:next animated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.label];
    [self.view addSubview:self.firstbtn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.label.text=[Instance sharedInstace].str;
//    self.label.text=[[NSUserDefaults standardUserDefaults]objectForKey:@"2"];
    
}

- (void)notHandle:(NSNotification*)not
{
    self.label.text=not.userInfo[@"not"];
}

- (void)PassValue:(NSString *)str
{
   // self.label.text=str;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
