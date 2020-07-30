
//
//  HomeModel.swift
//  LearningSwiftUI
//
//  Created by Deepak Kumar on 23/06/20.
//  Copyright © 2020 macadmin. All rights reserved.
//

import Foundation

struct Post {    
    var profileImg: String
    var name: String
    var postImg: String
    var likeCount: Int
    var isLiked: Bool
}

extension Post {
    static func all() -> [Post] {
        return [
            Post(profileImg: "apple1", name: "Deepak Kumar", postImg: "apple2", likeCount: 5, isLiked: true),
            Post(profileImg: "apple0", name: "Rahul Raj", postImg: "apple1", likeCount: 0, isLiked: false),
            Post(profileImg: "apple2", name: "Vivek Maurya", postImg: "apple3", likeCount: 500, isLiked: true),
            Post(profileImg: "apple1", name: "Ronit Roy", postImg: "apple0", likeCount: 999, isLiked: true),
            Post(profileImg: "apple3", name: "Sunny Sood", postImg: "apple2", likeCount: 1200, isLiked: false)
        ]
    }
}

