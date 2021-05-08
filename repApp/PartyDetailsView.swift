//
//  PartyDetailsView.swift
//  repApp
//
//  Created by Pedro Mota on 03/05/21.
//

import SwiftUI

struct PartyDetailsView: View {
    var body: some View {
        ScrollView {
            ZStack {
                Color(.sRGB, red: 247, green: 247, blue: 247, opacity: 1).ignoresSafeArea()
                VStack(alignment: .center) {
                    Image("party")
                        .resizable()
                        .frame(height: 250)
                    VStack(alignment: .leading) {
                        Header()
                        ListItem(
                            icon: Image(systemName: "mappin"),
                            title: "Localização",
                            text: "Sed ut perspiciatis, unde omnis iste natus"
                        )
                        ListItem(
                            icon: Image(systemName: "text.justifyleft"),
                            title: "Descrição",
                            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                        )
                        ListItem(
                            icon: Image(systemName: "text.justifyleft"),
                            title: "Cardápio",
                            text: ". Lorem ipsum dolor sit amet\n. Consectetur adipiscing elit\n. Sed do eiusmod tempor incididunt\n. Ut labore et dolore magna aliqua"
                        )
                        ListItem(
                            icon: Image(systemName: "info.circle"),
                            title: "Informações Adicionais",
                            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip."
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
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndPriceStack()
            OwnerAndDateStack()
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 32, trailing: 0))
    }
}

struct TitleAndPriceStack: View {
    
    @State private var showModal = false
    
    var body: some View {
        HStack {
            Text("Esquenta WWDC")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer()
            Button(action: {
                self.showModal.toggle()
            }, label: {
                Text("R$29,99")
                    .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .font(.body)
                    .cornerRadius(15)
            })
            .sheet(isPresented: $showModal, content: {
                ConfirmPaymentView(showModal: self.$showModal)
            })
        }
    }
}

struct OwnerAndDateStack: View {
    var body: some View {
        HStack(spacing: 8) {
            Text("Unidos do Academy").font(.subheadline)
            Text("03/05/2022").font(.subheadline)
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
        PartyDetailsView()
            .previewDevice("iPhone 12 Pro")
    }
}
