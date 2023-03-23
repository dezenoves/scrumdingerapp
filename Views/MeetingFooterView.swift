//
//  MeetingFooterView.swift
//  Scrumdinger
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: () -> Void
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View {
        VStack {
            if isLastSpeaker {
                Text("Last Speaker")
            } else {
                Text(speakerText)
                    .font(.subheadline)
                
                Button(action: {
                    skipAction()
                }) {
                    Image(systemName: "arrow.forward")
                        .foregroundColor(.white)
                }
                .padding(15)
                .background(.indigo)
                .clipShape(Capsule())
                .accessibilityLabel("Next speaker")
            }
        }
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
    }
}
