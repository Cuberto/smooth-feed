//
//  FeedItem.swift
//  smooth-feed
//
//  Created by Denis Shvetsov on 29/11/2019.
//  Copyright © 2019 Cuberto. All rights reserved.
//

import Foundation

enum FeedItem {
    case like(_ likes: Int)
    case author
    case text(_ text: String)
    case comment(_ comment: Comment)
}

let items: [[FeedItem]] = [
    [
        .like(12893),
        .author,
        .text("Friendly rate choice (for #fun) 😅\nDon’t forget click ❤️ 😉"),
        .comment(Comment(avatar: #imageLiteral(resourceName: "avatar1"),
                         name: "iameddiei",
                         text: "My god this is gold 😂😂😂😂ahahahahahhahaah",
                         hours: 18,
                         likes: 2)),
    ],
    [
        .like(9214),
        .author,
        .text("We all need a hype-man to hype us up\nwhen we cook..."),
        .comment(Comment(avatar: #imageLiteral(resourceName: "avatar"),
                         name: "brave.nick",
                         text: "My god this is gold 😂😂😂😂ahahahahahhahaah\nNice, very nice!",
                         hours: 19,
                         likes: 4)),
        .comment(Comment(avatar: #imageLiteral(resourceName: "avatar1"),
                         name: "iameddiei",
                         text: "Lol😂",
                         hours: 18,
                         likes: 2)),
        .comment(Comment(avatar: #imageLiteral(resourceName: "avatar2"),
                         name: "alex",
                         text: "We all need a hype-man to hype us up when we cook",
                         hours: 6,
                         likes: 6)),
        .comment(Comment(avatar: #imageLiteral(resourceName: "avatar1"),
                         name: "iameddiei",
                         text: "I just realized it's not funny 😡",
                         hours: 2,
                         likes: 0)),
        .comment(Comment(avatar: #imageLiteral(resourceName: "avatar"),
                         name: "brave.nick",
                         text: "My god this is gold 😂😂😂😂ahahahahahhahaah\nNice, very nice!",
                         hours: 19,
                         likes: 4))
    ],
    [
        .like(13413),
        .author,
        .text("Friendly rate choice (for #fun) 😅\nDon’t forget click ❤️ 😉"),
        .comment(Comment(avatar: #imageLiteral(resourceName: "avatar"),
                         name: "brave.nick",
                         text: "My god this is gold 😂😂😂😂ahahahahahhahaah\nNice, very nice!",
                         hours: 19,
                         likes: 4)),
        .comment(Comment(avatar: #imageLiteral(resourceName: "avatar1"),
                         name: "iameddiei",
                         text: "Lol😂",
                         hours: 18,
                         likes: 2)),
        .comment(Comment(avatar: #imageLiteral(resourceName: "avatar2"),
                         name: "alex",
                         text: "We all need a hype-man to hype us up when we cook",
                         hours: 6,
                         likes: 6)),
        .comment(Comment(avatar: #imageLiteral(resourceName: "avatar1"),
                         name: "iameddiei",
                         text: "I just realized it's not funny 😡",
                         hours: 2,
                         likes: 0))
    ],
    [
        .like(15456),
        .author,
        .text("Friendly rate choice (for #fun) 😅\nDon’t forget click ❤️ 😉"),
        .comment(Comment(avatar: #imageLiteral(resourceName: "avatar"),
                         name: "brave.nick",
                         text: "My god this is gold 😂😂😂😂ahahahahahhahaah\nNice, very nice!",
                         hours: 19,
                         likes: 4)),
        .comment(Comment(avatar: #imageLiteral(resourceName: "avatar1"),
                         name: "iameddiei",
                         text: "Lol😂",
                         hours: 18,
                         likes: 2)),
        .comment(Comment(avatar: #imageLiteral(resourceName: "avatar2"),
                         name: "alex",
                         text: "We all need a hype-man to hype us up when we cook",
                         hours: 6,
                         likes: 6)),
        .comment(Comment(avatar: #imageLiteral(resourceName: "avatar1"),
                         name: "iameddiei",
                         text: "I just realized it's not funny 😡",
                         hours: 2,
                         likes: 0))
    ],
]
