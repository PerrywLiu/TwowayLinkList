//
//  ViewController.m
//  PMTwoWayLinkList
//
//  Created by LiuPW on 2020/4/8.
//  Copyright © 2020 LiuPW. All rights reserved.
//

#import "ViewController.h"
#import "PMTwoWayLinkList.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self testLinkList];
}

- (void)testLinkList
{
    PMTwoWayLinkList *linkList = [[PMTwoWayLinkList alloc]init];
    [linkList addValue:@"1" atIndex:0];
    [linkList addValue:@"2" atIndex:1];
    [linkList addValue:@"3" atIndex:2];
    [linkList addValue:@"4" atIndex:3];
    [linkList addValue:@"5" atIndex:4];
    [linkList addValue:@"6" atIndex:5];
    [linkList print];
    
    ///修改某个元素
    [linkList setValue:@"4000" atIndex:4];
    [linkList print];
    
    ///添加元素
    [linkList addValue:@"7" atIndex:2];
    [linkList print];
    
    ///查找元素
    NSUInteger index = [linkList indexOfObject:@"7"];
    NSLog(@"found element 7 at index:%ld",index);
    
    ///获取某个索引对应的元素
    id element = [linkList getNodeAtIndex:1];
    NSLog(@"index 1 element is :%@",element);
    
    ///删除元素
    [linkList print];
    element = [linkList removeNodeAtIndex:0];
    NSLog(@"删除索引为 0 的元素为：%@",element);
    [linkList print];
    
    [linkList print];
    element = [linkList removeNodeAtIndex:3];
    NSLog(@"删除索引为 3 的元素为：%@",element);
    [linkList print];
    
    ///获取对应的元素
    element = [linkList objectAtIndex:3];
    NSLog(@"3 对应的元素为：%@",element);
    
    ///获取元素个数
    NSLog(@"一共有 %ld 个元素",[linkList countOfNode]);
    [linkList print];
}
@end
