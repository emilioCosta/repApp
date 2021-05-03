//
//  PartyDetailsView.swift
//  repApp
//
//  Created by Pedro Mota on 03/05/21.
//

import SwiftUI

struct PartyDetailsView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("party")
                .resizable()
                .frame(height: 250)
            VStack {
                Header()
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
    }
}

struct Header: View {
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndPriceStack()
            OwnerAndDateStack()
        }
    }
}

struct TitleAndPriceStack: View {
    var body: some View {
        HStack {
            Text("Porradinha")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer()
            Button(action: {}, label: {
                Text("R$29,99")
                    .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .font(.body)
                    .cornerRadius(15)
            })
        }
    }
}

struct OwnerAndDateStack: View {
    var body: some View {
        HStack(spacing: 8) {
            Text("Uma república ai").font(.subheadline)
            Text("03/05/2022").font(.subheadline)
        }

    }
}

struct PartyDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PartyDetailsView()
            .previewDevice("iPhone 12 Pro")
    }
}
