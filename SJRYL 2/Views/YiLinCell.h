//
//  YiLinCell.h
//  SJRYL
//
//  Created by MS on 16-2-25.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YiLinModel.h"
@interface YiLinCell : UITableViewCell

@property (nonatomic,strong)UIImageView *iconView;

@property (nonatomic,strong)UILabel *titleLabel;

@property (nonatomic,strong)UILabel *desLabel;

-(void)configCellWithModel:(YiLinModel *)model;

@end
