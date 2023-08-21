import SwiftUI

struct DetailView: View {
    @StateObject var kakaoAuthVM : KakaoAuthVM = KakaoAuthVM()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack{
            Text("로그인 성공")
        }.toolbar{
            Button("로그아웃"){
                kakaoAuthVM.kakaoLogout()
                self.presentationMode.wrappedValue.dismiss()
            }
            }.padding()
            .navigationBarBackButtonHidden()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
