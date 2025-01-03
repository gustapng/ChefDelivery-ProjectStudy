//
//  StoresContainerView.swift
//  ChefDelivery-ProjectStudy
//
//  Created by Gustavo Ferreira dos Santos on 09/07/24.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                        
            VStack(alignment: .leading, spacing: 30 ) {
                ForEach(storesMock) { mock in
                    NavigationLink {
                        StoreDetailView(store: mock)
                    } label: {
                        StoreItemView(store: mock)
                    }
                }
            }
            .foregroundColor(.black)
        }
        .padding(20)
    }
}

struct StoresContainerView_Preview: PreviewProvider {
    static var previews: some View {
        StoresContainerView()
                .previewLayout(.sizeThatFits)
    }
}
