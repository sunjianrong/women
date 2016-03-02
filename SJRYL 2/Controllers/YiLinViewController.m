//
//  YiLinViewController.m
//  SJRYL
//
//  Created by MS on 16-2-25.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "YiLinViewController.h"
#import "YiLinView.h"
#import "HeartView.h"
#import "HorizontalView.h"
#import "GrowView.h"
#import "ArtView.h"
#import "HappyLifeView.h"
#import "AFNetworking.h"
#import "YiLinModel.h"
#import "YiLinCell.h"
#import "SettingViewController.h"
#define YILIN_NEWS_URL  @"http://yl.cms.palmtrends.com/api_v2.php?action=lastest_list&sa=news&offset=1&count=15&uid=10288928&platform=a"

@interface YiLinViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIScrollView *_ScrollView;
       
}
@end

@implementation YiLinViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    self.navigationController.navigationBarHidden=YES;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor yellowColor];
    
    
    [self creatNavBtn];
    [self creatTitleScrollView];
    
    [self creatScrollView];
    
  }



-(void)creatScrollView{
    
    _ScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 94, self.view.frame.size.width, self.view.frame.size.height)];
    
    _ScrollView.contentSize=CGSizeMake(6*self.view.frame.size.width, self.view.frame.size.height);
    
    _ScrollView.contentOffset=CGPointZero;
    
    _ScrollView.pagingEnabled=YES;
    
    _ScrollView.delegate=self;
    
    [_ScrollView addSubview:[[YiLinView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)]];
    
    [_ScrollView addSubview:[[HeartView alloc]initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)]];
    [_ScrollView addSubview:[[HorizontalView alloc]initWithFrame:CGRectMake(2*self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)]];
    [_ScrollView addSubview:[[GrowView alloc]initWithFrame:CGRectMake(3*self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)]];

    
    [_ScrollView addSubview:[[ArtView alloc]initWithFrame:CGRectMake(4*self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)]];
    
    [_ScrollView addSubview:[[HappyLifeView alloc]initWithFrame:CGRectMake(5*self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)]];

    
    
    [self.view addSubview:_ScrollView];
    
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int n=(scrollView.contentOffset.x/self.view.frame.size.width)+1000;
    
    UIButton *button=(UIButton *)[self.view viewWithTag:n];
    
    self.selectedButton.selected=NO;
    
    button.selected=YES;
    
    
    self.selectedButton=button;
    
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y<0) {
        scrollView.contentOffset=CGPointMake(scrollView.contentOffset.x, 0);
    }else if(scrollView.contentOffset.y>0){
        scrollView.contentOffset=CGPointMake(scrollView.contentOffset.x, 0);
    }
    
    
}
    
    











-(void)creatTitleScrollView{
    

    NSArray *arr=@[@"最新",@"心灵鸡汤",@"视界",@"成长",@"文艺志",@"乐活"];
    
    
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 30)];
    _scrollView.contentOffset=CGPointZero;
    _scrollView.backgroundColor=[UIColor whiteColor];
    _scrollView.contentSize=CGSizeMake(5*(self.view.frame.size.width), 30);
//    NSArray *array=@[@"心灵鸡汤",@"心理测试",@"心灵探秘",@"读心技巧",@"行为剖析"];
    for(int i=0;i<arr.count;i++){
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(i*(self.view.frame.size.width)/5, 0, self.view.frame.size.width/5, 30);
        [button setTitle:[NSString stringWithFormat:@"%@",arr[i]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font=[UIFont systemFontOfSize:16];
        button.tag=200+i;
        if (button.tag==200) {
            button.selected=YES;
            self.selectedButton=button;
        }
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_scrollView addSubview:button];
        
        
    }
    [self.view addSubview:_scrollView];
    
    
}



    
    
    
//
//    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 30)];
//    
//   _scrollView.contentSize=CGSizeMake(arr.count*(self.view.frame.size.width), 30);
//    
//    _scrollView.contentOffset=CGPointZero;
//    
//    _scrollView.pagingEnabled=YES;
//    
//    _scrollView.showsHorizontalScrollIndicator=YES;
//    
//    
//    [self.view addSubview:_scrollView];
//    
//    
//    for(int i=0;i<arr.count;i++){
//        
//        UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
//        
//        button.frame=CGRectMake(i*70, 0, 70, 30);
//        
//        [button setTitle:[NSString stringWithFormat:@"%@",arr[i]] forState:UIControlStateNormal];
//        
//        button.tag=1000+i;
//        button.titleLabel.textAlignment=NSTextAlignmentCenter;
//        button.backgroundColor=[UIColor magentaColor];
//        if (button.tag ==1000) {
//            
//            button.selected = YES;
//            
//            self.selectedButton = button;
//            
//        }
//
//        
//        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [_scrollView addSubview:button];
        


-(void)click:(UIButton *)button{
    self.selectedButton.selected=NO;
    button.selected=YES;
    [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    //    [_scrollview setContentOffset:CGPointMake((button.tag-200)*(self.view.frame.size.width), (self.view.frame.size.height-64-30-49))];
    
    [_scrollView setContentOffset:CGPointMake((button.tag-200)*self.view.frame.size.width, 0) animated:NO];
    
    self.selectedButton=button;
    
}





//-(void)click:(UIButton *)button{
//    
//    
//    self.selectedButton.selected=NO;
//    
//    button.selected=YES;
//    
//    [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
//    
//    
//    
//    [_scrollView setContentOffset:CGPointMake((button.tag-1000)*self.view.frame.size.width, 0) animated:NO];
//    
//    self.selectedButton=button;
//    
//    
//}



-(void)creatNavBtn{
    UIView *Navview=[[UIView alloc]initWithFrame:self.navigationController.navigationBar.frame];
    Navview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"菜单底11 211.png"]];
    [self.view addSubview:Navview];
    
    
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    
    rightButton.frame=CGRectMake((self.view.frame.size.width-30-30), 7, 30, 30);
    
    
    [rightButton setImage:[UIImage imageNamed:@"设置.png"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    
    [Navview addSubview:rightButton];
    
}

-(void)rightClick{
    
    
    SettingViewController *setV=[[SettingViewController alloc]init];
    
    
    [self.navigationController pushViewController:setV animated:YES];
}



-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden=NO;
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
