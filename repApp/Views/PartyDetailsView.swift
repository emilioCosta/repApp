//
//  PartyDetailsView.swift
//  repApp
//
//  Created by Pedro Mota on 03/05/21.
//

import SwiftUI

struct PartyDetailsView: View {
    var party: Party
    
    init(_ party: Party) {
        self.party = party
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                Color(.sRGB, red: 247, green: 247, blue: 247, opacity: 1).ignoresSafeArea()
                VStack(alignment: .center) {
                    Image(party.imageName)
                        .resizable()
                        .frame(height: 250)
                    VStack(alignment: .leading) {
                        Header(party: party)
                        ListItem(
                            icon: Image(systemName: "mappin"),
                            title: "Localização",
                            text: party.location
                        )
                        ListItem(
                            icon: Image(systemName: "text.justifyleft"),
                            title: "Descrição",
                            text: party.description
                        )
                        ListItem(
                            icon: Image(systemName: "text.justifyleft"),
                            title: "Cardápio",
                            text: ". " + party.drinks.joined(separator: "\n. ")
                        )
                        ListItem(
                            icon: Image(systemName: "info.circle"),
                            title: "Informações Adicionais",
                            text: party.additionalInformation
                        )
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    Spacer()
                }
            }
        }
    }
}

struct Header: View {
    var party: Party
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndPriceStack(party: party)
            OwnerAndDateStack(party)
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 32, trailing: 0))
    }
}

struct TitleAndPriceStack: View {
    var party: Party
    @State private var showModal = false
    @State private var hasBought = false

    var body: some View {
        HStack {
            Text(party.name)
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer()
            Button(action: {
                self.showModal.toggle()
            }, label: {
                Text(hasBought ? "Ticket" : "R$" + String(party.cost))
                    .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .font(.body)
                    .cornerRadius(15)
            })
            .sheet(isPresented: $showModal, content: {
                if hasBought {
                    Text("Compra efetivada!!")
                } else {
                    ConfirmPaymentView(showModal: self.$showModal, hasBought: $hasBought, party: party)
                }
            })
        }
    }
}

struct OwnerAndDateStack: View {
    var party: Party
    
    init(_ party: Party) {
        self.party = party
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Text(party.owner).font(.subheadline)
            Text(party.dateFormatted).font(.subheadline)
        }
    }
}

struct ListItem: View {
    var icon: Image
    var title: String
    var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Label(
                title: { Text(title).font(.title3).fontWeight(.bold) },
                icon: { icon }
            ).padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
            Text(text).font(.body)
        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 0))
    }
}

struct PartyDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PartyDetailsView(Party())
            .previewDevice("iPhone 12 Pro")
    }
}
