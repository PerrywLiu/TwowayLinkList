//
//  PMNode.m
//  PMLinkList
//
//  Created by LiuPW on 2020/4/8.
//  Copyright © 2020 LiuPW. All rights reserved.
//

#import "PMNode.h"

@implementation PMNode

- (instancetype)initWithElement:(id)element nextPtr:(PMNode*)next prePtr:(nullable PMNode *)pre
{
    self = [super init];
    if (self) {
        self.value = element;
        self.next = next;
        self.pre = pre;
    }
    return self;
}

- (NSString *)description
{
    NSString *des = [NSString stringWithFormat:@"value = %@, next->%p, pre->%p", self.value,self.next,self.pre];
    NSLog(@"%@",des);
    return des;
}
@end
