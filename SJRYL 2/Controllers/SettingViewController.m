//
//  SettingViewController.m
//  SJRYL
//
//  Created by MS on 16-2-25.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "SettingViewController.h"
#import "ViewController.h"
#import "SDImageCache.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    self.view.backgroundColor=[UIColor whiteColor];
}

-(void)creatUI{
    
    UIButton *buttonUp=[UIButton buttonWithType:UIButtonTypeSystem];
    buttonUp.frame=CGRectMake((self.view.frame.size.width-285)/2, 100, 285, 53);
    
    [buttonUp setBackgroundImage:[UIImage imageNamed:@"上底_1.png"] forState:UIControlStateNormal];
    [buttonUp setBackgroundImage:[UIImage imageNamed:@"上底_2.png"] forState:UIControlStateSelected];
    
    [buttonUp setTitle:@"我的收藏" forState:UIControlStateNormal];
    [buttonUp addTarget:self action:@selector(clickUp) forControlEvents:UIControlEventTouchUpInside];
    buttonUp.titleLabel.textAlignment=NSTextAlignmentCenter;
    
    [self.view addSubview:buttonUp];
    
    UIImageView *imageUp=[[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-285)/2+10, 100+13, 27, 27)];
    imageUp.image=[UIImage imageNamed:@"我的收藏.png"];
    
    [self.view addSubview:imageUp];

    
    UIButton *buttonM=[UIButton buttonWithType:UIButtonTypeSystem];
    buttonM.frame=CGRectMake((self.view.frame.size.width-285)/2, 153, 285, 53);
    
    [buttonM setBackgroundImage:[UIImage imageNamed:@"中底_1.png"] forState:UIControlStateNormal];
    [buttonM setBackgroundImage:[UIImage imageNamed:@"中底_1.png"] forState:UIControlStateSelected];

    [buttonM setTitle:@"免责声明" forState:UIControlStateNormal];
    
    buttonM.titleLabel.textAlignment=NSTextAlignmentCenter;
    
    
    [self.view addSubview:buttonM];
    
    UIImageView *imageM=[[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-285)/2+10, 100+13+53, 27, 27)];
    imageM.image=[UIImage imageNamed:@"文章字号.png"];
    
    [self.view addSubview:imageM];

    
    
    
    UIButton *buttonMa=[UIButton buttonWithType:UIButtonTypeSystem];
    buttonMa.frame=CGRectMake((self.view.frame.size.width-285)/2,206, 285, 53);
    [buttonMa setBackgroundImage:[UIImage imageNamed:@"中底_1.png"] forState:UIControlStateNormal];
    [buttonMa setBackgroundImage:[UIImage imageNamed:@"中底_1.png"] forState:UIControlStateSelected];

    
    [buttonMa setTitle:@"分享设置" forState:UIControlStateNormal];
    
    buttonMa.titleLabel.textAlignment=NSTextAlignmentCenter;
    
    [self.view addSubview:buttonMa];
    
    UIImageView *imageMa=[[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-285)/2+10, 100+13+53+53, 27, 27)];
    imageMa.image=[UIImage imageNamed:@"分享设置.png"];
    
    [self.view addSubview:imageMa];

    
    
    
    
    
    UIButton *buttonMb=[UIButton buttonWithType:UIButtonTypeSystem];
    buttonMb.frame=CGRectMake((self.view.frame.size.width-285)/2,206, 285, 53);
    [buttonMb setBackgroundImage:[UIImage imageNamed:@"中底_1.png"] forState:UIControlStateNormal];
    [buttonMb setBackgroundImage:[UIImage imageNamed:@"中底_1.png"] forState:UIControlStateSelected];
    
    
    [buttonMb setTitle:@"用户反馈" forState:UIControlStateNormal];
    
    buttonMb.titleLabel.textAlignment=NSTextAlignmentCenter;
    
       [self.view addSubview:buttonMb];
    UIImageView *imageMb=[[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-285)/2+10, 100+13+53+53, 27, 27)];
    imageMb.image=[UIImage imageNamed:@"用户反馈.png"];
    
    [self.view addSubview:imageMb];
    

    
    
    
    UIButton *buttonMc=[UIButton buttonWithType:UIButtonTypeSystem];
    buttonMc.frame=CGRectMake((self.view.frame.size.width-285)/2,259, 285, 53);
    [buttonMc setBackgroundImage:[UIImage imageNamed:@"中底_1.png"] forState:UIControlStateNormal];
    [buttonMc setBackgroundImage:[UIImage imageNamed:@"中底_1.png"] forState:UIControlStateSelected];
    
    [buttonMc setTitle:@"关于我们" forState:UIControlStateNormal];
    
    buttonMc.titleLabel.textAlignment=NSTextAlignmentCenter;
    
      [self.view addSubview:buttonMc];
    UIImageView *imageMc=[[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-285)/2+10, 100+13+53+53+53, 27, 27)];
    imageMc.image=[UIImage imageNamed:@"关于我们.png"];
    
    [self.view addSubview:imageMc];
    

    
    
    
    UIButton *buttonMd=[UIButton buttonWithType:UIButtonTypeSystem];
    buttonMd.frame=CGRectMake((self.view.frame.size.width-285)/2,312, 285, 53);
    [buttonMd setBackgroundImage:[UIImage imageNamed:@"中底_1.png"] forState:UIControlStateNormal];
    [buttonMd setBackgroundImage:[UIImage imageNamed:@"中底_1.png"] forState:UIControlStateSelected];
    
    [buttonMd setTitle:@"清除缓存" forState:UIControlStateNormal];
    
    [buttonMd addTarget:self action:@selector(clickMd) forControlEvents:UIControlEventTouchUpInside];
    
    buttonMd.titleLabel.textAlignment=NSTextAlignmentCenter;
       [self.view addSubview:buttonMd];

    
    UIImageView *imageMd=[[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-285)/2+10, 100+13+53+53+53+53, 27, 27)];
    imageMd.image=[UIImage imageNamed:@"清除缓存.png"];
    
    [self.view addSubview:imageMd];
    

    
}


-(void)clickUp{
    
    
    ViewController *v=[[ViewController alloc]init];
    
    
    
    [self.navigationController  pushViewController:v animated:YES];
}

-(void)clickMd{
   
    [[SDImageCache sharedImageCache]cleanDisk];
    
     NSLog(@"清除缓存成功");
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
