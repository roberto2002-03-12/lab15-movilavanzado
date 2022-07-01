//
//  Pokemon.swift
//  iOSAppTemplate
//
//  Created by MAC37 on 25/06/22.
//

import Foundation

struct Pokemon: Codable {
     let count: Int?
     let next: String?
     let results: [Result]
 }

 struct Result: Codable {
     let name: String
     let url: String
 }
