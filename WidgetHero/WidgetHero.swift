//
//  WidgetHero.swift
//  WidgetHero
//
//  Created by onur on 1.12.2023.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.onurcankurt.HeroWidget"))
    var heroData : Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), hero: Superhero(image: "batman", name: "Batman", realName: "Bruce Wayne"))
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
//        SimpleEntry(date: Date(), configuration: configuration, hero: <#Superhero#>)
        
//        if let hero = try? JSONDecoder().decode(Superhero.self, from: heroData) {
//            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
//        }
        SimpleEntry(date: Date(), configuration: configuration, hero: try! JSONDecoder().decode(Superhero.self, from: heroData) )
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: try! JSONDecoder().decode(Superhero.self, from: heroData))
//            entries.append(entry)
//        }
        if let hero = try? JSONDecoder().decode(Superhero.self, from: heroData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            entries.append(entry)
        }
        

        return Timeline(entries: entries, policy: .never)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    let hero: Superhero
}

struct WidgetHeroEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        CircularImageView(image: Image(entry.hero.image))
    }
}

struct WidgetHero: Widget {
    let kind: String = "WidgetHero"

    var body: some WidgetConfiguration {
        
        //StaticConfiguration
        
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WidgetHeroEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Widget Hero")
        .description("Hero widget!!!")
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    
    WidgetHero()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley, hero: try! JSONDecoder().decode(Superhero.self, from: Provider().heroData))
                
    SimpleEntry(date: .now, configuration: .starEyes, hero: try! JSONDecoder().decode(Superhero.self, from: Provider().heroData))
}
