////
////  SecondView.swift
////  Qesh-swift
////
////  Created by Amir Khan on 01/12/2023.
////
//

import SwiftUI
import AVKit
import PhotosUI

struct User : Decodable{
    let id: Int
    let userId: Int
    let title :String
    let completed: Bool
}

struct SecondView: View {
    
    @GestureState private var dragOffset = CGSize.zero
    
    @State private var showVideoSheet = false
    @State private var player: AVPlayer?
    
    var user : [String]? = []
    
    private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Login Successfully!")
                    .background(Color(red: 1, green: 1, blue: 13))
            }
            VStack {
                PrimaryButton(text: "Get Data", callBack: {
                    viewModel.getData()
                })
                
                
//                Button(action: getData) {
//                    Label("Choose video", systemImage: "photo.fill")
//                }
//                .fullScreenCover(isPresented: $showVideoSheet) {
//                    VideoPicker(filter: .videos, limit: 1) { results in
//                        VideoPicker.convertToAVPlayer(fromResults: results) { (player, error) in
//                            if let error = error {
//                                print(error)
//                            }
//                            if let player = player {
//                                self.player = player
//                            }
//                        }
//                    }
//                }
//                
//                if let player = player {
//                    VideoPlayer(player: player)
//                        .onDisappear {
//                            player.pause()
//                        }
//                }
            }.onAppear{
                configuration()
            }
            
        }
    }
}

extension SecondView {
    func configuration() {
        eventObserver()
    }
    
    func eventObserver() {
        viewModel.eventHandler = { event in
            switch event{
            case .loading:
                print("LOADING START")
            case .stopLoading:
                print("LOADING STOP")
            case .success:
                print(viewModel.posts)
            case .error(let error):
                print("ERROR VIEW \(String(describing: error))")
            }
        }
    }
}

//struct VideoPicker: UIViewControllerRepresentable {
//    typealias UIViewControllerType = PHPickerViewController
//    
//    let filter: PHPickerFilter
//    var limit: Int = 0 // 0 == 'no limit'.
//    let onComplete: ([PHPickerResult]) -> Void
//    
//    func makeUIViewController(context: Context) -> PHPickerViewController {
//        var configuration = PHPickerConfiguration()
//        configuration.filter = filter
//        configuration.selectionLimit = limit
//        let controller = PHPickerViewController(configuration: configuration)
//        controller.delegate = context.coordinator
//        return controller
//    }
//    
//    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//    
//    class Coordinator: PHPickerViewControllerDelegate {
//        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//            parent.onComplete(results)
//            picker.dismiss(animated: true)
//        }
//
//        private let parent: VideoPicker
//
//        init(_ parent: VideoPicker) {
//            self.parent = parent
//        }
//    }
//    
//    static func convertToAVPlayer(fromResults results: [PHPickerResult], onComplete: @escaping (AVPlayer?, Error?) -> Void) {
//        guard let result = results.first else {
//            onComplete(nil, "Something happen" as? Error)
//            return
//        }
//        
//        let itemProvider = result.itemProvider
//        print("Item provider tk to aya ha",itemProvider)
//        itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.movie.identifier) { (url, error) in
//            print("Error ha kia kuch", error)
//            if let error = error {
//                onComplete(nil, error)
//                return
//            }
//            print("Nahi ha url ha jani", url)
//            if let url = url {
//                let player = AVPlayer(url: url)
//                onComplete(player, nil)
//            }
//        }
//    }
//}

//#if DEBUG
//#Preview{
//    SecondView()
//}
//#endif
