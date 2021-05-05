//
//  UserView.swift
//  UsersFriends
//
//  Created by Татьяна Овсянникова on 05.05.2021.
//

import SwiftUI

struct UserView: View {
    let user: User
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    init(user: User) {
        self.user = user
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User(id: 1, active: true, name: "ss", age: 11, company: "ee", email: "dd", address: "dd", about: "dd", registrationDate: Date()))
    }
}
