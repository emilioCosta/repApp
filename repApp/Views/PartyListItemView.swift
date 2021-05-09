//
//  PartyListItemView.swift
//  repApp
//
//  Created by Emilio Costa on 04/05/21.
//

import Foundation
import SwiftUI

struct PartyListItemView: View {
    var party: Party
    
    init(_ party: Party) {
        self.party = party
    }
    
    @State
    var tabViewing: Int = 0
    
    var body: some View {
        HStack {
            Image(party.imageName)
                .resizable()
                .frame(width: 150, height: 100)
                .clipShape(Trapezoid(insetAmount: 50))
            VStack(alignment: .leading){
                Text(party.name)
                    .bold()
                Text(party.dateFormatted)
                Spacer()
                Text("R$ " + String(party.cost))
            }
        }
        .frame(height: 100)
    }
}

struct Trapezoid: Shape {
    var insetAmount: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
   }
}

struct PartyListItemView_Preview: PreviewProvider {

    static var previews: some View {
        PartyListItemView(Party())
            .previewDevice("iPhone 12 Pro")
    }
}
