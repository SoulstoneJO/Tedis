//
//  ContentView.swift
//  Tedis
//
//  Created by JoRakuten on 2021/05/01.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ZStack {
                Color.themeBackgroundColor
                NavigationView {
                        SideMenu()
                            .frame(minWidth: 218, idealWidth: 218)
                            .toolbar(content: {
                                SideToolBar()
                            })
                        Window()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar(content: {
                                MainToolBar()
                            })
                }
        }.frame(minWidth: 927, minHeight: 573, alignment: .bottom).background(Color.gray)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
