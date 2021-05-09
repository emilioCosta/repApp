//
//  LogInView.swift
//  repApp
//
//  Created by Hunter Soares do Carmo on 05/05/21.
//

import SwiftUI

struct LogInView: View {
    @State var selection: Int? = nil
    @Binding var showModal: Bool
    @Binding var hasBought: Bool

    var body: some View {
        NavigationView {
            
            ZStack {
                
                Color(red: 0.97, green: 0.97, blue: 0.97)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("logo_stroke")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .padding(.bottom, 80)
        
                    CampoInsercaoView(title: "E-mail")
                    CampoSeguroView(title: "Senha")
                    Button(action: {
                        self.hasBought.toggle()
                        //self.showModal.toggle()
                    }) {
                        Spacer()
                        Text("Entrar")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                            .padding(.vertical)
                            
                        Spacer()
                    }
                    .background(Color(red: 1.00, green: 0.60, blue: 0.20))
                    .cornerRadius(25)
                    .padding()
                    
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Esqueci minha senha")
                            .font(.system(size: 14))
                            .foregroundColor(Color(red: 1.00, green: 0.60, blue: 0.20))
                    }
                    .padding(.vertical, 5)
                    NavigationLink(destination: CadastroView(showModal: $showModal, hasBought: $hasBought), tag: 1, selection: $selection, label: {
                        Button(action: {
                            self.selection = 1
                        }) {
                            Text("Ainda não possuo cadastro")
                                .font(.system(size: 14))
                                .foregroundColor(Color(red: 1.00, green: 0.60, blue: 0.20))
                        }
                    })
                }
                
            }
            .navigationBarTitle("Log In")
            .navigationBarHidden(true)
            NavigationLink(destination: EmptyView()) {
                EmptyView()
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView(showModal: .constant(true), hasBought: .constant(false))
            .previewDevice("iPhone 12 Pro")
    }
}


