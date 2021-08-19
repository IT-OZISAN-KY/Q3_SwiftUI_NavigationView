//
//  ContentView.swift
//  Q3_SwiftUI_NavigationView
//
//  Created by keiji yamaki on 2021/08/19.
//
// NavigationViewの移動と表示の確認

import SwiftUI

struct ContentView: View {
    var body: some View {
        // １番目の画面を表示
        FirstView()
    }
}
// １番目の画面
struct FirstView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("２番目へ", destination: SecondView(through: false))
                    .padding()
                // Q１：３番目へ
            }
            .navigationTitle("１番目")
            // Navigationのタイトルを小さく
            .navigationBarTitleDisplayMode(.inline)
            // iPadでも同じ表示にするため
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
// ２番目の画面
struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var through: Bool    // 画面を通過
    @State var third = false    // ３番目の画面に移動
    
    var body: some View {
        VStack {
            // Q２：thirdのONで、３番目の画面に自動に移動
            Button(action: {
                // 画面を閉じる
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("１番目に戻る")
            }
        }
        .navigationTitle("２番目")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            // Q３、通過の場合、タイマーで１秒後に３番目に移動
        }
    }
}
// ３番目の画面：
struct ThirdView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            Button(action: {
                // 画面を閉じる
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("２番目に戻る")
            }
        }
        // NavigationViewのバーを非表示
        .navigationBarHidden(true)
    }
}
