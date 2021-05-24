//
//  SideMenuVM.swift
//  Tedis
//
//  Created by JoRakuten on 2021/05/12.
//

import Foundation
import Combine
import SwiftUI

class SideMenuVM: ObservableObject {
    @Published var redisMenuList = [String: Int]()
    var redisModule = RedisModule.shared

    var subscription = Set<AnyCancellable>()

    init() {
        redisModule.$connectionDict.sink { [unowned self] dict in
            for (name, conn) in dict {
                ConnectService.getDatabaseNumber(connection: conn) { result in
                    switch result {
                    case .success(let number):
                        DispatchQueue.main.async { self.redisMenuList.updateValue(number, forKey: name) }
                    case .failure:
                        DispatchQueue.main.async {
                            // TO DO
                        }
                    }
                }
            }
        }.store(in: &subscription)
    }
}
