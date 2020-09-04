//
//  DBManager.m
//  XMLY
//
//  Created by ishop02 on 2020/9/4.
//  Copyright © 2020 happy. All rights reserved.
//

#import "DBManager.h"
#import <FMDB/FMDB.h>

@interface DBManager()

/// dataBase
@property (nonatomic, strong) FMDatabase *dataBase;

@end

@implementation DBManager

+ (instancetype)sharedSingleton {
    static DBManager *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //不能再使用alloc方法
        //因为已经重写了allocWithZone方法，所以这里要调用父类的分配空间的方法
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}

// 防止外部调用alloc 或者 new
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [DBManager sharedSingleton];
}

// 防止外部调用copy
- (id)copyWithZone:(nullable NSZone *)zone {
    return [DBManager sharedSingleton];
}

// 防止外部调用mutableCopy
- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    return [DBManager sharedSingleton];
}


- (void)openDB {
      //获取Document文件夹下的数据库文件，没有则创建
       NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
       NSString *dbPath = [docPath stringByAppendingPathComponent:@"user.db"];
       NSLog(@"dbPath = %@",dbPath);
       //获取数据库并打开
        self.dataBase = [FMDatabase databaseWithPath:dbPath];
        if (![_dataBase open]) {
           NSLog(@"打开数据库失败");
           return ;
       }

    //创建表（FMDB中只有update和query操作，除了查询其他都是update操作）
    [_dataBase executeUpdate:@"create table if not exists user(name text,gender text,age integer) "];
}

- (void)updateDBWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age {
    //常用方法有以下3种：
    //    - (BOOL)executeUpdate:(NSString*)sql, ...
    //    - (BOOL)executeUpdateWithFormat:(NSString*)format, ...
    //    - (BOOL)executeUpdate:(NSString*)sql withArgumentsInArray:(NSArray *)arguments
    
    
    //插入数据
    BOOL inser = [self.dataBase executeUpdate:@"insert into user values(?,?,?)",name,gender,age];
    if (inser) {
        NSLog(@"数据库更新成功");
    }
    [_dataBase close];
}

@end
