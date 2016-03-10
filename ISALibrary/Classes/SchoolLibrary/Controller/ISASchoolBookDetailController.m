//
//  ISASchoolBookDetailController.m
//  ISALibrary
//
//  Created by sziit on 16/3/8.
//  Copyright © 2016年 sziit. All rights reserved.
//

#import "ISASchoolBookDetailController.h"
#import "ISASchoolBook.h"

@interface ISASchoolBookDetailController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *callNoLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *pageLabel;
@property (weak, nonatomic) IBOutlet UILabel *pressLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;
@property (weak, nonatomic) IBOutlet UILabel *ISBNLabel;
@property (weak, nonatomic) IBOutlet UILabel *IDLabel;

@end

@implementation ISASchoolBookDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text = self.book.title;
    self.authorLabel.text = self.book.author;
    self.callNoLabel.text = self.book.callno;
    self.pageLabel.text = self.book.page;
    self.typeLabel.text = self.book.type;
    self.pressLabel.text = self.book.press;
    self.priceLabel.text = self.book.price;
    self.subjectLabel.text = self.book.subject;
    self.ISBNLabel.text = self.book.isbn;
    self.IDLabel.text = self.book.ID;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
