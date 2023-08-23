//
//  HomeView.swift
//  SampleApp
//
//  Created by 박상훈 on 2023/08/23.
//

import SwiftUI

struct HomeView: View {
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        ScrollView {
              LazyVGrid(columns: columns) {
                ForEach((0...19), id: \.self) { _ in
                  Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
                    .cornerRadius(15)
                    .frame(width: 150, height: 150)
                    .padding()
                }
              }
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
