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
//    __block NSInteger count = 0;
//    _timer = [DPTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(DPTimer * _Nonnull timer) {
//        count++;
//        NSLog(@"%ld",count);
//    }];
//    [_timer start];
    
    _dataSource = @[
                    @{@"title":@"图文混排",
                      @"class":@"coreTextLabel"},
                    @{@"title":@"图文混排",
                      @"class":@"coreTextLabel"},
                    ];
//
    _label = [DPCoreTextLabel new];
    _label.backgroundColor = [UIColor yellowColor];
    _label.text = @"文字自动可以适应文字自动可以适应文字自动可以适应文字自动可以适应文字自动可,以适应文字自动可以适应文字自动可以,适应文字自动可以适应,文字自动可以适应文字自动可以,适应文字自动可以适,应文,字自动可以适应文字自,动可以适应文字,自动可以适应文,字自动可以适应文字自动,可,以适应文字自动可以适应文字自动可以适应,文字自动可以适应文字自动可以适应文,字,自动可以适应文字自动可以适应,文字自动可以适应文字自动可,以适应文字自动可,以适应文字自动可以适应文字自动可以适应文字自动,可以适应文字,自动可以适应文,字自动可以适应文字自动可以适,应文字自动可以适应文字自动可以适应文字自动,可以适应文字自动可以适应文字自,动,可以适应文字自动可以适应文字自动可以适应文字自动可以适应";
//    _label.numberOflines = 4;
    NSLog(@"1111");
    _label.truncationString = @"显示更多";
    _label.contentInset = UIEdgeInsetsMake(10, 10, 30, 30);
    [self.view addSubview:_label];
    
    _label.truncationClick = ^(DPCoreTextLabel * _Nonnull textLabel) {
        textLabel.numberOflines = 0;
    };
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.left.right.mas_equalTo(0);
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
