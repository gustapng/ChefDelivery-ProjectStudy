//
//  ProductDetailView.swift
//  ChefDelivery-ProjectStudy
//
//  Created by Gustavo Ferreira dos Santos on 08/01/25.
//

import SwiftUI

struct ProductDetailView: View {

    let product: ProductType
    @State private var productQuantity = 1

    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)

            Spacer()

            ProductDetailQuantityView(productQuantity: $productQuantity)

            Spacer()

            ProductDetailButtonView {
                print("produto clicado \(product.name)")
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: storesMock[0].products[0])
    }
}

struct ProductDetailButtonView: View {

    var onButtonPress: () -> Void

    var body: some View {
        Button {
            onButtonPress()
        } label: {
            HStack {
                Image(systemName: "cart")
                Text("Enviar pedido")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color("ColorRed"))
            .foregroundColor(.white)
            .cornerRadius(32)
            .shadow(color: Color("ColorRedDark").opacity(0.5), radius: 10, x: 6, y: 8)
        }
    }
}
