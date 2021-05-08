//
//  CampoInsercaoView.swift
//  repApp
//
//  Created by Hunter Soares do Carmo on 05/05/21.
//

import SwiftUI

struct CampoInsercaoView: View {
    var title: String
    
    var body: some View {
        VStack {
            HStack{
                Text(title)
                Spacer()
            }
            TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            Rectangle()
                .frame(width: 370, height: 1)
        }.padding()
    }
}

struct CampoInsercaoView_Previews: PreviewProvider {
    static var previews: some View {
        CampoInsercaoView(title: "Deafult")
            .previewLayout(.sizeThatFits)
    }
}
