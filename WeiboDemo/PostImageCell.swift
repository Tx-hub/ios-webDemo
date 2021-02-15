//
//  PostImageCell.swift
//  WeiboDemo
//
//  Created by tuxiao on 2021/2/14.
//

import SwiftUI
private let kImageSpace: CGFloat = 6

struct PostImageCell: View {
    let images : [String]
    let width : CGFloat
    var body: some View {
        if images.count==1{
            loadImage(name:images[0])
                .resizable()
                .scaledToFill()
                .frame(width: width, height:width*0.75)
                .clipped()
        }
        else if images.count==2
            {
        PostImagecellRow(images: images, width: width)
            
        }
        else if images.count==3
            {
            PostImagecellRow(images: images, width: width)
            
        }
        else if images.count==4
            {
        
            VStack(spacing:kImageSpace){
                PostImagecellRow(images: Array(images[0...1]), width: width)
                PostImagecellRow(images: Array(images[2...3]), width: width)
                
            }
        }
        else if images.count==5
            {
            
                VStack(spacing:kImageSpace){
                    PostImagecellRow(images: Array(images[0...1]), width: width)
                    PostImagecellRow(images: Array(images[2...4]), width: width)
                    
                }
            
        }
        else if images.count==6
            {
            
                VStack(spacing:kImageSpace){
                    PostImagecellRow(images: Array(images[0...2]), width: width)
                    PostImagecellRow(images: Array(images[3...5]), width: width)
                    
                }
            
        }
       
        
        
    }
}
struct PostImagecellRow:View {
    let images:[String]
    let width:CGFloat
    var body:some View{
        HStack(spacing:kImageSpace){
            ForEach(images,id:\.self){
                image in
                loadImage(name: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width:(self.width - kImageSpace * CGFloat(self.images.count-1))/CGFloat(self.images.count),height:(self.width - kImageSpace * CGFloat(self.images.count-1))/CGFloat(self.images.count))
                    .clipped()
            }
        }
    }
}
struct PostImageCell_Previews: PreviewProvider {
    static var previews: some View {
        let images = postList.list[0].images
        let width = UIScreen.main.bounds.width-30
        return Group{
        PostImageCell(images:Array(images[0...0]),width:width )
        PostImageCell(images:Array(images[0...1]),width:width )
        PostImageCell(images:Array(images[0...2]),width:width )
        PostImageCell(images:Array(images[0...3]),width:width )
        PostImageCell(images:Array(images[0...4]),width:width )
        PostImageCell(images:Array(images[0...5]),width:width )
            
        }
            .previewLayout(.fixed(width: width, height: 300))
    }
}
