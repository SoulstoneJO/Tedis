//
//  NewRedisVM.swift
//  Tedis
//
//  Created by JoRakuten on 2021/05/08.
//

import Foundation
import RediStack

class NewRedisVM: ObservableObject {
    @Published var param: RedisParam = RedisParam()
    @Published var showingAlert = false
    @Published var alertMessage = ""
    var redisModule = RedisModule.shared
    var routerMoudle = RouterModule.shared

    func pushConnection() {
        ConnectService.getConnection(param) { result in
            switch result {
            case .success(let response):
                self.redisModule.addConnection(response, self.param.name)
                DispatchQueue.main.async { self.routerMoudle.currentPage = .keyValue }
            case .failure:
                DispatchQueue.main.async {
                    self.showingAlert = true
                    self.alertMessage = "Connection is failed"
                }
            }
        }
    }

    func testConnection() {
        ConnectService.getConnection(param) { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.showingAlert = true
                    self.alertMessage = "Test success"
                }
            case .failure:
                DispatchQueue.main.async {
                    self.showingAlert = true
                    self.alertMessage = "Test failure"
                }
            }
        }
    }

}
