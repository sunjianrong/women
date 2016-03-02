//
//  RootViewController.m
//  SJRYL
//
//  Created by MS on 16-2-25.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "RootViewController.h"
#import "YiLinViewController.h"
#import "KaleIdoscopeViewController.h"
#import "ParticipanceViewController.h"
#import "MicroblogViewController.h"


@interface RootViewController ()

@end

@implementation RootViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.tabBar.hidden=YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatViewControllers];
    
    [self creatTabBarUI];
}

-(void)creatTabBarUI{
    UIView *myView=[[UIView alloc]initWithFrame:self.tabBar.frame];
    [self.view addSubview:myView];
    
    NSArray *imageArray=@[@"意林",@"诗画话",@"指谈会",@"微博"];
    
    for (int i=0; i<imageArray.count; i++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(self.view.frame.size.width/4*i, 0, self.view.frame.size.width/4, myView.frame.size.height);
        
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_1",imageArray[i]]] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_2",imageArray[i]]] forState:UIControlStateSelected];
        
        button.tag=i;
        if (button.tag==0) {
            button.selected=YES;
            _selectBtn=button;
        }
        
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        [myView addSubview:button];
        
    }
    
    
    
}

-(void)click:(UIButton *)btn
{
    _selectBtn.selected=NO;
    btn.selected=YES;
    _selectBtn=btn;
    self.selectedIndex=btn.tag;
    
}


    
    
    
    




-(void)creatViewControllers{
    
    YiLinViewController *v1=[[YiLinViewController alloc]init];
    _nav1=[[UINavigationController alloc]initWithRootViewController:v1];
    
    
    KaleIdoscopeViewController *v2=[[KaleIdoscopeViewController alloc]init];
    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:v2];
    
    
    ParticipanceViewController *v3=[[ParticipanceViewController alloc]init];
    UINavigationController *nav3=[[UINavigationController alloc]initWithRootViewController:v3];
    
    
    
    MicroblogViewController *v4=[[MicroblogViewController alloc]init];
    UINavigationController *nav4=[[UINavigationController alloc]initWithRootViewController:v4];
    
    
    self.viewControllers=@[_nav1,nav2,nav3,nav4];
    
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
