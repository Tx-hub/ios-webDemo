//
//  PostListView.swift
//  WeiboDemo
//
//  Created by tuxiao on 2021/2/14.
//

import SwiftUI

struct PostListView: View {
    let category:PostListCatagory
  
    
  
    var body: some View {
        List{
            ForEach(postList.list,id:\.id){
                post in
                ZStack{
                    postCell(post:post)
                    NavigationLink(
                        destination: PostDetailView(post: post)){
                        EmptyView()
                      
                    }
                    .hidden()
                }
                    .listRowInsets(EdgeInsets())
            }
        }
       
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PostListView(category: .recommend)
                .navigationBarTitle("Title")
                .navigationBarHidden(true)
        }
       
    }
}
