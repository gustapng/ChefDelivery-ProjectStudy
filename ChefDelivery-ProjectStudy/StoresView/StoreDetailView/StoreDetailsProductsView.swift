//
//  StoreDetailsProductsView.swift
//  ChefDelivery-ProjectStudy
//
//  Created by Gustavo Ferreira dos Santos on 12/01/25.
//

import SwiftUI

struct StoreDetailsProductsView: View {

    let products: [ProductType]
    @State private var selectedProduct: ProductType?

    var body: some View {
        VStack(alignment: .leading) {
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding()

            ForEach(products) { product in

                Button {
                    selectedProduct = product
                } label: {
                    StoreDetailsProductItemView(product: product)
                }
                .padding()
                .foregroundColor(.black)
                }
            .sheet(item: $selectedProduct) { product in
                ProductDetailView(product: product)
            }
        }
    }
}

#Preview {
    StoreDetailsProductsView(products: storesMock[0].products)
}
