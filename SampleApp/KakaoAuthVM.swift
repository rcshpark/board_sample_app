import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthVM: ObservableObject{
    @Published var isLoggedIn : Bool = false
    @Published var userModel : UserModel = UserModel()
    
    func getUserData(){
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                //do something
                _ = user
                self.userModel = UserModel(email: user?.kakaoAccount?.email, name: user?.kakaoAccount?.name)
            }
        }
    }
    
    @MainActor
    func handleKakaoLogin(){
        Task{
            if UserApi.isKakaoTalkLoginAvailable() {
                isLoggedIn = await loginWithKakaoApp()
                getUserData()
            } else{
                isLoggedIn = await loginWithKakaoAccount()
                getUserData()
            }
        }
    }
    
    func loginWithKakaoApp() async -> Bool {
        await withCheckedContinuation{ continuation in
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
//                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
        }
    }
    func loginWithKakaoAccount() async -> Bool {
        await withCheckedContinuation{ continuation in
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                        continuation.resume(returning: false)
                    }
                    else {
//                        print("loginWithKakaoAccount() success.")
                        //do something
                        _ = oauthToken
                        continuation.resume(returning: true)
                        
                    }
                }
        }
    }
    
    // logout
    @MainActor
    func kakaoLogout() {
        Task{
            if(await handleKakaoLogout()){
                isLoggedIn = true
            } else{
                isLoggedIn = false
            }
        }
    }
    func handleKakaoLogout()async -> Bool {
        await withCheckedContinuation{ continuation in
            UserApi.shared.logout {(error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("logout() success.")
                    continuation.resume(returning: true)
                }
            }
        }
        
    }
}

