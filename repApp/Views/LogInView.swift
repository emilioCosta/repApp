//
//  LogInView.swift
//  repApp
//
//  Created by Hunter Soares do Carmo on 05/05/21.
//

import SwiftUI

struct LogInView: View {
    var body: some View {
        
        
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
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Ainda não possuo cadastro")
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 1.00, green: 0.60, blue: 0.20))
                }
            }
            
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
            .previewDevice("iPhone 12")
    }
}


