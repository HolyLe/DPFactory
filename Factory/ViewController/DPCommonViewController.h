//
//  DPCommonViewController.h
//  WisdomTree
//
//  Created by 麻小亮 on 2018/12/20.
//  Copyright © 2018 able-elec. All rights reserved.
//

#import "DPCommonNavigationBar.h"
NS_ASSUME_NONNULL_BEGIN
//------------------tableView
@interface DPCommonTableViewModel : NSObject
//tableView的类
@property (nonatomic, copy) NSString *  clas;
//tableView的样式
@property (nonatomic, assign) UITableViewStyle  style;
//是否自定义布局
@property (nonatomic, assign) BOOL  isCustomLayout;
//详细设置tableView属性
@property (nonatomic, copy) void (^tableView) (UITableView *tableView);
@end

//协议
@protocol DPCommonTableViewProtocol <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@optional
//设置父视图
- (UIView *)comonTableViewSuperView;
//设置一些属性
- (void)commonTableViewModel:(DPCommonTableViewModel *)model;

@end


//------------------collectionView

@interface DPCommonCollectionViewModel : NSObject

@property (nonatomic, strong) UICollectionViewFlowLayout * layout;

@property (nonatomic, copy) void (^layoutSetting) (UICollectionViewFlowLayout *layout);

@end

@protocol DPCommonCollectionViewProtocol <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView * collectionView;
@optional

- (UIView *)commonCollectionViewSuperView;

- (void)commonCollectionModel:(DPCommonCollectionViewModel *)model;

@end

@protocol DPCommonNavigationProtocol <DPCommonNavigationBarDelegate>

@property (nonatomic, strong) DPCommonNavigationBar * navigationBar;

@optional
- (UIView *)commonNavigationViewSuperView;
@end


typedef NS_ENUM(NSInteger, DPAppOrientation) {
    DPAppOrientationProtrait = 0,//竖向
    DPAppOrientationLeft = 1,
    DPAppOrientationWithOutDown = 2 ,//不向下
    DPAppOrientationLandscape = 3//横向
};

#pragma mark - 基础控制器 -

@interface DPCommonViewController : UIViewController


@property (nonatomic, strong) UINavigationController * rootNavController;

@property (nonatomic, strong, readonly) NSString * viewControllerName;

/**
 是否可以左滑
 */
@property (nonatomic, assign) BOOL swipeCanPop;

/**
 方向
 */
- (void)orientationLand:(DPAppOrientation)orientation;

/**
 额外的信息
 */
@property (nonatomic, strong) NSMutableDictionary * extraInfo;

@end

NS_ASSUME_NONNULL_END
