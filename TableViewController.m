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
@property (strong, nonatomic) UIViewController *childView;
@property BOOL menuOpened;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuOpened = NO;
    self.childView = [[[UIViewController alloc] init] autorelease];
    self.childView.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:self.childView];
    self.childView.view.frame = self.view.frame;
    [self.view insertSubview:self.childView.view belowSubview:self.menuButton];
    [self.view insertSubview:self.tableView belowSubview:self.childView.view];
    [self.childView didMoveToParentViewController:self];
    
    self.tableView.dataSource = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)menuButtonPressed:(id)sender {
    if (self.menuOpened == NO) {
        [UIView animateWithDuration:0.5 animations:^{
            self.childView.view.frame = CGRectMake(self.view.frame.size.width * 0.8, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.childView.view.alpha = 0.3;
            self.menuOpened = YES;
        }];
    }
    else {
        [UIView animateWithDuration:0.5 animations:^{
            self.childView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.childView.view.alpha = 1.0;
            self.menuOpened = NO;
        }];
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"REUSE_CELL" forIndexPath:indexPath];
    NSArray *textArray = [NSArray arrayWithObjects:@"Option 1",@"Option 2",@"Option 3", nil];
    cell.textLabel.text = [textArray objectAtIndex:indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(void)dealloc {
    [super dealloc];
    [_childView release];
}


@end
