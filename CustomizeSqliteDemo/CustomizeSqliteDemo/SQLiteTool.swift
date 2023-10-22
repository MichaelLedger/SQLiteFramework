//
//  SQLiteTool.swift
//  CustomizeSqliteDemo
//
//  Created by Gavin Xiang on 2023/10/20.
//

import Foundation
//import SQLite3 //system
import SQLiteAmalgamation //custom

class SQLiteTool {
    var dbName: String
    var path = "\(NSHomeDirectory())/Documents" //路径为:主目录/文档
    var dbHandler: OpaquePointer? // 指针
    init(dbname: String) {
        self.dbName = dbname
    }
    
    func openDataBase() {
        let dataPath = "\(path)/\(dbName)"
        let result = sqlite3_open(dataPath, &dbHandler)
        if result != SQLITE_OK {
            print("open data base failed!")
            closeDataBase()
        }
    }
    
    func closeDataBase() {
        sqlite3_close(dbHandler)
        dbHandler = nil
    }
    
    @discardableResult func createTable() -> Bool {
        let sql = "CREATE TABLE HighScore(score INTEGER)"
        let result = sqlite3_exec(dbHandler, sql, nil, nil, nil)
        return result == SQLITE_OK
    }
    
    func insertData() {
        let score = 0
        let sql = "INSERT INTO HighScore(score) VALUES(?)"
        var stmt: OpaquePointer?
        let result = sqlite3_prepare_v2(dbHandler, sql, -1, &stmt, nil)
        if result == SQLITE_OK {
            sqlite3_bind_int(stmt, 1, Int32(score))
            print("insert lines success")
        }
        if sqlite3_step(stmt) != SQLITE_DONE {
            print("failed")
            sqlite3_finalize(stmt)
        }
    }
    
    func update(score: Int) {
        let sql = "UPDATE HighScore SET score=\(score)"
        let result = sqlite3_exec(dbHandler, sql, nil, nil, nil)
        if result != SQLITE_OK {
            print("update failed")
        } else {
            print("update success")
        }
    }
    
    func findHighestScore() -> Int {
        var highScore = 0
        var stmt: OpaquePointer?
        let sql = "SELECT MAX(score) FROM HighScore"
        let result = sqlite3_prepare_v2(dbHandler, sql, -1, &stmt, nil)
        if result == SQLITE_OK {
            if sqlite3_step(stmt) == SQLITE_ROW {
                highScore = Int(sqlite3_column_int(stmt, 0))
            }
        }
        sqlite3_finalize(stmt)
        return highScore
    }
}
