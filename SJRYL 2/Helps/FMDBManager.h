//
//  FMDBManager.h
//  SJRYL
//
//  Created by MS on 16-2-25.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
@interface FMDBManager : NSObject
{
    FMDatabase *_database;
    
    
}

+(instancetype)shareInstance;
/*!
 插入数据方法
 */
-(void)insertIntoWithIcon:(NSString *)icon Title:(NSString *)title Des:(NSString *)des Pageid:(NSString *)pageid;
/*!
 删除数据
 */
-(void)deleteWithPageid:(NSString *)pageid;

/*!
 查找,看是否被收藏过
 */
-(BOOL)selectWithPageid:(NSString *)pageid;

/*!
 统计收藏个数
 */
-(NSMutableArray *)select;


@end
