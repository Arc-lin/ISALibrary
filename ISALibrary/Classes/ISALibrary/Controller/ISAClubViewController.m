//
//  ISAClubViewController.m
//  ISALibrary
//
//  Created by Arclin on 16/3/8.
//  Copyright © 2016年 sziit. All rights reserved.
//

#import "ISAClubViewController.h"
#import "ISAClubTool.h"
#import "ISAClubBook.h"
#import "ISAClubBookDetailController.h"

@interface ISAClubViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong,nonatomic) NSMutableArray *books;
@property (nonatomic,copy) NSString *count;

@end

@implementation ISAClubViewController

- (NSMutableArray *)books
{
    if (!_books) {
        _books = [NSMutableArray array];
    }
    return _books;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreData)];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    ISAClubBook *book = self.books[indexPath.row];
    cell.textLabel.text = book.name;
    cell.detailTextLabel.text = book.author;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ISAClubBookDetailController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ClubDetail"];
    dvc.book = self.books[indexPath.row];
    [self.navigationController pushViewController:dvc animated:YES];
    
}

- (void)loadMoreData
{
    
    [ISAClubTool fetchResulyByValue:self.textField.text fromIndex:[NSString stringWithFormat:@"%lu",self.books.count] success:^(NSArray *books) {
        
        [self.tableView footerEndRefreshing];
        
        for (ISAClubBook *b in books) {
            [self.books addObject:b];
        }
        [self.tableView reloadData];
        [MBProgressHUD hideHUD];
        
    } failure:^(NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }
    }];
}

- (IBAction)searchBtnClick:(id)sender {
    
    [self.books removeAllObjects];
    [MBProgressHUD showMessage:@"Searching..."];
    [ISAClubTool fetchResulyByValue:self.textField.text fromIndex:[NSString stringWithFormat:@"%lu",self.books.count] success:^(NSArray *books) {
        
        for (ISAClubBook *b in books) {
            [self.books addObject:b];
        }
        [self.tableView reloadData];
        [MBProgressHUD hideHUD];
        
    } failure:^(NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
