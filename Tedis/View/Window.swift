//
//  Window.swift
//  Tedis
//
//  Created by JoRakuten on 2021/05/01.
//

import SwiftUI

struct Window: View {
    @EnvironmentObject var router: RouterModule

    var body: some View {
        VStack {
            switch router.currentPage {
            case .newRedis:
                NewRedisWindow()
            case .keyValue:
                KeyValueWindow()
            case .valueDetail:
                ValueDetailWindow()
            }
        }

    }
}

struct Window_Previews: PreviewProvider {
    static var previews: some View {
        Window()
    }
}
