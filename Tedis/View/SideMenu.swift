//
//  Menu.swift
//  Tedis
//
//  Created by JoRakuten on 2021/05/01.
//

import SwiftUI

struct SideMenu: View {
    @StateObject var sideMenuVM = SideMenuVM()

    var body: some View {
        VStack {
            Divider()
            List {
                ForEach(Array(sideMenuVM.redisMenuList.keys), id: \.self) { serverName in
                    HStack {
                        Text(serverName).font(.title3).foregroundColor(.gray)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    ForEach(1...sideMenuVM.redisMenuList[serverName]!, id: \.self) {
                        Label("DB\($0-1)", systemImage: "square.stack.3d.up.fill")
                    }
                }
            }
            .listStyle(SidebarListStyle())
            VStack(alignment: .leading) {
                Divider()
                Image(systemName: "plus")
                    .padding([.leading, .bottom], 8.0)
                    .padding(.top, 1.0)
            }
        }
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}
