//
//  TableViewController.m
//  BurgerMenu
//
//  Created by Vincent Lee on 11/25/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (assign, nonatomic) IBOutlet UIButton *menuButton;
@property (assign, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIViewController *childViewController;
@property BOOL menuOpened;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuOpened = NO;
    self.tableView.dataSource = self;
    [self createChild];
}

-(void)createChild {
    self.childViewController = [[[UIViewController alloc] init] autorelease];
    self.childViewController.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:self.childViewController];
    self.childViewController.view.frame = self.view.frame;
    [self.view insertSubview:self.childViewController.view belowSubview:self.menuButton];
    [self.view insertSubview:self.tableView belowSubview:self.childViewController.view];
    [self.childViewController didMoveToParentViewController:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)menuButtonPressed:(id)sender {
    if (self.menuOpened == NO) {
        [UIView animateWithDuration:0.5 animations:^{
            self.childViewController.view.frame = CGRectMake(self.view.frame.size.width * 0.8, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.childViewController.view.alpha = 0.3;
            self.menuOpened = YES;
        }];
    }
    else {
        [UIView animateWithDuration:0.5 animations:^{
            self.childViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.childViewController.view.alpha = 1.0;
            self.menuOpened = NO;
        }];
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"REUSE_CELL" forIndexPath:indexPath];
    NSArray *textArray = [NSArray arrayWithObjects:@"Option 1",@"Option 2",@"Option 3", nil];
    cell.textLabel.text = [textArray objectAtIndex:indexPath.row];
    cell.backgroundView = [[CoreGraphicBackground alloc] init];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(void)dealloc {
    [super dealloc];
    [_childViewController release];
}


@end
