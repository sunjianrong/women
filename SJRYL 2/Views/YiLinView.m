//
//  YiLinView.m
//  SJRYL
//
//  Created by MS on 16-2-25.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "YiLinView.h"
#import "YiLinCell.h"
#import "YiLinModel.h"
#import "AFNetworking.h"

#import "YiLinDetailViewController.h"
#import "AppDelegate.h"
#define YILIN_NEWS_URL  @"http://yl.cms.palmtrends.com/api_v2.php?action=lastest_list&sa=news&offset=1&count=15&uid=10288928&platform=a"

@implementation YiLinView
{
    
    
    UITableView *_tableView;
    
    NSMutableArray *_dataArray;

    AppDelegate *_delegate;
}
-(id)initWithFrame:(CGRect)frame{
    
    
    if (self=[super initWithFrame:frame]) {
        
        self.backgroundColor=[UIColor whiteColor];
        
        [self creatTableView];
        
        [self creatData];

        _delegate=[UIApplication sharedApplication].delegate;

    }
    
    return self;
}


-(void)creatTableView{
    
    _tableView=[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.rowHeight=100;
    [self addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YiLinCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (!cell) {
        cell=[[YiLinCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    
    
    YiLinModel *model=_dataArray[indexPath.row];
    
    [cell configCellWithModel:model];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YiLinModel *model=_dataArray[indexPath.row];
    
    YiLinDetailViewController *yilin=[[YiLinDetailViewController alloc]init];
    
    yilin.idd=model.id;

    NSLog(@"%@",yilin.idd);
    
    yilin.model=model;
    
    
    NSLog(@"%@",model);
    
    [_delegate.root presentViewController:yilin animated:NO completion:^{
        
    }];
    
    
    
}




-(void)creatData{
    
    _dataArray=[[NSMutableArray alloc]init];
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:YILIN_NEWS_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rootDic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSArray *array=rootDic[@"list"];
        
        for (NSDictionary *subDic in array) {
            
            
            YiLinModel *model=[[YiLinModel alloc]init];
            
            [model setValuesForKeysWithDictionary:subDic];
            [_dataArray addObject:model];
        }
        
        [_tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    
}




@end
