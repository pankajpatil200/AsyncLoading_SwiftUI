//
//  PicsView.swift
//  SwiftUIDemo
//
//  Created by Pankaj Patil on 28/11/2023.
//

import Foundation
import SwiftUI

class PicsViewModel: ObservableObject {
    @Published var picsModel = [PicsModel]()
    
    func loadAPI() {
        guard let url = URL(string: "https://picsum.photos/v2/list") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let modelData = try? JSONDecoder().decode([PicsModel].self, from: data!)
            DispatchQueue.main.sync {
                if let model = modelData {
                    self.picsModel = model
                }
            }
        }.resume()
        
    }
}
