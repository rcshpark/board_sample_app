//import SwiftUI
//import KakaoSDKAuth
//import KakaoSDKCommon
//
//@main
//struct LoginApp: App{
//    
//    @UIApplicationDelegateAdaptor var appDelegate : MyAppDelegate
//    // 1

//        //        Kakao SDK 초기화
//    //        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
//    //           KakaoSDK.initSDK(appKey: "NATIVE_APP_KEY")
//    //       }
//    //
//    var body: some Scene{
//        WindowGroup {
//                    // onOpenURL()을 사용해 커스텀 URL 스킴 처리
//                    ContentView().onOpenURL(perform: { url in
//                        if (AuthApi.isKakaoTalkLoginUrl(url)) {
//                            AuthController.handleOpenUrl(url: url)
//                        }
//                    })
//                }
//    }
//}
