//
//  PicsModel.swift
//  SwiftUIDemo
//
//  Created by Pankaj Patil on 28/11/2023.
//

import Foundation

struct PicsModel: Codable, Identifiable {
    var id: String?
    var author: String?
    var download_url: String?
    
    enum Codingkeys: String, CodingKey {
       case id
        case author
       case download_url
    }
}

