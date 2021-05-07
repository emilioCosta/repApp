//
//  CampoSeguroView.swift
//  repApp
//
//  Created by Hunter Soares do Carmo on 05/05/21.
//

import SwiftUI

struct CampoSeguroView: View {
    var title: String
    
    var body: some View {
        VStack {
            HStack{
                Text(title)
                Spacer()
            }
            SecureField(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/"Password"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("Apple")/*@END_MENU_TOKEN@*/)
            Rectangle()
                .frame(width: 370, height: 1)
        }.padding()
    }
}

struct CampoSeguroView_Previews: PreviewProvider {
    static var previews: some View {
        CampoInsercaoView(title: "Deafult")
            .previewLayout(.sizeThatFits)

    }
}
