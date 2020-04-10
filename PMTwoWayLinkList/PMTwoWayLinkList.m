//
//  PMTwoWayLinkList.m
//  PMTwoWayLinkList
//
//  Created by LiuPW on 2020/4/8.
//  Copyright © 2020 LiuPW. All rights reserved.
//

#import "PMTwoWayLinkList.h"
#import "PMNode.h"

#define ELEMENT_NOT_FOUND -1

@interface PMTwoWayLinkList()
{
    NSUInteger _size;
    PMNode *_firstNode;
    PMNode *_lastNode;
}
@end

@implementation PMTwoWayLinkList

- (void)addValue:(id)value atIndex:(NSUInteger)index
{
    if (![self rangeCheckAddIndex:index]) {
        return;
    }
    
    if (index == _size) {
        ///添加元素到最后一个位置
        PMNode *oldLast = _lastNode;
        PMNode *last = [[PMNode alloc]initWithElement:value nextPtr:nil prePtr:oldLast];
        
        if (oldLast == nil) {
            ///添加第一个元素
            _firstNode = last;
            _lastNode = last;
        }
        else
        {
            oldLast.next = last;
            _lastNode = last;
        }
    }
    else
    {
        PMNode *next = [self nodeOfIndex:index];
        PMNode *pre = next.pre;
        PMNode *node = [[PMNode alloc]initWithElement:value nextPtr:next prePtr:pre];
        
        if (pre == nil) {
            _firstNode = node;
        }
        else
        {
            pre.next = node;
        }
        next.pre = node;
    }
    
    _size++;
}

- (id)removeNodeAtIndex:(NSUInteger)index
{
    if (![self rangeCheckIndex:index]) {
        return nil;
    }
    
    PMNode *node = [self nodeOfIndex:index];
    PMNode *pre = node.pre;
    PMNode *next = node.next;
    
    if (pre == nil) {
        _firstNode = next;
    }
    else
    {
        pre.next = next;
    }
    
    if (next == nil) {
        _lastNode = pre;
    }
    else
    {
        next.pre = pre;
    }
    
    _size--;
    return node.value;
}

- (id)objectAtIndex:(NSUInteger)index
{
    if (![self rangeCheckIndex:index]) {
        return nil;
    }
    
    return [self nodeOfIndex:index];
}

- (NSUInteger)indexOfObject:(id)value
{
    PMNode *node = _firstNode;
    if (value == nil) {
        for (int i = 0; i < _size; i++) {
            if (node.value == nil) {
                return i;
            }
            node = node.next;
        }
    }
    else
    {
        for (int i = 0; i < _size; i++) {
            if ([node.value isEqual:value]) {
                return i;
            }
            node = node.next;
        }
    }
    
    return ELEMENT_NOT_FOUND;
}

- (id)setValue:(id)value atIndex:(NSUInteger)index
{
    if (![self rangeCheckIndex:index]) {
        return nil;
    }
    
    PMNode *node = [self nodeOfIndex:index];
    id oldValue = node.value;
    node.value = value;
    
    return oldValue;
}

- (id)getNodeAtIndex:(NSUInteger)index
{
    return [self nodeOfIndex:index];
}

- (NSUInteger)countOfNode
{
    return _size;
}

- (void)print
{
    PMNode *node = _firstNode;
    for (NSUInteger i = 0; i < _size; i++) {
        [node description];
        node = node.next;
    }
    NSLog(@"");
}

#pragma makr - pivate Method
- (PMNode *)nodeOfIndex:(NSInteger)index
{
    if (![self rangeCheckIndex:index]) {
        return nil;
    }
        
    if (index > _size>>1) {
        PMNode *node = _lastNode;
        for (NSUInteger i = _size - 1; i > index; i--) {
            node = node.pre;
        }
        return node;
    }
    else
    {
        PMNode *node = _firstNode;
        for (int i = 0; i < index; i++) {
            node = node.next;
        }
        return node;
    }
}

- (BOOL)rangeCheckIndex:(NSInteger)index
{
    if (index < 0 || index >= _size) {
        return NO;
    }
    return YES;
}

- (BOOL)rangeCheckAddIndex:(NSInteger)index
{
    if (index < 0 || index > _size) {
        return NO;
    }
    return YES;
}

- (void)clear
{
    while (_size > 0) {
        [self removeNodeAtIndex:0];
    }
    
    if (_size == 0) {
        NSLog(@"链表清零");
    }
    else
    {
        NSLog(@"清零失败");
        [self print];
    }
}

@end
