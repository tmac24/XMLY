//
//  DBManager.h
//  XMLY
//
//  Created by ishop02 on 2020/9/4.
//  Copyright © 2020 happy. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBManager : NSObject

/// 单例模式常规写法
+ (instancetype)sharedSingleton;

/// 打开数据库
- (void)openDB;

/// 更新操作
/// @param name 姓名
/// @param gender 性别
/// @param age 年龄
- (void)updateDBWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age;

@end

NS_ASSUME_NONNULL_END

/**
 FMDB有三个主要的类：

 FMDatabase
 一个FMDatabase对象就代表一个单独的SQLite数据库，用来执行SQL语句

 FMResultSet
 使用FMDatabase执行查询后的结果集

 FMDatabaseQueue
 用于在多线程中执行多个查询或更新，它是线程安全的

 */
