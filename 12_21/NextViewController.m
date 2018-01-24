//
//  NextViewController.m
//  12_21
//
//  Created by renren-mac on 2017/12/21.
//  Copyright © 2017年 renren-mac. All rights reserved.
//

#import "NextViewController.h"
#import "Instance.h"
@interface NextViewController ()
@property(nonatomic,strong)UITextField*             TextField;
@property(strong,nonatomic)UIButton*                secondbtn;

@end



@implementation NextViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.TextField];
    [self.view addSubview:self.secondbtn];
}

-(UITextField *)TextField
{
    if (!_TextField) {
        _TextField=[[UITextField alloc]initWithFrame:CGRectMake(100 , 100, 200, 40)];
        _TextField.borderStyle=UITextBorderStyleLine;
//        _TextField.text=self.str;
//        _TextField.text=[Instance sharedInstace].str;
//        _TextField.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"1"];
    }
    return _TextField;
}

-(UIButton *)secondbtn
{
    if(!_secondbtn)
    {
        _secondbtn=[[UIButton alloc]initWithFrame:CGRectMake(100, 200, 200, 40)];
        _secondbtn.backgroundColor=[UIColor redColor];
        [_secondbtn setTitle:@"返回至上一页面" forState:UIControlStateNormal];
        _secondbtn.titleLabel.font=[UIFont systemFontOfSize:20];
        [_secondbtn addTarget:self action:@selector(secondBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _secondbtn;
}

-(void)secondBtnClick
{
    //单例反向传值
//    [Instance sharedInstace].str=self.TextField.text;
    //沙盒反向传值
//    [[NSUserDefaults standardUserDefaults]setObject:@" i am back" forKey:@"2"];
//    [[NSUserDefaults standardUserDefaults]synchronize];
    //代理传值
    //  [self.delegate PassValue:_TextField.text];
    //block反向传值。     
   // self.block(_TextField.text);
    [[NSNotificationCenter defaultCenter]postNotificationName:@"notify" object:nil userInfo:@{@"not":self.TextField.text}];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
