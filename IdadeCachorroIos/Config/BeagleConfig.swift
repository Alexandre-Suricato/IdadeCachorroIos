//
//  BeagleConfig.swift
//  IdadeCachorroIos
//
//  Created by Alexandre Lima on 14/08/20.
//  Copyright © 2020 Alexandre Lima. All rights reserved.
//

import Beagle
import Foundation

class BeagleConfig {
    static func config() {
        
        let dependencies = BeagleDependencies()
        dependencies.urlBuilder = UrlBuilder(
            baseUrl: URL(string: "http://localhost")
        )
        Beagle.dependencies = dependencies
    }
}
