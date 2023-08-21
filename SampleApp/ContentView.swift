import SwiftUI

struct ContentView: View {
    @StateObject var kakaoAuthVM : KakaoAuthVM = KakaoAuthVM()
    let loginStatusInfo : (Bool) -> String = { isLoggedIn in
        return isLoggedIn ? "Success" : "Fail"
    }
    var body: some View {
        VStack(spacing: 20){
            Text(loginStatusInfo(kakaoAuthVM.isLoggedIn))
            Button("Login", action:{
                kakaoAuthVM.handleKakaoLogin()
            })
            Button("Logout", action:{})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
