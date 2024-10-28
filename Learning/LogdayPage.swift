//
//  LogdayPage.swift
//  Learning
//
//  Created by shaden  on 19/04/1446 AH.
//
import SwiftUI

struct LogdayPage: View {
    @StateObject private var vm = LearningViewModel()
    
    let daysOfWeek = LearningViewModel.capitalizedFirstThreeLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)

    var body: some View {
        VStack {
            // Date above the title
            HStack {
                Text(vm.getFormattedDate(vm.date)) // Using vm.date instead of Date()
                    .foregroundColor(.gray.opacity(0.4))
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }

            // Header Section with Title and Flame Icon
            HStack {
                Text("Learning Swift")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                NavigationLink(destination: UpdatePage(viewModel: vm).navigationBarBackButtonHidden(true)) {
                    Circle()
                        .fill(Color.darkGray)
                        .frame(width: 50, height: 50)
                        .overlay(
                            Text("🔥")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                        )
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)

            // Integrated Calendar View
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 390, height: 240)
                        .cornerRadius(9)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )

                    VStack {
                        HStack(spacing: 150) {
                            HStack {
                                Text(vm.formattedDate(vm.date))
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                            }

                            HStack(spacing: 20) {
                                Button(action: { vm.changeWeek(by: -1) }) {
                                    Image(systemName: "chevron.backward")
                                        .font(.system(size: 20))
                                        .bold()
                                        .foregroundColor(.orange)
                                }
                                Button(action: { vm.changeWeek(by: 1) }) {
                                    Image(systemName: "chevron.forward")
                                        .font(.system(size: 20))
                                        .bold()
                                        .foregroundColor(.orange)
                                }
                            }
                        }

                        HStack {
                            LazyVGrid(columns: Array(columns.prefix(7)), content: {
                                ForEach(0..<7, id: \.self) { index in
                                    let day = vm.getDateForDay(index) // Using ViewModel's date method
                                    let isToday = Calendar.current.isDateInToday(day)
                                    let status = vm.dateStatuses[day] ?? "none"
                                    let isLearned = status == "learned"
                                    let isFrozen = status == "frozen"

                                    VStack(spacing: 14) {
                                        Text(daysOfWeek[index])
                                            .font(.system(size: 12))
                                            .bold()
                                            .foregroundColor(isToday ? Color.white : Color.gray.opacity(0.4))

                                        Text(day.formatted(.dateTime.day()))
                                            .font(.system(size: 19))
                                            .foregroundColor(isToday ? Color.orange : Color.white)
                                            .bold()
                                            .background(
                                                Circle()
                                                    .fill(isLearned ? Color.green.opacity(0.2) : isFrozen ? Color.blue.opacity(0.2) : Color.clear)
                                                    .frame(width: 35, height: 35)
                                            )
                                    }
                                }
                            })
                        }

                        Divider()
                            .background(Color.gray)
                            .frame(width: 390)
                            .padding(.vertical, 10)

                        HStack {
                            VStack {
                                Text("\(vm.streakCount)🔥")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("Day streak")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Divider()
                                .background(Color.gray)
                                .frame(height: 60)
                                .padding(.horizontal, 50)
                            VStack {
                                Text("\(vm.freezeCount)🧊")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("Day frozen")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .onAppear(perform: vm.updateCalendarDays)
            .padding(.top, 0)

            // Log Today Button
            Button(action: vm.toggleLogDay) {
                Circle()
                    .fill(vm.dayFrozen ? Color.blue : (vm.dayLogged ? Color.brown : Color.orangeL))
                    .frame(width: 250, height: 250)
                    .overlay(
                        Text(vm.dayFrozen ? "Day Frozen" : (vm.dayLogged ? "Learned Today" : "Log today as Learned"))
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .bold()
                    )
            }
            .padding(.top, 20)
            .disabled(vm.dayFrozen)

            // Freeze Day Button
            Button(action: vm.toggleFreezeDay) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(vm.dayFrozen ? Color.gray : Color.blue)
                    .frame(width: 150, height: 50)
                    .overlay(
                        Text("Freeze day")
                            .foregroundColor(.white)
                            .font(.headline)
                    )
            }
            .disabled(vm.dayLogged)
            .padding(.top, 10)

            Text("\(vm.freezeCount) out of \(vm.maxFreezesPerMonth) freezes used")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.top, 10)

            Spacer()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct LogdayPage_Previews: PreviewProvider {
    static var previews: some View {
        LogdayPage()
    }
}
