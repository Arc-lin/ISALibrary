//
//  ISASchoolController.m
//  ISALibrary
//
//  Created by Arclin on 16/3/7.
//  Copyright © 2016年 sziit. All rights reserved.
//

#import "ISASchoolController.h"
#import "ISASchoolTool.h"
#import "ISASchoolBook.h"
#import "ISASchoolBookDetailController.h"

@interface ISASchoolController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *books;

@end

@implementation ISASchoolController

- (NSMutableArray *)books
{
    if(!_books){
        _books = [[NSMutableArray alloc] init];
    }
    return _books;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreData)];
    // Do any additional setup after loading the view.
}
#pragma mark - 数据源方法
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
    ISASchoolBook *book = self.books[indexPath.row];
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = book.author;
    return cell;
}

#pragma mark - 点击cell时调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ISASchoolBookDetailController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"SchoolDetail"];
    dvc.book = self.books[indexPath.row];
    [self.navigationController pushViewController:dvc animated:YES];
}

- (void)loadMoreData
{
    [ISASchoolTool fetchResulyByValue:self.textField.text fromIndex:[NSString stringWithFormat:@"%lu",self.books.count] success:^(NSArray *books) {
        [self.tableView footerEndRefreshing];
        for (ISASchoolBook *b in books) {
            [self.books addObject:b];
        }
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }
    }];
}



- (IBAction)searchBtnClick:(id)sender {
    
    [self.books removeAllObjects];
    [MBProgressHUD showMessage:@"Searching..."];
    [ISASchoolTool fetchResulyByValue:self.textField.text fromIndex:[NSString stringWithFormat:@"%lu",self.books.count] success:^(NSArray *books) {
        
        for (ISASchoolBook *b in books) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
