//
//  Photo.swift
//  ShinJoshuaHW7
//
//  Created by JoshuaShin on 11/10/24.
//

import Foundation

struct PhotoUrl: Decodable, Hashable{
    let raw: String
    //base image URL with just photo path
    let full: String
    //photo in jpg format with max dimensions
    //accessing this is not recommended for performance reasons
    let regular: String
    //photo in jpg format with a width of 1080 pixels
    let small: String
    //represents a photo in jpg format with a width of 400 pixels
    let thumb: String
    //photo in jpg format with a width of 200 pixels
}

struct Photo: Decodable, Hashable, Identifiable{
    let id: String
    let urls: PhotoUrl
    
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher){
        hasher.combine(urls)
        hasher.combine(id)
    }
}
