//
//  KaleIdosCell.h
//  SJRYL
//
//  Created by MS on 16-2-25.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KaleIdosModel.h"
@interface KaleIdosCell : UITableViewCell

@property (nonatomic,strong)UIImageView *iconView;

@property (nonatomic,strong)UILabel *titleLabel;


-(void)configCellWithModel:(KaleIdosModel *)model;


@end
