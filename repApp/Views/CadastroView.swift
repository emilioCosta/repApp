//
//  CadastroView.swift
//  repApp
//
//  Created by Hunter Soares do Carmo on 05/05/21.
//

import SwiftUI

struct CadastroView: View {
    @State private var checkBox: Bool = false
    @Binding var showModal: Bool
    @Binding var hasBought: Bool

    var body: some View {
        NavigationView {
            ZStack {
                
                Color(red: 0.97, green: 0.97, blue: 0.97)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    CampoInsercaoView(title: "Nome")
                    CampoInsercaoView(title: "E-mail")
                    CampoInsercaoView(title: "Confirmar E-mail")
                    CampoSeguroView(title: "senha")
                    CampoSeguroView(title: "confirmar senha")
                    
                    HStack{
                        Toggle(isOn: $checkBox){
                            Text("Concordo com os")
                            .font(.system(size: 14))
                            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                                Text("termos de uso")
                            }
                            .font(.system(size: 14))
                            .foregroundColor(Color(red: 1.00, green: 0.60, blue: 0.20))
                        }.toggleStyle(CheckBoxToggleStyle())
                        Spacer()
                    }.padding(.horizontal)
                    Button(action: {
                        if checkBox {
                            self.hasBought.toggle()
                        }
                    }) {
                        Spacer()
                        Text("Cadastrar")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .font(.system(size: 17))
                            //.fontWeight(.bold)
                        Spacer()
                    }
                    .background(checkBox ? Color(red: 1.00, green: 0.60, blue: 0.20) : .gray)
                    .cornerRadius(25)
                    .padding()
                }
            }
            .navigationBarTitle("Log In")
            .navigationBarHidden(true)
        }
        .navigationBarTitle("Log In")
        .navigationBarHidden(true)
    }
}

struct CadastroView_Previews: PreviewProvider {
    static var previews: some View {
        CadastroView(showModal: .constant(true), hasBought: .constant(false))
            .previewDevice("iPhone 12 Pro")
    }
}

struct CheckBoxToggleStyle: ToggleStyle{
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            Button{
                configuration.isOn.toggle()
            }label: {
                Image(systemName: configuration.isOn ? "largecircle.fill.circle" : "circle")
            }
            .font(.system(size: 14))
            .accentColor(Color(UIColor.label))
            configuration.label
        }
    }
}

