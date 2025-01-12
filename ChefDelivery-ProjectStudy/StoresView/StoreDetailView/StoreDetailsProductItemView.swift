//
//  StoreDetailsProductItemView.swift
//  ChefDelivery-ProjectStudy
//
//  Created by Gustavo Ferreira dos Santos on 12/01/25.
//

import SwiftUI

struct StoreDetailsProductItemView: View {

    let product: ProductType

    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .bold()

                Text(product.description)
                    .foregroundStyle(.black.opacity(0.5))
                    .multilineTextAlignment(.leading)

                Text("\(product.formattedPrice)")
            }

            Spacer()

            Image(product.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .frame(width: 120, height: 120)
                .shadow(color: .black.opacity(0.5), radius: 20, x: 6, y: 8)
        }
    }
}

#Preview {
    StoreDetailsProductItemView(product: storesMock[0].products[0])
}
