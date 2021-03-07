//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by Татьяна Овсянникова on 07.03.2021.
//

import Foundation

class RockPaperScissorsGame: ObservableObject {
    @Published private var game: RPCGame<String> = RockPaperScissorsGame.createRPCGame()
    
    
}
