//
//  ViewController2.m
//  渐变导航栏
//
//  Created by Lemon on 15/12/17.
//  Copyright © 2015年 LemonXia. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height + 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    UIView * footView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.tableView setTableFooterView:footView];
    
    [self.view addSubview:_tableView];
    //导航栏背景色设置:
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    
    //导航栏标题颜色字体大小
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    [self.navigationController.navigationBar setTitleTextAttributes:attrs];
    
    //导航栏左右item
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    //导航栏item字体颜色
    self.navigationController.navigationBar.tintColor = [UIColor redColor];//如果要不同item不同颜色，那么item要带一个自定义按钮，在设置按钮属性
    
    //当前控制器的下一个控制的返回item去掉文字只保留箭头
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.backBarButtonItem = backItem;
    
    //导航栏透明与导航栏底部分割线，如果有图片高为64的话，直接设置图片就可以了，除此之外还可以用代码，这边的例子全部用代码背景色转图片来设置，先设置整个view的背景色为
//    self.view.backgroundColor = [UIColor greenColor];//如果透明看到的就是绿色。然后在分别设置
    
//    [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]] forBarMetrics:UIBarMetricsDefault];
    
//    [self.navigationController.navigationBar setShadowImage:[self imageWithBgColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]]];//这样就是透明的了

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//如果要监听滚动而使导航栏颜色渐变，那么可以在scrollView的代理方法中添加这样的代码

-(void)scrollViewDidScroll:(UIScrollView *)scrollView

{
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:self.tableView.contentOffset.y / 100]] forBarMetrics:UIBarMetricsDefault];
    
}
-(UIImage *)imageWithBgColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"identifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"indexPathRow%ld",(long)indexPath.row];
    return cell;
    
    
}

@end
