//
//  Miniplayer.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 02.06.2021.
//

import SwiftUI

struct Miniplayer: View {
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image("pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .cornerRadius(15)

                Text("Nigga - Shoot you!")
                    .fontWeight(.regular)

                Spacer(minLength: 0)

                Button(action: {}, label: {
                    Image(systemName: "play.fill")
                        .font(.title2)
                        .foregroundColor(.primary)
                })
                Button(action: {}, label: {
                    Image(systemName: "forward.fill")
                        .font(.title2)
                        .foregroundColor(.primary)
                })
            }
            .padding(.horizontal)
        }
        .frame(height: 80)
        .background(Color(.white))
        .offset(y: -48)
    }
}
