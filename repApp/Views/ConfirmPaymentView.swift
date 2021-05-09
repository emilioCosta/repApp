//
//  ConfirmPaymentView.swift
//  repApp
//
//  Created by Pedro Mota on 07/05/21.
//

import SwiftUI

struct ConfirmPaymentView: View {
    
    
    @Binding var showModal: Bool
    @Binding var hasBought: Bool
    var party: Party
    @State private var isPresentingLogin = false
    @State var selection: Int? = nil

    var body: some View {
        NavigationView {
            VStack (alignment: .center) {
                HStack {
                    Spacer()
                    Text("Confirmação de compra").font(.title3).bold()
                    Spacer()
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.orange)
                        .onTapGesture {
                            self.showModal.toggle()
                        }
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                UserAndPartyDataList(party: party)
                NavigationLink(destination: LogInView(showModal: $showModal, hasBought: $hasBought), tag: 1, selection: $selection, label: {
                    Button(action: {
                        self.selection = 1
                    }, label: {
                        Text("R$ " + String(party.cost))
                            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                            .background(Color.orange)
                            .foregroundColor(Color.white)
                            .font(.body)
                            .cornerRadius(15)
                    })
                })
                Spacer()
            }
            .frame(
                maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                alignment: .center
            )
            .navigationBarTitle("Confirmação de compra")
            .navigationBarHidden(true)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
    }
}

struct Title: View {
    var party: Party

    var body: some View {
        Text(party.name)
            .font(.title2)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 0))
    }
}

struct UserAndPartyDataList: View {
    var party: Party

    var body: some View {
        VStack(alignment: .leading) {
            Title(party: party)
            Item(title: party.dateFormatted, icon: "calendar")
            Item(title: party.location, icon: "mappin")
            Item(title: party.owner, icon: "person.fill")
            Item(title: party.pix, icon: "person.crop.square.fill.and.at.rectangle")
            
        }
        .frame(
            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
            alignment: .leading
        )
    }
}

struct Item: View {
    
    var title: String
    var icon: String
    
    var body: some View {
        VStack {
            Label(
                title: { Text(title) },
                icon: { Image(systemName: icon)
                    .resizable()
                    .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            )
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
    }
}

struct ConfirmPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmPaymentView(showModal: .constant(true), hasBought: .constant(false), party: Party())
            .previewDevice("iPhone 12 Pro")
    }
}
