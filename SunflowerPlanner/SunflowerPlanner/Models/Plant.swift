//
//  Plant.swift
//  SunflowerPlanner
//
//  Created by Sophia Thi on 4/17/26.

//  This is based on the CSV I made of all the icons

import Foundation

// Hashable is useful for selecting plant tracking and comparison
// I use hashes at work to make sure I don't have dupe values
// Hashable is used here for oject comparison purposes
// Ref: https://medium.com/@JoyceMatos/hashable-protocols-in-swift-baf0cabeaebd
struct Plant: Identifiable, Codable, Hashable {
    
    let id: String
    
    var name: String
    var imageName: String
    var attributeHTML: String
    
    init(
        id: String,
        name: String,
        imageName: String,
        attributeHTML: String
    ) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.attributeHTML = attributeHTML
    }
}
