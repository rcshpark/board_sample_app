import SwiftUI

struct WelcomeView: View {
    @ObservedObject var kakaoAuthVM : KakaoAuthVM
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Text("\(kakaoAuthVM.userModel.name ?? "사용자 이름") 님 환영합니다.\n오늘도 열심히 연습합시다!").frame(maxWidth: .infinity,alignment: .center).padding(30)
                NavigationLink(destination: DetailView(kakaoAuthVM: kakaoAuthVM)){
                    Text("다음").foregroundColor(.gray)
                }
                Spacer()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(kakaoAuthVM: KakaoAuthVM())
    }
}
