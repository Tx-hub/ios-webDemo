//
//  HomeNavigationBar.swift
//  WeiboDemo
//
//  Created by tuxiao on 2021/2/14.
//

import SwiftUI
private let kLabelwidth : CGFloat = 60
private let kButtonHeight : CGFloat = 24

struct HomeNavigationBar: View {
    @Binding var leftPercent:CGFloat//0 left
    
    var body: some View {
        HStack(alignment:.top,spacing:0){
            Button(action: {
                print("click camera")
            }){
                Image(systemName:"camera")
                    .resizable()
                    .scaledToFill()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal,15)
                    .padding(.top,5)
                    .foregroundColor(.black)
            }
            Spacer()
            VStack(spacing:3){
                HStack{
                    Text("推荐")
                        .bold()
                        .frame(width:kLabelwidth,height: kButtonHeight)
                        .padding(.top,5)
                        .opacity(Double(1-leftPercent*0.5))
                        .onTapGesture {
                            withAnimation {
                                self.leftPercent = 0
                            }
                            
                        }
                    Spacer()
                    Text("热门")
                        .bold()
                        .frame(width:kLabelwidth,height: kButtonHeight)
                        .padding(.top,5)
                        .opacity(Double(0.5+leftPercent*0.5))
                        .onTapGesture {
                            withAnimation {
                                self.leftPercent = 1
                            }
                        }
                       
                } .font(.system(size:20))
                
                RoundedRectangle(cornerRadius:2)
                    .foregroundColor(.orange)
                    .frame(width:30,height:4)
                    .offset(x:UIScreen.main.bounds.width*0.5*(self.leftPercent-0.5)+CGFloat(kLabelwidth*(0.5-self.leftPercent)))
            }
            .frame(width:UIScreen.main.bounds.width*0.5)
            Spacer()
            Button(action: {
                print("click add button")
            }){
                Image(systemName:"plus.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal,15)
                    .padding(.top,5)
                    .foregroundColor(.orange)
            }
        }
        .frame(width:UIScreen.main.bounds.width)
        

    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationBar(leftPercent: .constant(0))
    }
}
