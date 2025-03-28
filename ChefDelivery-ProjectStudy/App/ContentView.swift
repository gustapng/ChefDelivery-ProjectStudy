//
//  ContentView.swift
//  ChefDelivery-ProjectStudy
//
//  Created by Gustavo Ferreira dos Santos on 03/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar()
                    .padding(.horizontal, 15)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView()
                    }
                }
            }
        }
        .onAppear {
            fetchData()
        }
    }

    // MARK: Methods

    func fetchData() {
        guard let url = URL(string: "https://private-1ebe6-chefdelivery27.apiary-mock.com/home") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let storeObjects = try? JSONDecoder().decode([StoreType].self, from: data)
                print(storeObjects)
            }
        }.resume()
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
                .previewLayout(.sizeThatFits)
    }
}
