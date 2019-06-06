//
//  ViewController.m
//  DPFactory
//
//  Created by 麻小亮 on 2019/6/6.
//  Copyright © 2019 麻小亮. All rights reserved.
//

#import "ViewController.h"
#import "DPTimer.h"
#import "DPCoreTextLabel.h"
@interface ViewController ()<DPCommonNavigationProtocol, DPCommonTableViewProtocol>
@property (nonatomic, strong) NSArray * dataSource;
@property (nonatomic, strong)  DPTimer* timer;
@property (nonatomic, strong) DPCoreTextLabel * label;
@end

@implementation ViewController
@synthesize navigationBar = _navigationBar, tableView = _tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.middleButton.makeChain.text(@"自定义tabbar", UIControlStateNormal);
    self.tableView.makeChain.registerCellClass([UITableViewCell class], @"cell");
    __block NSInteger count;
    _timer = [DPTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(DPTimer * _Nonnull timer) {
        count++;
        NSLog(@"%ld",count);
    }];
    [_timer start];
    
    _dataSource = @[
                    @{@"title":@"图文混排",
                      @"class":@"coreTextLabel"},
                    @{@"title":@"图文混排",
                      @"class":@"coreTextLabel"},
                    ];
    
    _label = [DPCoreTextLabel new];
    _label.backgroundColor = [UIColor yellowColor];
    _label.text = @"文字自动可以适应，文字自动可以适应，文字自动可以适应，文字自动可以适应，文字自动可以适应，文字自动可以适应，文字自动可以适应，文字自动可以适应,文字自动可以适应，文字自动可以适应，文字自动可以适应，文字自动可以适应，文字自动可以适应，文字自动可以适应，文字自动可以适应，文字自动可以适应";
    _label.numberOflines = 3;
    _label.truncationString = @"显示更多";
    _label.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
    [self.view addSubview:_label];
    
    _label.truncationClick = ^(DPCoreTextLabel * _Nonnull textLabel) {
        textLabel.numberOflines = 0;
    };
    [_label reloadNewDisplay];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.mas_equalTo(300);
    }];
    // Do any additional setup after loading the view.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row][@"title"];
    return cell;
}


@end
