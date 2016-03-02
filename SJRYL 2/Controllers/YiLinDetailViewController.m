//
//  YiLinDetailViewController.m
//  SJRYL
//
//  Created by MS on 16-2-25.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "YiLinDetailViewController.h"
#import "FMDBManager.h"
#import "YiLinModel.h"
#define YILIN_INFORMATION_URL @"http://yl.cms.palmtrends.com/api_v2.php?action=article&id=%@&fontsize=m&uid=10288928&e=86587cf27fc31a81ad14c8663854ab94&platform=a&pid=10048"



@interface YiLinDetailViewController ()
{
    
    BOOL _isCollected;
}
@end

@implementation YiLinDetailViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
  [self creatWebView];
    
    [self creatTabBarView];
    
    [self creatNavBtn];
}

-(void)creatNavBtn{
    
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0,20, self.view.frame.size.width, 44)];
    
    view.backgroundColor=[UIColor grayColor];
    
    [self.view addSubview:view];

    
    UIButton *returnButton=[UIButton buttonWithType:UIButtonTypeCustom];
    
    returnButton.frame=CGRectMake(30, 4, 31, 31);
    [returnButton setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    
    [returnButton addTarget:self action:@selector(clickReturn) forControlEvents:UIControlEventTouchUpInside];
    
    
    [view addSubview:returnButton];

    
    
    
    
}

-(void)clickReturn{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}



-(void)creatTabBarView{
    
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-49, self.view.frame.size.width, 49)];
    
    view.backgroundColor=[UIColor grayColor];
    
    [self.view addSubview:view];
    
    
    UIButton *collectButton=[UIButton buttonWithType:UIButtonTypeCustom];
    
    collectButton.frame=CGRectMake(100, 9, 31, 31);
    
    
    
    
    _isCollected=[[FMDBManager shareInstance]selectWithPageid:self.idd];
    
    if (_isCollected==YES) {
        collectButton.selected=YES;
        
    }else{
        
        collectButton.selected=NO;
    }
    //collectButton.selected=_isCollected;
    
    
    
    
    
    [collectButton setImage:[UIImage imageNamed:@"收藏前.png"] forState:UIControlStateNormal];
    
    [collectButton addTarget:self action:@selector(clickCollect:) forControlEvents:UIControlEventTouchUpInside];
    
    [collectButton setImage:[UIImage imageNamed:@"收藏成功.png"] forState:UIControlStateSelected];
    
    [view addSubview:collectButton];
    
    
    
    UIButton *shareButton=[UIButton buttonWithType:UIButtonTypeCustom];
    
   shareButton.frame=CGRectMake(self.view.frame.size.width-100-31, 9, 31, 31);
    [shareButton setImage:[UIImage imageNamed:@"分享.png"] forState:UIControlStateNormal];
    
    [shareButton setImage:[UIImage imageNamed:@"分享1.png"] forState:UIControlStateSelected];
    
    [view addSubview:shareButton];

    
    
    
    
}


-(void)clickCollect:(UIButton *)button{
       if (button.selected==YES) {
        button.selected=NO;
    
           [[FMDBManager shareInstance]deleteWithPageid:self.model.id];
        
        
        
    }else{
        button.selected=YES;
        
        
       
        
        [[FMDBManager shareInstance]insertIntoWithIcon:self.model.icon Title:self.model.title Des:self.model.des Pageid:self.model.id];
        
        
        
    }
    
    
    
    
    
}




-(void)creatWebView{
    
    
    UIWebView *webView=[[UIWebView alloc]initWithFrame:CGRectMake(0,64, self.view.frame.size.width, self.view.frame.size.height-64)];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:YILIN_INFORMATION_URL,self.idd]]];
    
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    
    
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
