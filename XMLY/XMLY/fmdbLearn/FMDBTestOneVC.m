//
//  FMDBTestOneVC.m
//  XMLY
//
//  Created by ishop02 on 2020/9/3.
//  Copyright © 2020 happy. All rights reserved.
//

#import "FMDBTestOneVC.h"
#import <FMDB/FMDB.h>
#import "FMStudent.h"

@interface FMDBTestOneVC ()

@end

@implementation FMDBTestOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"FMDBTestOneVC";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createDataBase];
    
    //参考网址
//    https://www.jianshu.com/p/45267dfca32f
}

- (void)createDataBase {
    // 获取数据库文件的路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [docPath stringByAppendingPathComponent:@"student.sqlite"];
    NSLog(@"path = %@",path);
    // 1..创建数据库对象
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    // 2.打开数据库
    if ([db open]) {
        // do something
        NSLog(@"Open database Success");
    } else {
        NSLog(@"fail to open database");
    }
    
//    4.1 使用executeUpdate:方法执行更新
//    // 1.建表操作
//    NSString *createTableSqlString = @"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL)";
//    [db executeUpdate:createTableSqlString];
    
//    // 2.写入数据
//    for (int i=0; i<15; i++) { //15条数据
//        NSString *sql = @"insert into t_student (name, age) values (?, ?)";
//        NSString *name = [NSString stringWithFormat:@"猪八戒 - %d",arc4random()];
//        NSNumber *age = [NSNumber numberWithInt:arc4random_uniform(100)];
//        [db executeUpdate:sql, name, age];
//    }
    
//    // 3.删除数据
//    NSString *sql = @"delete from t_student where id = ?";
//    [db executeUpdate:sql, [NSNumber numberWithInt:2]];

//    // 4.更改数据
//    NSString *sql = @"update t_student set name = '齐天大圣'  where id = ?";
//    [db executeUpdate:sql, [NSNumber numberWithInt:4]];
    
    
//    4.2 使用executeUpdateWithFormat:执行
//     // 使用executeUpdateWithFormat: - 不确定的参数用%@，%d等来占位
//     NSString *sql = @"insert into t_student (name,age) values (%@,%i)";
//     NSString *name = [NSString stringWithFormat:@"孙悟空 - %d",arc4random()];
//     [db executeUpdateWithFormat:sql, name, arc4random_uniform(100)];
    
    
//    4.3 使用 executeUpdate:withParameterDictionary:执行
//    // 使用 executeUpdate:withParameterDictionary:
//    NSString *name = [NSString stringWithFormat:@"玉皇大帝 - %d",arc4random()];
//    NSNumber *age = [NSNumber numberWithInt:arc4random_uniform(100)];
//    NSDictionary *studentDict = [NSDictionary dictionaryWithObjectsAndKeys:name, @"name", age, @"age", nil];
//    [db executeUpdate:@"insert into t_student (name, age) values (:name, :age)" withParameterDictionary:studentDict];
    
    
//    4.4 执行查询操作
    
    // 4.查询
    NSString *sql = @"select id, name, age FROM t_student";
    FMResultSet *rs = [db executeQuery:sql];
    while ([rs next]) {
        int id = [rs intForColumnIndex:3];
        NSString *name = [rs stringForColumnIndex:1];
        int age = [rs intForColumnIndex:2];
        FMStudent *student = [[FMStudent alloc] init];
        student.name = name;
        student.age = age;
        NSLog(@"%@,%d",student.name,student.age);
    }
    
}


@end
