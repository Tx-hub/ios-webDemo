//
//  HomeView.swift
//  WeiboDemo
//
//  Created by tuxiao on 2021/2/15.
//

import SwiftUI

struct HomeView: View {
    @State var leftPersent: CGFloat = 0
    init(){
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    var body: some View {
        NavigationView{
            GeometryReader{geometry in
                HScrollViewController(pageWidth: geometry.size.width, contentSize: CGSize(width: geometry.size.width*2, height: geometry.size.height), leftPercent: self.$leftPersent) {
                    HStack{
                        PostListView(category: .recommend)
                            .frame(width: UIScreen.main.bounds.width)
                        PostListView(category: .hot)
                            .frame(width: UIScreen.main.bounds.width)
                    }
                }

            }
//                   ScrollView(.horizontal, showsIndicators: false){
//
//            }
            .listStyle(PlainListStyle())
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: $leftPersent))
            .navigationBarTitle("首页",displayMode: .inline)
        }
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
    }
}
