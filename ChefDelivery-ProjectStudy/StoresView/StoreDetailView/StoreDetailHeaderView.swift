//
//  StoreDetailHeaderView.swift
//  ChefDelivery-ProjectStudy
//
//  Created by Gustavo Ferreira dos Santos on 12/01/25.
//

import SwiftUI

struct StoreDetailHeaderView: View {

    let store: StoreType

    var body: some View {
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
        }
    }
}

#Preview {
    StoreDetailHeaderView(store: storesMock[0])
}
