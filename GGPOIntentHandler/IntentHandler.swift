//
//  IntentHandler.swift
//  GGPOIntentHandler
//
//  Created by 이창준 on 6/11/23.
//

import Intents

class IntentHandler: INExtension, DynamicSummonerSelectionIntentHandling {

    func provideSummonerOptionsCollection(for intent: DynamicSummonerSelectionIntent,
                                          with completion: @escaping (INObjectCollection<Summoner>?, Error?) -> Void
    ) {
        // Get available summoner list.
        let summoners: [Summoner] = []

        // Init Collection with summoners
        let collection = INObjectCollection(items: summoners)

        completion(collection, nil)
    }

    override func handler(for intent: INIntent) -> Any? {
        return self
    }
    
}
