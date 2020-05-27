//
//  ContentView.swift
//  RepeatSpeedUpApp
//
//  Created by kassergey on 25.04.2020.
//  Copyright © 2020 kassergey. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let delimiter:String.Element = "/"
    let speedUpPlayer = SpeedUpPlayer()
    @ObservedObject var store: Store
    var body: some View {
        VStack {
            Text("File name: \(String(store.filePath?.split(separator: self.delimiter).last ?? ""))")
                .padding(5)
                .lineLimit(3)
                .frame(maxWidth: .infinity, maxHeight: 58, alignment: .topLeading)
            HStack {
                Button(action: {
                    guard let filePath = self.store.filePath else {
                        return
                    }
                    if self.speedUpPlayer.filePath != filePath {
                        self.speedUpPlayer.filePath = filePath
                    }
                    self.speedUpPlayer.play()
                }) {
                    Text("Play")
                }
                Button(action: {
                    self.speedUpPlayer.pause()
                }) {
                    Text("Pause")
                }
                Button(action: {
                    self.speedUpPlayer.stop()
                }) {
                    Text("Stop")
                }
            }
            Spacer()
        }.padding(10).frame(minWidth: 480,
                            idealWidth: 480,
                            maxWidth: .infinity,
                            minHeight: 300,
                            idealHeight: 300,
                            maxHeight: .infinity,
                            alignment: .center)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store())
    }
}
