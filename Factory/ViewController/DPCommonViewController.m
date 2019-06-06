//
//  DPCommonViewController.m
//  WisdomTree
//
//  Created by 麻小亮 on 2018/12/20.
//  Copyright © 2018 able-elec. All rights reserved.
//

#import "DPCommonViewController.h"
#import "UITableView+DPCategory.h"

@implementation DPCommonTableViewModel

@end

@implementation DPCommonCollectionViewModel

@end

@interface DPCommonViewController ()

@end

@implementation DPCommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_11_0
    self.automaticallyAdjustsScrollViewInsets = NO;
#endif
    
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self conformsToProtocol:@protocol(DPCommonNavigationProtocol)]) {
        [self commonSetupNavigationView];
    }
    if ([self conformsToProtocol:@protocol(DPCommonTableViewProtocol)]) {
        [self commonSetupTableView];
    }
    if ([self conformsToProtocol:@protocol(DPCommonCollectionViewProtocol)]) {
        [self commonSetupCollectionView];
    }
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)setSwipeCanPop:(BOOL)swipeCanPop{
    _swipeCanPop = swipeCanPop;
    self.navigationController.interactivePopGestureRecognizer.enabled = swipeCanPop;
}

- (void)orientationLand:(DPAppOrientation)orientation{
    NSString *orient = [[NSUserDefaults standardUserDefaults] objectForKey:@"supportedInterfaceOrientationsForWindow"];
    BOOL isSame = NO;
    if (orient) {
        DPAppOrientation onr = [orient integerValue];
        if (onr == orientation) {
            isSame = YES;
        }
    }
    if (isSame) return;
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%ld",(long)orientation] forKey:@"supportedInterfaceOrientationsForWindow"];
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val;
        switch (orientation) {
            case DPAppOrientationLandscape:
            {
                val = UIDeviceOrientationLandscapeLeft | UIDeviceOrientationLandscapeRight;
            }
                break;
            case DPAppOrientationProtrait:{
                val = UIDeviceOrientationPortrait;
                break;
            }
            case DPAppOrientationWithOutDown:{
                val = UIDeviceOrientationLandscapeLeft | UIDeviceOrientationLandscapeRight | UIDeviceOrientationPortrait;
                break;
            }
            case DPAppOrientationLeft:{
                val = UIDeviceOrientationLandscapeLeft;
                break;
            }
            default:
                break;
        }
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}


- (void)commonSetupTableView{
    id <DPCommonTableViewProtocol> vc = (id <DPCommonTableViewProtocol>) self;
    SEL sel = NSSelectorFromString(@"commonTableViewModel:");
    DPCommonTableViewModel *model = [DPCommonTableViewModel new];
    if ([self respondsToSelector:sel]) {
        [self performSelectorWithArguments:sel,model];
    }
    Class class;
    if (model.clas.length > 0) {
        class = NSClassFromString(model.clas);
    }
    if (![class isSubclassOfClass:[UITableView class]]) {
        class = [UITableView class];
    }
    UITableViewStyle style = model.style;
    
    UITableView *tableView = [class tableViewStyle:style];
    
    tableView.makeChain
    .adJustedContentIOS11()
    .dataSource(vc)
    .delegate(vc)
    .separatorStyle(UITableViewCellSeparatorStyleNone);
    
    vc.tableView = tableView;
    UIView *view = self.view;
    SEL sel1 = NSSelectorFromString(@"comonTableViewSuperView");
    if ([self respondsToSelector:sel1]) {
        view = [self performSelectorWithArguments:sel1];
    }
    if (model.tableView) {
        model.tableView(tableView);
    }
    if (view) {
        [view addSubview:tableView];
    }
    
    UIView *topView = nil;
    if ([self conformsToProtocol:@protocol(DPCommonNavigationProtocol)]) {
        topView = [(id <DPCommonNavigationProtocol>) vc navigationBar];
        [self.view bringSubviewToFront:topView];
    }
    
    if (view == self.view && !model.isCustomLayout) {
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (topView) {
                make.top.equalTo(topView.mas_bottom);
            }else{
                make.top.equalTo(self.view.mas_top);
            }
            make.left.bottom.right.mas_offset(0);
        }];
    }
}


- (void)commonSetupCollectionView{
    id <DPCommonCollectionViewProtocol> vc = (id <DPCommonCollectionViewProtocol>) self;
    SEL sel = NSSelectorFromString(@"commonCollectionModel:");
    DPCommonCollectionViewModel *model = [DPCommonCollectionViewModel new];
    if ([self respondsToSelector:sel]) {
        [self performSelectorWithArguments:sel,model];
    }
    UICollectionViewFlowLayout *layout = model.layout;
    if (!layout) {
        layout = [[UICollectionViewFlowLayout alloc] init];
    }
    if (model.layoutSetting) {
        model.layoutSetting(layout);
    }
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    
    collectionView.makeChain
    .delegate(vc)
    .dataSource(vc)
    .showsVerticalScrollIndicator(NO)
    .showsHorizontalScrollIndicator(NO)
    .adJustedContentIOS11()
    .backgroundColor([UIColor whiteColor]);

    vc.collectionView = collectionView;
    SEL sel1 = NSSelectorFromString(@"commonCollectionViewSuperView");
    UIView *view = self.view;
    if ([self respondsToSelector:sel1]) {
        view = [self performSelectorWithArguments:sel1];
    }
    if (view) {
        [view addSubview:collectionView];
    }
    UIView *topView = nil;
    if ([self conformsToProtocol:@protocol(DPCommonNavigationProtocol)]) {
        topView = [(id <DPCommonNavigationProtocol>) vc navigationBar];
        [self.view bringSubviewToFront:topView];
    }
    if (view == self.view) {
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (topView) {
                make.top.equalTo(topView.mas_bottom);
            }else{
                make.top.equalTo(self.view);
            }
            make.left.bottom.right.mas_offset(0);
        }];
    }
}



- (void)commonSetupNavigationView{
    DPCommonNavigationBar *bar = [DPCommonNavigationBar new];
    id <DPCommonNavigationProtocol> vc =  (id <DPCommonNavigationProtocol>)self;
    [vc setNavigationBar:bar];
    bar.delegate = vc;
    UIView * view = self.view;
    SEL superSel = NSSelectorFromString(@"commonNavigationViewSuperView");
    if ([self respondsToSelector:superSel]) {
        view = [self performSelectorWithArguments:superSel];
    }
    [view addSubview:bar];
    if (self.view == view) {
        [bar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_offset(0);
            make.height.mas_equalTo(kNaviBarHeight);
        }];
    }
}



- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (NSString *)viewControllerName{
    return self.clasName;
}

- (NSMutableDictionary *)extraInfo{
    if (!_extraInfo) {
        _extraInfo = [NSMutableDictionary dictionary];
    }
    return _extraInfo;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
