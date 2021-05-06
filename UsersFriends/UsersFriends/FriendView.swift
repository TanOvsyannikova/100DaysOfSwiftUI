//
//  FriendView.swift
//  UsersFriends
//
//  Created by Татьяна Овсянникова on 06.05.2021.
//

import SwiftUI

struct FriendView: View {
    @ObservedObject var users: Users
    var friend: User
    
    var body: some View {
        NavigationLink(destination: UserView(users: users, user: friend)) {
            VStack(alignment: HorizontalAlignment.leading) {
                Text(friend.name)
                    .font(.headline)
            }
        }
    }
}
