//
//  ViewController.m
//  BurgerMenuNoStoryboard
//
//  Created by Vincent Lee on 11/29/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIViewController *child;
@property (strong, nonatomic) UIButton *menuButton;
@property (strong, nonatomic) UITableView *tableView;
@property BOOL menuOpened;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuOpened = false;
    // Do any additional setup after loading the view, typically from a nib.
    [self setUpTable];
    [self createButton];
    [self createChild];
}

-(void)createButton {
    UIImage *menuImage = [UIImage imageNamed:@"MenuButton"];
    self.menuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.menuButton setImage:menuImage forState:UIControlStateNormal];
    self.menuButton.frame = CGRectMake(16, 81, 50, 50);
    [self.menuButton addTarget:self action: @selector(menuButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.menuButton];
}

-(void)setUpTable {
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(16, 70, self.view.frame.size.height, self.view.frame.size.width)];
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

}

-(void)createChild {
    self.child = [[UIViewController alloc] init];
    self.child.view.backgroundColor = [UIColor redColor];
    self.child.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addChildViewController:self.child];
    self.child.view.frame = self.view.frame;
    [self.view insertSubview:self.child.view belowSubview: self.menuButton];
    [self.child didMoveToParentViewController:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *textArray = [NSArray arrayWithObjects:@"Option 1",@"Option 2",@"Option 3", nil];
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [textArray objectAtIndex:indexPath.row];
    return cell;
    
}

-(void)menuButtonPressed {
    if (self.menuOpened == false) {
        [UIView animateWithDuration:0.5 animations:^{
            self.child.view.frame = CGRectMake(self.view.frame.size.width * 0.8, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.child.view.alpha = 0.3;
        }];
        self.menuOpened = true;
    }
    else {
        [UIView animateWithDuration:0.5 animations:^{
            self.child.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.child.view.alpha = 1.0;
        }];
        self.menuOpened = false;
    }

}


@end
