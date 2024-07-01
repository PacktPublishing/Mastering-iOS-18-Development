//
//  InlineTipView.swift
//  TipKitApp
//
//  Created by Avi Tsadok on 01/03/2024.
//

import SwiftUI
import TipKit

struct MarkAsFavoriteTip: Tip {
    
    var id: String { "InlineTipView"}
    
    var title: Text {
        Text("Save as a Favorite")
    }
    
    var message: Text? {
        Text("You can mark items as Favorite and add them to your favorites list.")
    }
    
    var image: Image? {
        Image(systemName: "star")
    }
}

struct InlineTipView: View {
    
    var tip = MarkAsFavoriteTip()
    
    var body: some View {
        VStack {
            TipView(tip)
            List(workouts) { workout in
                WorkoutView(workout: workout, onFavoriteButtonTap: {
                    tip.invalidate(reason: .actionPerformed)
                })
            }
        }
        .navigationTitle("Inline Tip View")
        
    }
}

struct WorkoutView: View {
    let workout: Workout
    let onFavoriteButtonTap: ()->Void

    @State private var isFavorite = false

    var body: some View {
        HStack {
            Image(systemName: workout.symbolName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
            VStack(alignment: .leading) {
                Text(workout.title)
                    .font(.headline)
                Text(workout.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer() // Pushes the star button to the right
            Button(action: {
                isFavorite.toggle()
                onFavoriteButtonTap()
            }) {
                Image(systemName: isFavorite ? "star.fill" : "star")
                    .foregroundColor(isFavorite ? .yellow : .gray)
            }
            .frame(width: 44, height: 44)
            .contentShape(Rectangle())
        }

    }
}





struct Workout: Identifiable {
    let id = UUID()
    let title: String
    let symbolName: String
    let description: String
}

let workouts = [
        Workout(title: "Running", symbolName: "figure.walk", description: "Run outdoors or on a treadmill."),
        Workout(title: "Cycling", symbolName: "bicycle", description: "Ride a bike outdoors or use a stationary bike."),
        Workout(title: "Yoga", symbolName: "figure.stand", description: "Practice yoga poses for flexibility and relaxation."),
        Workout(title: "Strength Training", symbolName: "bolt.horizontal.circle", description: "Use weights or bodyweight exercises to build strength."),
        Workout(title: "Swimming", symbolName: "drop.triangle", description: "Swim laps in a pool or in open water."),
    ]

#Preview {
    InlineTipView()
}
