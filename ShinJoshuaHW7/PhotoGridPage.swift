//
//  PhotoGridPage.swift
//  ShinJoshuaHW7
//
//  Created by JoshuaShin on 11/10/24.
//

import SwiftUI

struct PhotoGridPage: View {
    @StateObject var photosViewModel = PhotoViewModel()
    @State var viewDidLoad: Bool = false
    let items = [GridItem(.flexible(minimum: 120)), GridItem(.flexible(minimum: 120))]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            if photosViewModel.isLoading {
                ProgressView()
                    .padding()
            } else{
                LazyVGrid(columns: items, spacing: 10){
                    ForEach(photosViewModel.photos, id: \.id) { photo in PhotoCell(photo: photo)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Unsplash Feed")
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    Task {
                        await photosViewModel.refresh()
                    }
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
        .task{
            if(!viewDidLoad){
                await photosViewModel.refresh()
                viewDidLoad.toggle()
            }
        }
    }
}

#Preview {
    PhotoGridPage()
}
