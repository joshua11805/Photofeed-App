//
//  PhotoNavContainer.swift
//  ShinJoshuaHW7
//
//  Created by JoshuaShin on 11/10/24.
//

import SwiftUI

struct PhotoNavContainer: View {
    var body: some View {
        NavigationStack{
            PhotoGridPage()
                .navigationDestination(for: Photo.self) { photo in
                    PhotoDetailPage(photo: photo)
                }
        }
    }
}

#Preview {
    PhotoNavContainer()
}


