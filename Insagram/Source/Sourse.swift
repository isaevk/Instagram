//
//  Source.swift
//  Insagram
//
//  Created by Kirill Dev on 28.02.2023.
//

import UIKit

struct Post {
  let nickname: String
  let avatarImage: UIImage
  let postImage: UIImage
  let likes: String
  let signed: String
}

struct NickNames {
  static let user1 = "andrey_averin"
  static let user2 = "dmitri_sorokin"
  static let user3 = "zurab_matua"
}

struct AvatarImage {
  static let avatar1 = "avatar1"
  static let avatar2 = "avatar2"
  static let avatar3 = "avatar3"
}

struct PostImage {
  static let image1 = "andrey"
  static let image2 = "dmitri"
  static let image3 = "zurab"
}

struct Signatures {
  static let post1 = "Выступаем"
  static let post2 = "Отдыхаем"
  static let post3 = "Сегодня все отменяется"
}

struct Source {
  
  static func makePost() -> [Post] {
    
    guard let avatar1 = UIImage(named: AvatarImage.avatar1),
          let avatar2 = UIImage(named: AvatarImage.avatar2),
          let avatar3 = UIImage(named: AvatarImage.avatar3),
          let postImage1 = UIImage(named: PostImage.image1),
          let postImage2 = UIImage(named: PostImage.image2),
          let postImage3 = UIImage(named: PostImage.image3)
    else { fatalError() }
    
    return [
      Post(nickname: NickNames.user1, avatarImage: avatar1, postImage: postImage1, likes: "10", signed: Signatures.post1),
      Post(nickname: NickNames.user2, avatarImage: avatar2, postImage: postImage2, likes: "39", signed: Signatures.post2),
      Post(nickname: NickNames.user3, avatarImage: avatar3, postImage: postImage3, likes: "83", signed: Signatures.post3)
    ]
  }
}
