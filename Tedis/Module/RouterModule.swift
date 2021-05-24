//
//  RouterService.swift
//  Tedis
//
//  Created by JoRakuten on 2021/05/08.
//

import Foundation
import RediStack
import Combine

class RouterModule: ObservableObject {
    static let shared = RouterModule()
    @Published var currentPage: Destination
    @Published var currentRedisName: String

    init() {
        currentRedisName = ""
        currentPage = .newRedis
    }

}

enum Destination {
    case newRedis
    case keyValue
    case valueDetail
}
