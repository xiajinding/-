//
//  ViewController1.m
//  渐变导航栏
//
//  Created by Lemon on 15/12/17.
//  Copyright © 2015年 LemonXia. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    

    //添加监听者
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    [self.view addSubview:_tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"identifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
    
}
/**
 *  监听属性值发生改变时回调
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    CGFloat offset = self.tableView.contentOffset.y;
    NSLog(@"offset%f",offset);
    CGFloat delta = offset / 64.f;
    NSLog(@"delta%f",offset);
    self.navigationController.navigationBar.alpha = delta / 5 + 1.f;
}
@end
