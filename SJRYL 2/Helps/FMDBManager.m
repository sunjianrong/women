//
//  FMDBManager.m
//  SJRYL
//
//  Created by MS on 16-2-25.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "FMDBManager.h"
#import "YiLinModel.h"
@implementation FMDBManager


+(instancetype)shareInstance{
    
    
    static FMDBManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager=[[FMDBManager alloc]init];
    });
    
    return manager;
    
}

-(instancetype)init{
    
    if (self=[super init]) {
        
        _database = [[FMDatabase alloc]initWithPath:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/FFF.db"]];
        
        [_database open];
        //创建表 明确字段
       NSString *creatTableSql=@"create table if not exists collects(id integer primary key autoincrement,icon varchar (256),title varchar (256),des varchar (256),pageid varchar (256))";
        
        if([_database executeUpdate:creatTableSql]){
            
            NSLog(@"创建表成功");
        };
        
        
    }
    
    return self;
    
}


-(void)insertIntoWithIcon:(NSString *)icon Title:(NSString *)title Des:(NSString *)des Pageid:(NSString *)pageid{
    
    
    
    NSString *insertSql=@"insert into collects(icon,title,des,pageid)values(?,?,?,?)";
    
    if ([_database executeUpdate:insertSql,icon,title,des,pageid]) {
        
        NSLog(@"插入数据成功");
        
        
    }
    
    
    
    
}


-(void)deleteWithPageid:(NSString *)pageid{
    
    NSString *deleteSQL=@"delete from collects where pageid=?";
    
    if ([_database executeUpdate:deleteSQL,pageid]) {
        NSLog(@"数据删除成功");
    }
    
}

-(BOOL)selectWithPageid:(NSString *)pageid{
    
    NSString *selectSQL=@"select *from collects where pageid=?";
    
    FMResultSet *set=[_database executeQuery:selectSQL,pageid];
    
    while ([set next]) {
        return YES;
    }
    
    return NO;
    
}


-(NSMutableArray *)select{
    
    NSString *selectSQL=@"select *from collects";
    
    FMResultSet *set=[_database executeQuery:selectSQL];
    
    NSMutableArray *array=[[NSMutableArray alloc]init];
    
    while ([set next]) {
        YiLinModel *model=[[YiLinModel alloc]init];
        
        model.id=[set stringForColumn:@"pageid"];
        
        model.icon=[set stringForColumn:@"icon"];
        
        model.title=[set stringForColumn:@"title"];
        
        model.des=[set stringForColumn:@"des"];
        
        [array addObject:model];
        
    }
    return array;
    
}



@end
