//
//  LogdayPage.swift
//  Learning
//
//  Created by shaden  on 19/04/1446 AH.
//

import SwiftUI

struct LogdayPage: View {
    @State private var streakCount = 10
        @State private var freezeCount = 2
        @State private var maxFreezesPerMonth = 6
        @State private var dayLogged = false
        @State private var dayFrozen = false
        
        var body: some View {
            VStack {
                // Header Section with Title and Flame Icon
                HStack {
                    Text("Learning Swift")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                    Text("🔥")
                        .foregroundColor(.orange)
                        .font(.system(size: 30))
                }
                .padding(.horizontal)
                .padding(.top, 50)
                
                // Calendar View
                VStack {
                    Text("Wednesday, 11 SEP")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text("September 2024")
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                        Button(action: { }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                        }
                        Button(action: { }) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    // Calendar Days Row
                    HStack {
                        ForEach(1..<8) { day in
                            Circle()
                                .fill(day == 4 ? Color.orange : Color.blue.opacity(0.7))
                                .frame(width: 30, height: 30)
                                .overlay(
                                    Text("\(day)")
                                        .foregroundColor(.white)
                                )
                        }
                    }
                }
                .padding(.top, 10)
                
                // Streak & Freeze Stats Section
                HStack {
                    VStack {
                        Text("\(streakCount)🔥")
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Day streak")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Divider()
                        .background(Color.gray)
                        .frame(height: 50)
                    VStack {
                        Text("\(freezeCount)🧊")
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Day frozen")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.top, 20)
                
                // Log Today Button (Circular)
                Button(action: {
                    dayLogged.toggle()
                }) {
                    Circle()
                        .fill(dayLogged ? Color.brown : Color.orange)
                        .frame(width: 250, height: 250)
                        .overlay(
                            Text(dayLogged ? "Learned Today" : "Log today as Learned")
                                .foregroundColor(.black)
                                .font(.headline)
                                .bold()
                        )
                }
                .padding(.top, 20)
                
                // Freeze Day Button (Rectangular)
                Button(action: {
                    dayFrozen.toggle()
                }) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(dayFrozen ? Color.gray : Color.blue)
                        .frame(width: 300, height: 50)
                        .overlay(
                            Text(dayFrozen ? "Day Freezed" : "Freeze day")
                                .foregroundColor(.white)
                                .font(.headline)
                        )
                }
                .padding(.top, 20)
                .disabled(dayFrozen || freezeCount >= maxFreezesPerMonth)
                
                // Freeze Count Info
                Text("\(freezeCount) out of \(maxFreezesPerMonth) freezes used")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.top, 10)
                
                Spacer()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
}

#Preview {
    LogdayPage()
}
