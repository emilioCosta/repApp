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
    var date: String
    
    init(_ party: Party) {
        self.party = party
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        if let dateFormatted = dateFormatterGet.date(from: party.date.description) {
            self.date = dateFormatterPrint.string(from: dateFormatted)
        } else {
            self.date = "Data não informada"
        }
        
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
                Text(date)
                Spacer()
                Text("R$ " + String(party.cost))
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color(.sRGB, red: 1, green: 0.6, blue: 0.2, opacity: 1))
        }
        .onTapGesture {
//            DetailView(party)
        }
        .listRowBackground(Color(.sRGB, red: 0.97, green: 0.97, blue: 0.97, opacity: 1))
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

//struct PartyListItemView_Preview: PreviewProvider {
//
//    static var previews: some View {
//        var party: Party = Party()
//
//        //party.date = Date(timeIntervalSinceNow: TimeInterval(8))
//        PartyListItemView(party)
//            .previewDevice("iPhone 12 Pro")
//    }
//}
