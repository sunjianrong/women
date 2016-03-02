//
//  ViewController.m
//  SJRYL
//
//  Created by MS on 16-2-25.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "ViewController.h"
#import "FMDBManager.h"
#import "YiLinCell.h"
#import "YiLinModel.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
    UITableView *_tableView;
    
    NSMutableArray *_dataArray;
    
}
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self creatData];
    [self creatTableView];
    
}

-(void)creatData{
    
    _dataArray=[[FMDBManager shareInstance]select];
    [_tableView reloadData];
}

-(void)creatTableView{
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.delegate=self;
    
    _tableView.dataSource=self;
    
    [self.view addSubview:_tableView];
    
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 100;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YiLinModel *model=_dataArray[indexPath.row];
    
    
    [[FMDBManager shareInstance]deleteWithPageid:model.id];
    
    
    [_dataArray removeObjectAtIndex:indexPath.row];
    
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
