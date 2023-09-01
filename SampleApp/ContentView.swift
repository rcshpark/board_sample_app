import SwiftUI

struct ContentView: View {
    @StateObject var kakaoAuthVM : KakaoAuthVM = KakaoAuthVM()
    @State var isActive: Bool = false
    
    let loginStatusInfo : (Bool) -> String = { isLoggedIn in
        return isLoggedIn ? "Success" : "Fail"
    }
    var body: some View {
            NavigationStack {
                VStack(spacing: 15) {
                    Image("todays_list_icon").resizable().aspectRatio(contentMode: .fill).frame(height: 300)
                        Button {
                            kakaoAuthVM.handleKakaoLogin()
                        } label: {
                            Image("kakao_login_medium_wide")
                        }.navigationDestination(isPresented: $isActive){
                            if kakaoAuthVM.isLoggedIn{
                                DetailView(kakaoAuthVM: kakaoAuthVM)
                            }
                        }
                    Button {
                    }label: {
                        HStack{
                            Image(systemName: "pencil").padding(.trailing, 80).padding(.leading)
                            Text("이메일 로그인")
                        }.font(.system(size: 15))
                            .frame(width: 300,height: 45, alignment: .leading).foregroundColor(Color.black).background(.green)
                            .cornerRadius(8)
                    }
                }
                .onReceive(kakaoAuthVM.$isLoggedIn, perform: { newValue in
                    if newValue {
                        isActive = true // 로그인이 성공하면 다음 페이지로 자동으로 이동
                    }
                })
            }
        }
    }

// preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
