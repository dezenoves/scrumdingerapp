//
//  MeetingProgressView.swift
//  Scrumdinger
//

import SwiftUI

struct MeetingProgressView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                        .font(.headline)
                        .foregroundColor(.green)
                }
            }
        }
        .padding(.top, 15)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
    }
}

struct MeetingProgressView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingProgressView(secondsElapsed: 60, secondsRemaining: 180, theme: .indigo)
    }
}
