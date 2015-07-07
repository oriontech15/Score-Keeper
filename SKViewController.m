//
//  SKViewController.m
//  Score Keeper
//
//  Created by Justin Smith on 7/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SKViewController.h"

@interface SKViewController () <UITextFieldDelegate>

@end

@implementation SKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) * 2);
    self.scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.scrollView];
	
	self.scoreLabels = [NSMutableArray new];

	[self.scrollView addSubview:[self addScoreView:0]];
	
    self.title = @"Score Keeper";
    
}

- (bool) textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

- (UIView *)addScoreView:(int)index
{
    const CGFloat margin = 3;
    const CGFloat height = 44;
    const CGFloat width = CGRectGetWidth(self.view.frame);
    const CGFloat buttonWidth = (width - (margin * 3)) / 3;
    //View For Controls
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(margin, margin, CGRectGetWidth(self.view.frame), height + (margin * 2))];
    view.backgroundColor = [UIColor grayColor];
    
    //TextField
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(margin, margin, buttonWidth, height)];
    name.borderStyle = UITextBorderStyleRoundedRect;
	name.delegate = self;
	
    [view addSubview:name];
    
	
    //Stepper
    UIStepper *button = [[UIStepper alloc] initWithFrame:CGRectMake(margin * 3 + buttonWidth * 2, 10, buttonWidth, height)];
	button.minimumValue = 0;
	button.maximumValue = 1000;
	button.stepValue = 1;
	button.tag = index;
    [view addSubview:button];
	[button addTarget:self action:@selector(scoreStepperValueDidChange:) forControlEvents:UIControlEventValueChanged];
	
	//Label
	UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(margin * 2 +buttonWidth, margin, buttonWidth, height)];
	score.text = [NSString stringWithFormat:@"%d", (int)button.value];
	score.backgroundColor = [UIColor greenColor];
	[view addSubview:score];
	[self.scoreLabels addObject:score];
	
    return view;
}



- (void)scoreStepperValueDidChange:(id)sender {
	UIStepper *stepper = (UIStepper *)sender;
	NSInteger index = stepper.tag;
	UILabel *label = [self.scoreLabels objectAtIndex:index];
	label.text = [NSString stringWithFormat:@"%d",(int)stepper.value];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
