//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Georgy Dyagilev on 09/10/2018.
//  Copyright © 2018 Georgy Dyagilev. All rights reserved.
//

import Foundation

class Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}

struct CategorizedEmojis {
    var category: String
    var emojis: [Emoji]
    
}


func loadCategorizedEmojis() -> [CategorizedEmojis] {
    let categorizedEmojis = [
        CategorizedEmojis(category: "Smileys & People",
                          emojis: [
                            Emoji(symbol: "😉",
                                  name: "Winking Face",
                                  description: "A yellow face with a slight, partially open smile and its left eye winking.",
                                  usage: "Signals a joke, flirtation, hidden meaning, or general positivity."),
                            Emoji(symbol: "🤗",
                                  name: "Hugging Face",
                                  description: "A face displayed with an open hands gesture, offering a hug.",
                                  usage: "Often used as excited \"jazz hands\" due to the similarity of appearance to this gesture on a number of platforms."),
                            Emoji(symbol: "🤨",
                                  name: "Face With Raised Eyebrow",
                                  description: "A face with a neutral mouth and single eyebrow raised.",
                                  usage: "May be used to denote scepticism, disbelief, or disapproval.")
            ]),
        CategorizedEmojis(category: "Activity",
                          emojis: [
                            Emoji(symbol: "🧘",
                                  name: "Person in Lotus Position",
                                  description: "Person in Lotus Position.",
                                  usage: "When you want to meditate."),
                            Emoji(symbol: "🏂",
                                  name: "Snowboarder",
                                  description: "A person snowboarding downhill.",
                                  usage: "A person snowboarding downhill at a ski resort. Wearing clothing designed for cold climates."),
                            Emoji(symbol: "🏆",
                                  name: "Trophy",
                                  description: "The trophy emoji is a gold cup.",
                                  usage: "A trophy given as an recognition of achievement, usually in sports. The trophy emoji is a gold cup, with a engraving on the bottom detailing the award."),
            ]),
        CategorizedEmojis(category: "Travel & Places",
                          emojis: [
                            Emoji(symbol: "🗻",
                                  name: "Mount Fuji",
                                  description: "Mount Fuji (called Fuji-san in Japan) is the largest mountain in Japan.",
                                  usage: "It is considered lucky in Japan to dream of Mt Fuji in the first dream of the new year."),
                            Emoji(symbol: "⛺",
                                  name: "Tent",
                                  description: "A tent, used for protection from wind and rain when camping.",
                                  usage: "Often shown at night time, under stars."),
                            Emoji(symbol: "🏟️",
                                  name: "Stadium",
                                  description: "A large capacity stadium.",
                                  usage: "A large capacity stadium, featuring a large amount of seating for sporting fans, or people attending other shows hosted by the stadium.")
            ])
    ]
    return categorizedEmojis
}
