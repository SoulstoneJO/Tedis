//
//  NewRedisWindow.swift
//  Tedis
//
//  Created by JoRakuten on 2021/05/08.
//

import SwiftUI

struct NewRedisWindow: View {
    @StateObject var newRedis = NewRedisVM()
    @EnvironmentObject var router: RouterModule

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.themeNewRedisWindowBackgroundColor)
                .cornerRadius(3)
                .frame(width: 500, height: 309)

            VStack {
                section(fieldName: "Name:", placeHolder: "Redis Server", bindingValue: $newRedis.param.name)
                section(fieldName: "Hostname:", placeHolder: "127.0.0.1", bindingValue: $newRedis.param.hostname)
                section(fieldName: "Port:", placeHolder: "6379", bindingValue: $newRedis.param.port)
                section(fieldName: "Password:", placeHolder: "Optional", bindingValue: $newRedis.param.password)
                HStack {
                    Button("Test connection") {
                        newRedis.testConnection()
                    }.accentColor(.blue)
                    Spacer()
                    Button("Conection") {
                        newRedis.pushConnection()
                    }
                    .accentColor(.blue)
                }.frame(width: 400).padding()
                .alert(isPresented: $newRedis.showingAlert) {
                    Alert(title: Text(newRedis.alertMessage),
                          dismissButton: .default(Text("OK"), action: {
                            newRedis.showingAlert = false
                            newRedis.alertMessage = ""
                          }))
                }
            }.frame(width: 495, height: 300)

        }
    }

    // form section
    func section(fieldName: String, placeHolder: String, bindingValue: Binding<String>) -> some View {
        HStack(alignment: .center) {
            HStack {
                Text(fieldName)
                Spacer()
            }.frame(width: 100)
            TextField(placeHolder, text: bindingValue)
                .frame(width: 300)
        }
    }

}

struct NewRedisWindow_Previews: PreviewProvider {
    static var previews: some View {
        NewRedisWindow()
    }
}
