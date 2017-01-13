//
//  HXDemoViewController.m
//  黄轩博客 blog.libuqing.com
//
//  Created by 黄轩 on 16/1/14.
//  Copyright © 2016年 IT小子. All rights reserved.
//

#import "HXDemoViewController.h"

#import "HXAddImageViewController.h"

#import "HXDemoCurrencyCell.h"

@interface HXDemoViewController ()

@end

@implementation HXDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    [self.tableview registerNib:[UINib nibWithNibName:@"HXDemoCurrencyCell" bundle:nil] forCellReuseIdentifier:@"HXDemoCurrencyCell"];
}

#pragma mark - cellDataSource

- (NSArray *)cellDataSource {
    
    if (!self.dataSource) {
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:4];
        
        NSMutableArray *subarr = nil;
        NSDictionary *dict = nil;
        
        //section 0
        subarr = [NSMutableArray arrayWithCapacity:1];
        dict =  @{@"class":HXDemoCurrencyCell.class,
                  @"height":@([HXDemoCurrencyCell getCellFrame:nil]),
                  @"data":[HXDemoCurrencyCellModel ittemModelWithTitle:@"单张图片上传示例"],
                  @"action":@"uploadData",
                  @"delegate":@YES};
        [subarr addObject:dict];
        [arr addObject:subarr];
        
        //section 1
        subarr = [NSMutableArray arrayWithCapacity:1];
        
        //row 0
        dict =  @{@"class":HXDemoCurrencyCell.class,
                  @"height":@([HXDemoCurrencyCell getCellFrame:nil]),
                  @"data":[HXDemoCurrencyCellModel ittemModelWithTitle:@"去图片上传界面"],
                  @"action":@"gotoAddImageViewController",
                  @"delegate":@YES};
        [subarr addObject:dict];
        
        //row 1
        dict =  @{@"class":HXDemoCurrencyCell.class,
                  @"height":@([HXDemoCurrencyCell getCellFrame:nil]),
                  @"data":[HXDemoCurrencyCellModel ittemModelWithTitle:@"无事件响应"],
                  @"delegate":@YES};
        [subarr addObject:dict];
        
        [arr addObject:subarr];
        
        self.dataSource = arr;
    }
    return self.dataSource;
}

#pragma mark - goto

- (void)gotoAddImageViewController {
    HXAddImageViewController *vc = [HXAddImageViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)uploadData {
    UIImage *image = [UIImage imageNamed:@"ceshi.jpg"];
    NSData *imgData = UIImageJPEGRepresentation(image, 1.0);
    
    [self.uploadManager uploadData:imgData progress:^(float percent) {
        
    } completion:^(NSError *error, NSString *link,NSData *data,NSInteger index) {
        NSLog(@"上传成功 图片地址:%@",link);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
