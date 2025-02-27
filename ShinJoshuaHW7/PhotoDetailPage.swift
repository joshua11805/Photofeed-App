//
//  PhotoDetailPage.swift
//  ShinJoshuaHW7
//
//  Created by JoshuaShin on 11/10/24.
//

import SwiftUI

struct PhotoDetailPage: View {
    let photo: Photo
    var body: some View {
        PhotoDetailView(url: photo.urls.regular)
    }
}

//#Preview {
//    PhotoDetailPage()
//}
