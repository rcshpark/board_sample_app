
import SwiftUI
import KakaoSDKAuth
import KakaoSDKCommon

@main
struct SampleApp: App {
    @UIApplicationDelegateAdaptor var appDelegate : MyAppDelegate
    // 1
    //    init() {
        //        Kakao SDK 초기화
    //        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
    //           KakaoSDK.initSDK(appKey: "NATIVE_APP_KEY")
    //       }
    //
    @StateObject private var kakaoAuthVM : KakaoAuthVM = KakaoAuthVM()
    var body: some Scene{
        WindowGroup {
            
                // onOpenURL()을 사용해 커스텀 URL 스킴 처리
                ContentView().onOpenURL(perform: { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        AuthController.handleOpenUrl(url: url)
                    }
                })
        }
    }
}
