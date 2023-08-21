//
//  MyAppDelegate.swift
//  SampleApp
//
//  Created by 박상훈 on 2023/08/20.
//

import Foundation
import UIKit
import KakaoSDKCommon
import KakaoSDKAuth

class MyAppDelegate: UIResponder, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
        
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
        
        print("KAKAO KEY = \(kakaoAppKey)")
        return true 
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
           if (AuthApi.isKakaoTalkLoginUrl(url)) {
               return AuthController.handleOpenUrl(url: url)
           }

           return false
       }
}
