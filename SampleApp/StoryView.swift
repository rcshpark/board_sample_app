//
//  StoryView.swift
//  SampleApp
//
//  Created by 박상훈 on 2023/07/21.
//

import SwiftUI

struct StoryView : View{
    var body: some View{
        VStack{
            Text("StoryView").font(.largeTitle)
                .fontWeight(.bold)
                .padding()
        }
        }
}

struct StoryView_Previews: PreviewProvider{
    static var previews: some View{
        StoryView()
    }
}
