//
//  PostViPBadge.swift
//  WeiboDemo
//
//  Created by tuxiao on 2021/2/14.
//

import SwiftUI

struct PostViPBadge: View {
    let vip:Bool
    var body: some View {
        Group{
        if vip{
            Text("V")
                .font(.system(size:11))
                .frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.yellow)
                .background(Color.red)
                .clipShape(Circle())
                .overlay(RoundedRectangle(cornerRadius: 7.5)
                            .stroke(Color.white,lineWidth: 1))
                .offset(x: 16, y: 16)
        }
        }
        
    }
}

struct PostViPBadge_Previews: PreviewProvider {
    static var previews: some View {
        PostViPBadge(vip:true)
    }
}
