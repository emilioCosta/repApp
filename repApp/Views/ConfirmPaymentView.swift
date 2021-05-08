//
//  ConfirmPaymentView.swift
//  repApp
//
//  Created by Pedro Mota on 07/05/21.
//

import SwiftUI

struct ConfirmPaymentView: View {
    
    @Binding var showModal: Bool
    
    var body: some View {
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
            UserAndPartyDataList()
            Button(action: {}, label: {
                Text("R$29,99")
                    .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .font(.body)
                    .cornerRadius(15)
            })
            Spacer()
        }
        .frame(
            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
            alignment: .center
        )
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

//struct ViewHeader: View {
//
//    var showModal: Bool
//
//    var body: some View {
//        HStack {
//            Spacer()
//            Text("Confirmação de compra").font(.title3).bold()
//            Spacer()
//            Image(systemName: "xmark")
//                .resizable()
//                .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .foregroundColor(.orange)
//                .onTapGesture {
//                    self.showModal.toggle()
//                }
//        }
//        .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
//    }
//}

struct Title: View {
    var body: some View {
        Text("Nome da festa")
            .font(.title2)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 0))
    }
}

struct UserAndPartyDataList: View {
    var body: some View {
        VStack(alignment: .leading) {
            Title()
            Item(title: "14/06/1998", icon: "calendar")
            Item(title: "Lorem Ipsum Localização, 132022", icon: "mappin")
            Item(title: "John Doe", icon: "person.fill")
            Item(title: "55.555.555-55", icon: "person.crop.square.fill.and.at.rectangle")
            
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
        ConfirmPaymentView(showModal: .constant(true))
            .previewDevice("iPhone 12 Pro")
    }
}
