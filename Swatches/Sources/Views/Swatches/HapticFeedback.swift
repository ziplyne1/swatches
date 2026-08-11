//
//  HapticFeedback.swift
//  Swatches
//
//  Created by Pax Willoughby on 6/13/26.
//

import SwiftUI

struct HapticPattern: Identifiable {
    let id: String
    let feedback: SensoryFeedback
    let producesVibration: Bool
    var trigger: Bool
    
    init(_ id: String, _ feedback: SensoryFeedback, _ producesVibration: Bool) {
        self.id = id
        self.feedback = feedback
        self.producesVibration = producesVibration
        self.trigger = false
    }
}

struct HapticFeedback: View {
    @State private var patterns: [HapticPattern] = [
        HapticPattern("alignment", .alignment, false),
        HapticPattern("decrease", .decrease, true),
        HapticPattern("error", .error, true),
        HapticPattern("impact", .impact, true), // todo)) implement impact parameters
        HapticPattern("increase", .increase, true),
        HapticPattern("levelChange", .levelChange, false),
        HapticPattern("pathComplete", .pathComplete, false),
        HapticPattern("selection", .selection, true),
        HapticPattern("start", .start, false),
        HapticPattern("stop", .stop, false),
        HapticPattern("success", .success, true)
    ]
    
    var body: some View {
        List {
            Section("Patterns") {
                ForEach($patterns) { $pattern in
                    Button(pattern.id) {
                        pattern.trigger.toggle()
                    }
                    .sensoryFeedback(pattern.feedback, trigger: pattern.trigger)
                    .tint(pattern.producesVibration ? .accent : .red)
                }
            }
            
            Section {
                DisclosureGroup("Information") {
                    Text("The patterns highlighted in red do not produce a vibration on their own with `.sensoryFeedback`. They are included for demonstration only.")
                }
            }
        }
    }
}

#Preview {
    ContentView(
        initialSwatch: "haptic feedback"
    )
}
