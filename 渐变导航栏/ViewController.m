//
//  ViewController.m
//  渐变导航栏
//
//  Created by Lemon on 15/12/17.
//  Copyright © 2015年 LemonXia. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];
}
- (IBAction)buttonClick:(id)sender {
    ViewController1 * vc = [[ViewController1 alloc]initWithNibName:@"ViewController1" bundle:nil];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
    
}
- (IBAction)btnClick:(id)sender {
    ViewController2 * vc = [[ViewController2 alloc]initWithNibName:@"ViewController1" bundle:nil];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}



@end
