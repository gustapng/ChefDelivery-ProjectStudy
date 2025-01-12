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

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {

                StoreDetailHeaderView(store: store)
                StoreDetailsProductsView(products: store.products)
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
