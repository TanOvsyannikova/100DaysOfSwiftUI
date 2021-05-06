//
//  FriendView.swift
//  UsersFriends
//
//  Created by Татьяна Овсянникова on 06.05.2021.
//

import SwiftUI

struct FriendView: View {
    @ObservedObject var users: Users
    var friend: Friend
    
    var body: some View {
        Text(friend.name)
    }
}
