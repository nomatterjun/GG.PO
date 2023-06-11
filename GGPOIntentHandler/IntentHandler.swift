//
//  IntentHandler.swift
//  GGPOIntentHandler
//
//  Created by 이창준 on 6/11/23.
//

import Intents

class IntentHandler: INExtension, DynamicSummonerSelectionIntentHandling {

    func provideSummonerOptionsCollection(
        for intent: DynamicSummonerSelectionIntent
    ) async throws -> INObjectCollection<Summoner> {
        // Get available summoner list.
        let summoners: [Summoner] = [
            Summoner(identifier: "Hide on bush", display: "Faker"),
            Summoner(identifier: "sdfklj", display: "Zeus")
        ]
        
        // Init Collection with summoners
        let collection = INObjectCollection(items: summoners)
        return collection
    }
    
}
