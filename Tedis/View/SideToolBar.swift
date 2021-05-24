//
//  ToolBar.swift
//  Tedis
//
//  Created by JoRakuten on 2021/05/01.
//

import SwiftUI

struct SideToolBar: View {
    var body: some View {
        Button(action: {toggleSidebar()}, label: {
            Image(systemName: "sidebar.leading")
        })
        Spacer()
    }

    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController
            .toggleSidebar(_:)), with: nil)
    }
}

struct SideToolBar_Previews: PreviewProvider {
    static var previews: some View {
        SideToolBar()
    }
}
