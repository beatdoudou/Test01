//
//  ItemViewController.m
//  xinlang
//
//  Created by MS on 15-12-2.
//  Copyright (c) 2015年 doudou. All rights reserved.
//

#import "ItemViewController.h"

@interface ItemViewController ()<UITableViewDataSource>

@end

@implementation ItemViewController
{
    NSMutableArray * _dataArray;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    _tabview.backgroundColor= [UIColor colorWithRed:arc4random()%255/255.f green:arc4random()%255/255.f blue:arc4random()%255/255.f alpha:1];
    
    _dataArray = [[NSMutableArray alloc]init];
    [self createTableView];

}
-(instancetype)initWithIndex:(NSInteger)index{
    if(self=[super init]){
        _index=index;
    }
    return  self;
}



//创建tableview
-(void)createTableView{

    _tabview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64) style:(UITableViewStylePlain)];
    _tabview.dataSource = self;
    [self.view addSubview:_tabview];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSLog(@"%ld",_index);
    return _index;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"CELLID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%lu", indexPath.row+1];
    
    return  cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
