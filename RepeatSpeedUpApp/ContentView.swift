//
//  ContentView.swift
//  RepeatSpeedUpApp
//
//  Created by kassergey on 25.04.2020.
//  Copyright © 2020 kassergey. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let delimiter:String.Element = "\\"
    let speedUpPlayer = SpeedUpPlayer()
    @State var filePath: String? {
        didSet {
            speedUpPlayer.stop()
        }
    }
    var body: some View {
        VStack {
            Text("File name: \(String(filePath?.split(separator: self.delimiter).last ?? ""))")
            Button(action: {
                guard let filePath = self.filePath else {
                    return
                }
                self.speedUpPlayer.initialRate = 1
                self.speedUpPlayer.play(filePath: filePath)
            }) {
                Text("Play")
            }
        }.padding().frame(minWidth: 480,
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
        ContentView()
    }
}
