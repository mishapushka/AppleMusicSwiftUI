//
//  RadioView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 07.06.2021.
//

import SwiftUI

struct RadioView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    RadioStationView()
                        .frame(height: 340)

                    Divider()
                        .padding(.top, 8)
                        .padding([.trailing, .leading])
                    
                    Text("Станции")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 26))
                        .padding()
                    StationView()
                }
            }
            .navigationBarTitle("Радио")
        }
    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}
