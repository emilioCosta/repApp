//
//  QrCodeView.swift
//  repApp
//
//  Created by Hunter Soares do Carmo on 09/05/21.
//

import SwiftUI

struct QrCodeView: View {
    
    @Binding var showModal: Bool
    var body: some View {
        
        ZStack {
            Color(red: 0.97, green: 0.97, blue: 0.97)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Text("Comprovante").font(.title3).bold()
                    Spacer()
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.orange)
                        .onTapGesture {
                            self.showModal.toggle()
                        }
                }.padding()
                Spacer()
                Image("QR_Code")
                Text("Obrigado por usar o RepApp !").font(.title3).bold()
                Spacer()
                Button(action: { }, label: {
                    Text("Salvar QR code")
                        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .font(.body)
                        .cornerRadius(15)
                })
                Spacer()
                Spacer()
                Spacer()
            }
            
            
        }
    }
}

struct QrCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QrCodeView(showModal: .constant(true))
            .previewDevice("iPhone 12 Pro")
    }
}
