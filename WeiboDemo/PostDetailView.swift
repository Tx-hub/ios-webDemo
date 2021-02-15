//
//  PostDetailView.swift
//  WeiboDemo
//
//  Created by tuxiao on 2021/2/14.
//

import SwiftUI

struct PostDetailView: View {
    let post:Post
    var body: some View {
        List{
            postCell(post :post)
                .listRowInsets(EdgeInsets())
            
            ForEach(1...10,id:\.self){i in
                Text("评论\(i)")
            }
        }
        .navigationBarTitle("详情",displayMode: .inline)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: postList.list[0])
    }
}
