//
//  HomeModelView.swift
//  Qesh-swift
//
//  Created by Amir Khan on 14/12/2023.
//

import Foundation

final class HomeViewModel {
    
    var posts : [PostModel] = []
    var eventHandler : ((_ event: Event) -> Void)? // data binding closure
    
    func getData (){
        self.eventHandler?(.loading)
        APIManager.shared.makeApiRequest(method: .get, path: "todos/1"){ result in
            self.eventHandler?(.stopLoading)
            switch result {
            case .success(let response):
                do{
                    let data  = try decodeModel(type: PostModel.self, from: response)
                    print("SUCCESS ----> \(data))")
                    self.eventHandler?(.success)
                    self.posts.append(data)
                }catch {
                    print("ERROR --> \(error)")
                    self.eventHandler?(.error(error))
                }
                
            case .failure(let error):
                print("ERRor \(error)")
                self.eventHandler?(.error(error))
            }
        }
//        APIManager.shared.makeApiRequest(method: .get, path: "todos") { result in
//            switch result {
//            case .success(let data):
//                do {
////                    let user  = try JSONDecoder().decode([UserModel].self, from: data)
//                    let posts : [PostModel] = try decodeModel(type: [PostModel].self, from: data)
//                    self.posts = posts
//                }catch{
//                    print("Error: --->", error)
//                }
//            case .failure(let error) :
//                print("Error ->", error)
//            }
//        }
    }
}

extension HomeViewModel {
    enum Event {
        case loading
        case stopLoading
        case success
        case error(Error?)
    }
}

