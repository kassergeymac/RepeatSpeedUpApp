//
//  Store.swift
//  RepeatSpeedUpApp
//
//  Created by kassergey on 27.05.2020.
//  Copyright © 2020 kassergey. All rights reserved.
//

import SwiftUI
import Combine

class Store: ObservableObject {
    
    static let shared = Store()
    
    @Published var filePath: String?

}
