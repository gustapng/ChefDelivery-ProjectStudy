//
//  ContentView.swift
//  ChefDelivery-ProjectStudy
//
//  Created by Gustavo Ferreira dos Santos on 03/07/24.
//

import SwiftUI

struct ContentView: View {

    // MARK: - Attributes

    private var service = HomeService()
    @State private var storesType: [StoreType] = []
    @State private var isLoading = true

    // MARK: - Attributes

    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                } else {
                    NavigationBar()
                        .padding(.horizontal, 15)

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(stores: storesType)
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await getStores()
            }
        }
    }

    // MARK: - Methods

    func getStores() async {
        do {
            let result = try await service.fetchData()
            switch result {
            case .success(let stores):
                self.storesType = stores
                self.isLoading = false
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
        } catch {
            print(error.localizedDescription)
            self.isLoading = false
        }
    }

    func getStoresWithAlamofire() {
        service.fetchDataWithAlamofire { stores, error in
            print(stores)
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
                .previewLayout(.sizeThatFits)
    }
}
