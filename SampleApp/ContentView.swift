import SwiftUI

struct ContentView: View {
    @StateObject var kakaoAuthVM : KakaoAuthVM = KakaoAuthVM()
    @State var isActive: Bool = false
    
    let loginStatusInfo : (Bool) -> String = { isLoggedIn in
        return isLoggedIn ? "Success" : "Fail"
    }
    var body: some View {
            NavigationView {
                VStack(spacing: 20) {
                        Button("Login") {
                            print(kakaoAuthVM.userModel.email ?? "")
                            kakaoAuthVM.handleKakaoLogin()
                    }
                    if kakaoAuthVM.isLoggedIn {
                        NavigationLink(destination: DetailView(kakaoAuthVM: kakaoAuthVM), isActive: $isActive) {
                            EmptyView() // 비어있는 뷰를 사용해서 NavigationLink를 활성화
                        }
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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
