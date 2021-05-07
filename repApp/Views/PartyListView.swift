//
//  PartyListView.swift
//  repApp
//
//  Created by Emilio Costa on 03/05/21.
//

import Foundation
import SwiftUI

struct PartyListView: View {
    private var parties: [Party] = []

    @State private var tabViewing: Int = 0
    
    @State private var offset = CGSize.zero
    
    init() {
        parties = load("partiesJSON")
    }
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color(.sRGB, red: 0.97, green: 0.97, blue: 0.97, opacity: 1).ignoresSafeArea()
            VStack(alignment: .leading, spacing: 60) {
                HStack(alignment: .top) {
                    Button(action: {
                        withAnimation {
                            self.tabViewing = 0
                        }
                    }, label: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Acontecendo")
                                .foregroundColor(
                                    self.tabViewing == 0 ? Color(.sRGB, red: 1, green: 0.6, blue: 0.2, opacity: 1) : Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1))
                            if self.tabViewing == 0 {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 110, height: 2)
                                    .foregroundColor(Color(.sRGB, red: 1, green: 0.6, blue: 0.2, opacity: 1))
                            }
                        }
                    })
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            self.tabViewing = 1
                        }
                    }, label: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Próximas")
                                .foregroundColor(
                                    self.tabViewing == 1 ? Color(.sRGB, red: 1, green: 0.6, blue: 0.2, opacity: 1) : Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1))
                            if self.tabViewing == 1 {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 70, height: 2)
                                    .foregroundColor(Color(.sRGB, red: 1, green: 0.6, blue: 0.2, opacity: 1))
                            }
                        }
                    })
                }
                .frame(width: 200, height: 0, alignment: .topLeading)
                .padding()
                
                List(parties.filter { party in
                    let calendar = Calendar.current
                    let date1 = calendar.startOfDay(for: Date())
                    let date2 = calendar.startOfDay(for: party.date)

                    let components = calendar.dateComponents([.day], from: date1, to: date2)
                    
                    print(components.day!)

                    return tabViewing == 0 ? components.day! < 6 : components.day! >= 6
                }) { party in
                    PartyListItemView(party)
                }
                .gesture(
                    DragGesture()
                        .onChanged {
                            if $0.startLocation.x + 60 > $0.location.x {
                                self.tabViewing = 1
                            } else {
                                self.tabViewing = 0
                            }
                        }
                )
            }
        }
    }
}

struct PartyListView_Preview: PreviewProvider {
    static var previews: some View {
        PartyListView()
            .previewDevice("iPhone 12 Pro")
    }
}
