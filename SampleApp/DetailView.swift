import SwiftUI

struct DetailView: View {
    @ObservedObject var kakaoAuthVM : KakaoAuthVM
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack{
            HStack{
                Spacer()
            }
            Text("\(kakaoAuthVM.userModel.email ?? "사용자 이름") 님 환영합니다.").padding(10)
            Text("test").onTapGesture {
                print("Text Button active")
            }.padding(10)
            Button("Btn",action: {
                print("button active")
            }).foregroundColor(Color.red)
            Spacer()
        }.toolbar{
            Button("로그아웃"){
                kakaoAuthVM.kakaoLogout()
                self.presentationMode.wrappedValue.dismiss()
            }
            }.padding()
            .navigationBarBackButtonHidden()
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(kakaoAuthVM: KakaoAuthVM())
    }
}

