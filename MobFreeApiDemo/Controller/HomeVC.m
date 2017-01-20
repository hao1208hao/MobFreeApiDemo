//
//  HomeVC.m
//  MobFreeApiDemo
//
//  Created by haohao on 17/1/20.
//  Copyright © 2017年 haohao. All rights reserved.
//

#import "HomeVC.h"
#import "QueryInfo.h"

@interface HomeVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *apiTableView;
//@property (nonatomic, strong) NSString *selectedTitle;

/**
 *  cell 显示的 Api 分类接口标题
 */
@property (nonatomic, strong) NSArray *cellTitlesArray;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"免费API";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setupSubviews];
    
}

#pragma mark - UITableView datasource
- (void)setupSubviews
{
    if ([MOBFDevice versionCompare:@"7.0"] >= 0)
    {
        self.extendedLayoutIncludesOpaqueBars = YES;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    // 获取在 TableView 上展示的数据
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"MobApi" ofType:@"plist"];
    NSDictionary *plistDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    self.cellTitlesArray = [plistDict  objectForKey:@"titlesArray"];
    
    self.apiTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-49) style:UITableViewStyleGrouped];
    [self.apiTableView setDelegate:self];
    [self.apiTableView setDataSource:self];
    [self.view addSubview:self.apiTableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"常用免费Api";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger cellCount = [self.cellTitlesArray count];
    return cellCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifierStr = @"apiCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierStr];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifierStr];
    }
    // 设置每个 section下面对应cell 的标题
    cell.textLabel.text = self.cellTitlesArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //self.selectedTitle = self.cellTitlesArray[indexPath.row];
    NSString* selectedTitle = self.cellTitlesArray[indexPath.row];
    
    QueryInfo* queryVC = [[QueryInfo alloc]init];
    queryVC.showTitle = selectedTitle;
    
    if (indexPath.row == 0) {
        //手机号码归属地查询       
        queryVC.queryType = queryTypePhoneBelong;
    }else if(indexPath.row == 1){
        //身份证信息查询
        queryVC.queryType = queryTypeIdCardNo;
    }else if(indexPath.row == 2){
        //银行卡信息查询
        queryVC.queryType = queryTypeBankCardNo;
    }else if(indexPath.row == 3){
        //身体部分健康查询
        queryVC.queryType = queryTypeBodyHealth;
    }
    
    [self.navigationController pushViewController:queryVC animated:YES];
    
    
    
}

@end
