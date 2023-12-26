//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Pankaj Patil on 28/11/2023.
//

import SwiftUI

struct ContentView: View {
   
    @ObservedObject var picsViewModel: PicsViewModel
    
    var body: some View {
        NavigationView{
            List(picsViewModel.picsModel) { model in
                ListView(model: model)
            }.navigationTitle("Gallery")
                .onAppear(){
                    picsViewModel.loadAPI()
                }
        }
    }
   
}

#Preview {
    ContentView(picsViewModel: PicsViewModel())
}

struct imageView: View {
    var url: String
    var isDetailView: Bool
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image.resizable()
                    .aspectRatio(contentMode: isDetailView ?.fill:.fit)
                    .cornerRadius(isDetailView ?0:20)
                    .shadow(radius: 10)
            } else if phase.error != nil {
                ProgressView()
            } else {
                ProgressView()
            }
        }
    }
}

struct ListView: View {
    var model: PicsModel?
    var body: some View {
        NavigationLink(
            destination: DetailView(url: model?.download_url ?? "")) {
                VStack {
                    imageView(url: model?.download_url ?? "",isDetailView: false)
                    Text(model?.author ?? "")
                        .padding()
                        .font(.system(size: 20))
                    
                }
            }
    }
}

struct DetailView: View {
    var url: String?
    var body: some View {
        imageView(url: url ?? "" ,isDetailView: true).ignoresSafeArea()
    }
}
