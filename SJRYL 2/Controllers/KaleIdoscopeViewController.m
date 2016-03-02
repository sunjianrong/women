//
//  KaleIdoscopeViewController.m
//  SJRYL
//
//  Created by MS on 16-2-25.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "KaleIdoscopeViewController.h"
#import "KaleIdosModel.h"
#import "AFNetworking.h"
#import "KaleIdosCell.h"
#define KALEIDOSCOPE_LAUGH_URL @"http://yl.cms.palmtrends.com/api_v2.php?action=piclist&sa=laugh&offset=1&count=10&uid=10288928&platform=a"
@interface KaleIdoscopeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView *_tableView;
    
    NSMutableArray *_dataArray;

    
}
@end

@implementation KaleIdoscopeViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    self.navigationController.navigationBarHidden=YES;
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
   [self creatNavBtn];
    
        
    [self creatTableView];
    
    [self creatData];

}



-(void)creatTableView{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.rowHeight=200;
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KaleIdosCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        cell=[[KaleIdosCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    
    KaleIdosModel *model=_dataArray[indexPath.row];
    
    
    [cell configCellWithModel:model];
    
    return cell;
}



-(void)creatData{

    _dataArray=[[NSMutableArray alloc]init];

    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:KALEIDOSCOPE_LAUGH_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSDictionary *rootDic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];

        NSArray *array=rootDic[@"list"];

        for (NSDictionary *subDic in array) {

            KaleIdosModel *model=[[KaleIdosModel alloc]init];
        
            [model setValuesForKeysWithDictionary:subDic];
            
            [_dataArray addObject:model];
            
        }

        [_tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

    }];



}








-(void)creatNavBtn{
    
    UIView *Navview=[[UIView alloc]initWithFrame:self.navigationController.navigationBar.frame];
    Navview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"菜单底11 211.png"]];
    [self.view addSubview:Navview];
    
    

    
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake((self.view.frame.size.width-30-30), 7, 30, 30);
    
    [rightButton setImage:[UIImage imageNamed:@"设置.png"] forState:UIControlStateNormal];
    
    [Navview addSubview:rightButton];
    
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
