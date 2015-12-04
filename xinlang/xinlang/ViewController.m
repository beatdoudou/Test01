//
//  ViewController.m
//  xinlang
//
//  Created by MS on 15-12-2.
//  Copyright (c) 2015年 doudou. All rights reserved.
//

#import "ViewController.h"
#import "ItemViewController.h"

#define TITLE @[@"头条",@"娱乐",@"财经",@"科技",@"游戏",@"趣味",@"福利"]

@interface ViewController ()<UIPageViewControllerDataSource>

@end

@implementation ViewController
{
    UIScrollView * _scrollView ;
    UIPageViewController * _pageVC;
    NSInteger _index;
    UIButton * _lastButton;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTopScrollView];
    [self createPageViewController];

}
-(void)createTopScrollView{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)
                   ];
    _scrollView.contentSize = CGSizeMake(60*7, 44);
    _scrollView.backgroundColor = [UIColor brownColor];
    _scrollView.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:_scrollView];
    
    for (int i=0; i<7; i++) {
        UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
        button.frame = CGRectMake(60*i, 20, 60, 44);
        [button setTitle:[NSString stringWithFormat:@"%@",TITLE[i]] forState:(UIControlStateNormal)];
        [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        
        [button setTitleColor:[UIColor grayColor] forState:(UIControlStateSelected)];
        button.tag = 100+i;
        if (button.tag==100) {
            button.selected=YES;
            _lastButton = button;
        }
        [_scrollView addSubview:button];
        [button addTarget:self action:@selector(onClick:) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    
    
}
-(void)onClick:(UIButton*)button{
    if(button.tag>_lastButton.tag){
    
    [_pageVC setViewControllers:@[[self itemByIndex:button.tag-99]] direction:(UIPageViewControllerNavigationDirectionForward) animated:YES completion:nil];
    }else{
        [_pageVC setViewControllers:@[[self itemByIndex:button.tag-99]] direction:(UIPageViewControllerNavigationDirectionReverse) animated:YES completion:nil];

    }
    
    
    if (button==_lastButton) {
        
        
    }else{
        button.selected=YES;
        _lastButton.selected=NO;
        _lastButton=button;
    }

    
}


//创建pageviewcontroller
-(void)createPageViewController{
    
    NSDictionary * dict = @{UIPageViewControllerOptionInterPageSpacingKey:[NSNumber numberWithInt:UIPageViewControllerSpineLocationMin]};
    
    _pageVC = [[UIPageViewController alloc]initWithTransitionStyle:(UIPageViewControllerTransitionStyleScroll) navigationOrientation:(UIPageViewControllerNavigationOrientationHorizontal) options:dict];
    
    _pageVC.dataSource = self;
    
    [self addChildViewController:_pageVC];
    _pageVC.view.frame = CGRectMake(0, 64, [UIScreen mainScreen ].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64);
    
    
    [self.view addSubview:_pageVC.view];
    
    ItemViewController * itemVC = [[ItemViewController alloc]initWithIndex:1];
    [_pageVC setViewControllers:@[itemVC] direction:(UIPageViewControllerNavigationDirectionForward) animated:YES completion:nil];
    
    
    
}
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    ItemViewController * item = (ItemViewController * )viewController;
    _index = item.index;
    _index--;
    if (_index<1) {
        return  nil;
    }

    
    return  [self itemByIndex:_index];
    
   }
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
   
    ItemViewController * item = (ItemViewController * )viewController;
    _index = item.index;
    _index++;
    if (_index >7 ) {
        return  nil;
    }
    
    return [self itemByIndex:_index];
    
    
    
}

-(ItemViewController *)itemByIndex:(NSInteger)index{
    return [[ItemViewController alloc]initWithIndex:index];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
