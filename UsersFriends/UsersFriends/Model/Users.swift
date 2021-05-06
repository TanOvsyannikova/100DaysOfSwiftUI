//
//  Users.swift
//  UsersFriends
//
//  Created by Татьяна Овсянникова on 05.05.2021.
//

import Foundation

class Users: ObservableObject {
    @Published var all = [User]()
    
    init(users: [User]) {
        self.all = users
    }
    
    init() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        let session = URLSession.shared.dataTask(with: request) { data, response, sessionError in
            guard let data = data else {
                print("Fetch failed: \(sessionError?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                let decoded = try JSONDecoder().decode([User].self, from: data)
                
                DispatchQueue.main.async { [weak self] in
                    self?.all = decoded
                }
            }
            catch let decodingError {
                print("Decoding failed: \(decodingError.localizedDescription)")
            }
        }
        
        DispatchQueue.global().async {
            session.resume()
        }
        
    }
    
    func findUser(withID ID: String) -> User? {
        return all.first { $0.id == ID }
    }
    
}
