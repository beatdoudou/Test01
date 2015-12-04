//
//  ItemViewController.h
//  xinlang
//
//  Created by MS on 15-12-2.
//  Copyright (c) 2015年 doudou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemViewController : UIViewController

-(instancetype)initWithIndex:(NSInteger)index;
@property(nonatomic ,assign)NSInteger index;

@property(nonatomic,strong)UITableView * tabview;


@end
