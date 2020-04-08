//
//  PMTwoWayLinkList.h
//  PMTwoWayLinkList
//
//  Created by LiuPW on 2020/4/8.
//  Copyright © 2020 LiuPW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface PMTwoWayLinkList : NSObject

/// 获取index的节点元素
/// @param index 索引值
- (id)getNodeAtIndex:(NSUInteger)index;

/// 更新index处的节点元素
/// @param value 节点元素
/// @param index 索引
- (id )setValue:(id)value atIndex:(NSUInteger)index;

/// 像链表的index处添加value节点
/// @param value 节点
/// @param index 索引
- (void)addValue:(id)value atIndex:(NSUInteger)index;

/// 删除index对应的节点
/// @param index 节点的索引
- (id)removeNodeAtIndex:(NSUInteger)index;

/// 获取value节点对应的索引
/// @param value 查找的节点元素
- (NSUInteger)indexOfObject:(id)value;

/// 获取index位置对应的节点对象
/// @param index 索引
- (id)objectAtIndex:(NSUInteger)index;

/// 返回节点数量
- (NSUInteger)countOfNode;

- (void)print;


@end

NS_ASSUME_NONNULL_END
