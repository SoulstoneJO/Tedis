//
//  RedisModule.swift
//  Tedis
//
//  Created by JoRakuten on 2021/05/16.
//

import Foundation
import RediStack
import Combine

class RedisModule: ObservableObject {
    static let shared = RedisModule()

    @Published var connectionDict = [String: RedisConnection]()

    func addConnection(_ connection: RedisConnection, _ databaseName: String) {
        DispatchQueue.main.async {
            self.connectionDict.updateValue(connection, forKey: databaseName)
        }
    }

    func getCurrentConnectionByName(by name: String) -> RedisConnection {
        return connectionDict[name]!
    }

}
