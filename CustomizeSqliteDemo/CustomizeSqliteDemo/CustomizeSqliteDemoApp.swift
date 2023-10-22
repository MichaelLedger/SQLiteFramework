//
//  CustomizeSqliteDemoApp.swift
//  CustomizeSqliteDemo
//
//  Created by Gavin Xiang on 2023/10/20.
//

import SwiftUI

@main
struct CustomizeSqliteDemoApp: App {
    init() {
        test()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

private extension CustomizeSqliteDemoApp {
    func test() {
        DispatchQueue.global(qos: .background).async {
            let tool = SQLiteTool(dbname: "test")
            tool.openDataBase()
            tool.createTable()
            tool.insertData()
            tool.update(score: 66)
            var highest = tool.findHighestScore()
            print("highest score is \(highest)")
            tool.update(score: 88)
            highest = tool.findHighestScore()
            print("highest score is \(highest)")
            tool.update(score: 100)
            highest = tool.findHighestScore()
            print("highest score is \(highest)")
        }
    }
}
