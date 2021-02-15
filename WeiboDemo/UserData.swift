//
//  UserData.swift
//  WeiboDemo
//
//  Created by tuxiao on 2021/2/15.
//
import Combine
class UserData: ObservableObject{
    @Published var recommendPostList: PostList = loadPostListData("PostListData_recommend_1.json")
    @Published var hotPostList: PostList = loadPostListData("PostListData_hot_1.json")
    
    private var recommendPostDic:[Int:Int]=[:]
    private var hotPostDic:[Int:Int]=[:]
    
    init() {
        for i in 0..<recommendPostDic.count{
            let post = recommendPostList.list[i]
            recommendPostDic[post.id] = i
        }
        for i in 0..<hotPostDic.count{
            let post = hotPostList.list[i]
            hotPostDic[post.id] = i
        }
    }
    
}


enum PostListCatagory{
    case recommend
    case hot
}
extension UserData{
    func postList(for category:PostListCatagory)->PostList{
        switch category{
        case .recommend: return recommendPostList
        case .hot: return hotPostList
        }
    }
    func post(forId id: Int) -> Post? {
        if let index = recommendPostDic[id]{
            return recommendPostList.list[index]
        }
        if let index = hotPostDic[id]{
            return hotPostList.list[index]
        }
        return nil
    }
    func update(_ post:Post)  {
        if let index = recommendPostDic[post.id]{
            recommendPostList.list[index] = post
        }
        if let index = hotPostDic[post.id]
        {
            hotPostList.list[index] = post
        }
    }
}
