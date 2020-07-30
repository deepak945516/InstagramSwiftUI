//
//  HomeView.swift
//  LearningSwiftUI
//
//  Created by Deepak Kumar on 23/06/20.
//  Copyright © 2020 macadmin. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State private var arrPost: [Post] = Post.all()
    @State private var showActionSheet: Bool = false
    @State private var profileImg: UIImage? = UIImage(systemName: "camera")
    @State private var showImgPicker: Bool = false
    @State private var isTakePhoto: Bool = false
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Please choose source type"), message: nil, buttons: [
            .default(Text("Gallery"), action: {
                self.isTakePhoto = false
                self.showImgPicker.toggle()
            }),
            .default(Text("Camera"), action: {
                self.isTakePhoto = true
                self.showImgPicker.toggle()
            }),
            .destructive(Text("Cancel"))
        ])
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<20) { i in
                            CircularImage(imgName: "apple0")
                            .frame(width: 80, height: 80)
                                .padding(.trailing, 10)
                        }
                    }
                .padding()
                }
                List {
                    ForEach(0..<arrPost.count) { postIndex in
                        PostCell(post: self.$arrPost[postIndex])
                    }
                    .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .navigationBarTitle(Text("Instagram"), displayMode: .inline)
            .navigationBarItems(leading: Image(uiImage: profileImg!)
            .resizable()
            .frame(width: 30, height: 30)
            .onTapGesture {
                self.showActionSheet.toggle()
                }
                , trailing: Image(systemName: "paperplane")
                    .onTapGesture {
                        SwiftHelper.showAlertOnWindow(title: "Alert", message: "Awesome")
            })
                .actionSheet(isPresented: $showActionSheet, content: {
                    self.actionSheet
                })
                .sheet(isPresented: $showImgPicker) {
                    ShowImagePicker(image: self.$profileImg, takePhoto: self.$isTakePhoto)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct PostCell: View {
    @Binding var post: Post
    var body: some View {
        VStack {
            HStack {
                CircularImage(imgName: post.profileImg)
                    .frame(width: 50, height: 50)
                Text(post.name)
                Spacer()
                Button(action: {
                    // More
                }) {
                    Image(systemName: "ellipsis")
                }
                .foregroundColor(.black)
            }
            .padding(.trailing, 20)
            .padding(.leading, 10)
            Image(post.postImg)
            .resizable()
            .scaledToFit()
            .onTapGesture(count: 2, perform: {
                self.postLikeAction()
            })
            // Like comment
            HStack {
                Button(action: {
                    //like
                    self.postLikeAction()
                }) {
                    Image(systemName: post.isLiked ? "heart.fill": "heart")
                        .scaleEffect(1.5)
                        .padding(.trailing, 15)
                }
                Button(action: {
                    //comment
                }) {
                    Image(systemName: "message")
                    .scaleEffect(1.5)
                    .padding(.trailing, 15)
                }
                Button(action: {
                    //message
                }) {
                    Image(systemName: "paperplane")
                    .scaleEffect(1.5)
                }
                Spacer()
                Button(action: {
                    //bookmark
                }) {
                    Image(systemName: "bookmark")
                    .scaleEffect(1.5)
                }
            }.foregroundColor(.black)
            .padding()
            
            HStack {
                Text("\(post.likeCount) likes")
                    .fontWeight(.semibold)
                Spacer()
            }.padding(.leading, 12)
            
            Divider()

        }
    }
    
    private func postLikeAction() {
        post.isLiked.toggle()
        post.likeCount += post.isLiked ? 1: -1
    }
}

struct CircularImage: View {
    let imgName: String
    var body: some View {
        Image(imgName)
        .resizable()
        .clipShape(Circle())
        .overlay(Circle().stroke(lineWidth: 2)).foregroundColor(.white)
        .shadow(color: .gray, radius: 5, x: 0, y: 0)
    }
}
