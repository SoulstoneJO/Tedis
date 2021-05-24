//
//  ConnectService.swift
//  Tedis
//
//  Created by JoRakuten on 2021/05/04.
//
import Foundation
import NIO
import RediStack
import Combine

struct ConnectService {
    static let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)

    static func getConnection(_ redisParam: RedisParam,
                              completion: @escaping (Result<RedisConnection, Error>) -> Void) {
        do {
            try RedisConnection.make(
                configuration: .init(hostname: redisParam.hostname, port: Int(redisParam.port) ?? 6379),
                boundEventLoop: eventLoopGroup.next()
            ).whenComplete({ (result: Result<RedisConnection, Error>) in
                switch result {
                case .success(let connection):
                    completion(.success(connection))
                case .failure:
                    completion(.failure(ConnectionError.error1))
                }
            })
        } catch {
            completion(.failure(ConnectionError.error2))
        }
    }

    // to do to delete
    static func getDatabaseNumber(connection: RedisConnection,
                                  completion: @escaping (Result<Int, Error>) -> Void) {
        var subCommand: ByteBuffer = ByteBuffer()
        var agreement: ByteBuffer = ByteBuffer()
        subCommand.writeString("get")
        agreement.writeString("databases")
        connection.send(command: "CONFIG",
                        with: [RESPValue.bulkString(subCommand), RESPValue.bulkString(agreement)])
            .whenComplete { result in
                switch result {
                case .success(let resp):
                    if let redisNumber: Int = resp.array?[1].int {
                        completion(.success(redisNumber))
                    } else {
                        completion(.failure(ConnectionError.error3))
                    }
                case .failure:
                    completion(.failure(ConnectionError.error3))
                }
            }

    }

}

enum ConnectionError: Error, LocalizedError {
    case error1
    case error2
    case error3

    var errorDescription: String? {
        switch self {
        case .error1:
            return "This is the Error 1."
        case .error2:
            return "This is the Error 2."
        case .error3:
            return "This is the Error 3."
        }
    }
}
