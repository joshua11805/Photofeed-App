//
//  PhotoViewModel.swift
//  ShinJoshuaHW7
//
//  Created by JoshuaShin on 11/10/24.
//

import Foundation

class PhotoViewModel: ObservableObject {
    let BASE_URL: String = "https://api.unsplash.com"
    let ACCESS_KEY: String = "w9nzh6IaitkWSGCFjFRKg36VdhdL-j8b555X9elxR7g"
    let PHOTOS_COUNT: Int = 20
    @Published var isLoading: Bool = false
    @Published var photos: [Photo] = []

//    func refresh() async {
//        //invoke a HTTP get request
//        //provide accesskey
//        //use await
//        //warp in a do catch
//        //use JSONDecoder to decode an array of photo from the hTTP data response set it to photos property of yor view model
//        //set is loading to true before invoking the HTTP request, and set isLoading to false after the operation has completed successfully or if an error has been thrown
//        let url = URL(string: "\(BASE_URL)/photos/random?count=\(PHOTOS_COUNT)&client_id=\(ACCESS_KEY)")
//        var urlRequest = URLRequest(url: url!)
//        urlRequest.httpMethod = "GET"
//        isLoading = true
//        do {
//            let (data, _) = try await URLSession.shared.data(for: urlRequest)
//            let decoder = JSONDecoder()
//            let fetchedPhotos = try decoder.decode([Photo].self, from: data)
//            self.photos = fetchedPhotos
//        } catch{
//            print("Error getting images)")
//        }
//
//        isLoading = false
//        
//    }
    func refresh() async {
        DispatchQueue.main.async{
        self.isLoading = true
        }
        let url = URL(string: "\(BASE_URL)/photos/random?count=\(PHOTOS_COUNT)")
//        print("\(BASE_URL)/photos/random?count=\(PHOTOS_COUNT)")
        var urlRequest = URLRequest(url: url!)
        urlRequest.setValue("Client-ID \(ACCESS_KEY)", forHTTPHeaderField: "Authorization")
        print("Client-ID \(ACCESS_KEY)")
        
        do{
            let(data, _) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            let decodedPhotos = try decoder.decode([Photo].self, from: data)
            
            await MainActor.run {
                self.photos = decodedPhotos
                print(decodedPhotos)
                self.isLoading = false
            }
        } catch {
            print("Failed to fetch photos: \(error)")
            await MainActor.run {
                self.isLoading = false
            }
        }
    }
}
