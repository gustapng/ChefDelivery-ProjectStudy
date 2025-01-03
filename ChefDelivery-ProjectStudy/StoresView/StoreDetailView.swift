//
//  StoreDetailView.swift
//  ChefDelivery-ProjectStudy
//
//  Created by Gustavo Ferreira dos Santos on 02/01/25.
//

import SwiftUI

struct StoreDetailView: View {

    let store: StoreType

    var body: some View {
        Text(store.name)
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
