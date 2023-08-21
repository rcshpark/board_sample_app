import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthVM: ObservableObject{
    @Published var isLoggedIn : Bool = false
    
    @MainActor
    func handleKakaoLogin(){
        Task{
            if UserApi.isKakaoTalkLoginAvailable() {
                isLoggedIn = await loginWithKakaoApp()
            } else{
                isLoggedIn = await loginWithKakaoAccount()
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
                    print("loginWithKakaoTalk() success.")

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
                        print("loginWithKakaoAccount() success.")
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
