//
//  SettingView.swift
//  SampleApp
//
//  Created by 박상훈 on 2023/07/21.
//

import SwiftUI

struct SettingView : View{
    var body: some View{
        VStack{
            Text("SeetingView")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
        }
    }
}

struct SettingView_Previews: PreviewProvider{
    static var previews: some View{
        SettingView()
    }
}
