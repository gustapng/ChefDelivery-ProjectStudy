//
//  StoreDetailView.swift
//  ChefDelivery-ProjectStudy
//
//  Created by Gustavo Ferreira dos Santos on 02/01/25.
//

import SwiftUI

struct StoreDetailView: View {

    let store: StoreType
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedProduct: ProductType?

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Image(store.headerImage)
                    .resizable()
                    .scaledToFit()

                HStack {
                    Text(store.name)
                        .font(.title)
                        .bold()

                    Spacer()

                    Image(store.logoImage)
                }
                .padding(.vertical, 8)
                .padding(.horizontal)

                HStack {
                    Text(store.location)
                    
                    ForEach(1...store.stars, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                            .font(.caption)
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal)

                Text("Produtos")
                    .font(.title2)
                    .bold()
                    .padding()

                ForEach(store.products) { product in

                    Button {
                        selectedProduct = product
                    } label: {
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
                    .padding()
                    .foregroundColor(.black)
                    }
                .sheet(item: $selectedProduct) { product in
                    ProductDetailView(product: product)
                }
            }
            .navigationTitle(store.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar() {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "cart")
                            
                            Text("Lojas")
                        }
                        .foregroundColor(Color("ColorRed"))
                    }

                }
            }
        }
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
