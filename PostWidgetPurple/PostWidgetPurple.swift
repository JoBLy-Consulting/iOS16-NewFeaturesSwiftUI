//
//  PostWidgetPurple.swift
//  PostWidgetPurple
//
//  Created by Johan Guenaoui on 29/08/2022.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> PostEntry {
        PostEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (PostEntry) -> ()) {
        let entry = PostEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [PostEntry] = [PostEntry(date: Date(), configuration: ConfigurationIntent())]

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct PostEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct PostWidgetPurpleEntryView : View {
    var entry: Provider.Entry
    let postDirectory = PostDirectory()
    @Environment(\.widgetFamily) var family

    var body: some View {
        switch family {
        case .accessoryRectangular:
            if let post =      postDirectory.todayPost(datePost: entry.date).first {
                RectangularPostWidget(post: post)
            }
        case .accessoryInline:
            if let post =      postDirectory.todayPost(datePost: entry.date).first {
                LinearPostWidget(post: post)
            }
        case .accessoryCircular:
            if let post =      postDirectory.todayPost(datePost: entry.date).first {
                CircularPostWidget(post: post)
            }
        default:
            if let post =      postDirectory.todayPost(datePost: entry.date).first {
                RectangularPostWidget(post: post)
            }
        }
    }
}

@main
struct PostWidgetPurple: Widget {
    let kind: String = "PostWidgetPurple"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            PostWidgetPurpleEntryView(entry: entry)
        }
        .configurationDisplayName("Post Widget")
        .description("What's the post of the day ?.")
        .supportedFamilies([.accessoryRectangular, .accessoryInline, .accessoryCircular])
    }
}

struct PostWidgetPurple_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostWidgetPurpleEntryView(entry: PostEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
            PostWidgetPurpleEntryView(entry: PostEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .accessoryInline))
            PostWidgetPurpleEntryView(entry: PostEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .accessoryCircular))
        }
    }
}
