//
//  PhotoCell.swift
//  ShinJoshuaHW7
//
//  Created by JoshuaShin on 11/10/24.
//

import Foundation
import SwiftUI

struct PhotoCell: View {
    let photo: Photo //store the contents of the photo to be rendered
    
    var body: some View {
        NavigationLink(value: photo){
            if let url = URL(string: photo.urls.regular){
                AsyncImage(url: url){
                    image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 160)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(minWidth: 0, maxHeight: .infinity)
                        .frame(height: 150)
                }
            }
        }
    }
}

//#Preview {
//    PhotoCell()
//}
