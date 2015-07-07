//
//  SKViewController.h
//  Score Keeper
//
//  Created by Justin Smith on 7/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKViewController : UIViewController

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) NSMutableArray *scoreLabels;
- (UIView *)addScoreView:(int)index;
- (void)scoreStepperValueDidChange:(id)sender;
@end
