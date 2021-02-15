//
//  WeiboDemoApp.swift
//  WeiboDemo
//
//  Created by tuxiao on 2021/2/14.
//

import SwiftUI

@main
struct WeiboDemoApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(UserData())
        }
    }
}
