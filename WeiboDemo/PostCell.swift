
//
//  postCell.swift
//  test
//
//  Created by tuxiao on 2021/2/14.
//

import SwiftUI

struct postCell: View {
    let post:Post
    
    
    var body: some View {
        VStack(alignment:.leading,spacing:5){
            HStack(spacing:5){

                post.avatarImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height:50)
                    .clipShape(Circle())
                    .overlay(
                        PostViPBadge(vip:post.vip)
                       
                           
                    )
                   
                VStack{
                    Text(post.name).font(Font.system(size: 16))
                    .foregroundColor(Color(red:242/255,green:99/255,blue:4/255))
                    .lineLimit(11)
                    Text(post.date)
                        .font(.system(size:11))
                        .foregroundColor(.gray)
                }
                .padding(.leading,10)
                if !post.isFollowed{
                    Spacer()
                    Button(action:{
                        print("click floow button")
                    }){
                    
                    Text("关注")
                        .font(.system(size: 11))
                        .foregroundColor(.blue)
                        .frame(width: 50, height: 26)
                        .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.orange,lineWidth: 1))
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                
            }
            Text(post.text)
                .font(.system(size: 15))
            if !post.images.isEmpty{
                PostImageCell(images: post.images, width: UIScreen.main.bounds.width-30)
                
            }
            Divider()
            HStack(spacing:0){
                Spacer()
                PostCellToolbarButton(image: "message", text: post.commentCountText, color: .black) {
                    print("click comment button")
                }
                Spacer()
                PostCellToolbarButton(image: "heart", text: post.likeCountText, color: .black) {
                    print("click comment button")
                }
                Spacer()

            }
            Rectangle()
                .padding(.horizontal,-15)
                .frame(height:10)
                .foregroundColor(Color(red:238/255,green:238/255,blue:238/255))
                
        }
        .padding(.horizontal,15)
        .padding(.top,15)
       
    }
}

struct postCell_Previews: PreviewProvider {
    static var previews: some View {
        postCell(post:postList.list[0])
    }
}
