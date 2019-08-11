//
//  QiitaStruct.swift
//  APIPractice
//
//  Created by 優樹永井 on 2019/08/11.
//  Copyright © 2019 com.nagai. All rights reserved.
//

import Foundation

struct QiitaStruct: Codable {
    var title: String
    var user: User
    struct User: Codable {
        var name: String
    }
}
