//
//  HomeView.swift
//  SampleApp
//
//  Created by 박상훈 on 2023/07/21.
//

import SwiftUI

struct HomeView: View{
    var body: some View{
        VStack {
            Text("HomeView")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
        }
    }
}

struct HomeView_Previews : PreviewProvider {
    static var previews: some View{
        HomeView()
    }
}
