//
//  GreetPage.swift
//  Learning
//
//  Created by shaden  on 17/04/1446 AH.
//

import SwiftUI

struct GreetPage: View {
    @State private var UserInput: String = "Swift"
       @State private var Duration = "Month"
       
       var body: some View {
           VStack(spacing: 30) {
               ZStack {
                   Circle()
                       .fill(Color.gray.opacity(0.3))
                       .frame(width: 120, height: 120)
                   
                   Text("🔥")
                       .font(.system(size: 50))
               }
               .padding(.top, 80)
               
               VStack(alignment: .leading, spacing: 3) {
                   Text("Hello Learner!")
                       .font(.system(size: 32, weight: .bold))
                       .foregroundColor(.white)
                   
                   Text("This app will help you learn everyday")
                       .font(.system(size: 16))
                       .foregroundColor(Color.white.opacity(0.3))
               }
               
               
               VStack(alignment: .leading, spacing: 10) {
                   Text("I want to learn")
                       .font(.system(size: 18, weight: .bold))
                       .foregroundColor(.white)
                   
                   TextField("Swift", text: $UserInput)
                       .padding()
                       .background(Color.black)
                       .cornerRadius(8)
                       .foregroundColor(.gray)
                   Divider()
                       .background(Color.gray)
               }
               .padding(.horizontal, 30)
               
               VStack(alignment: .leading, spacing: 10) {
                   Text("I want to learn it in a")
                       .font(.system(size: 18, weight: .bold))
                       .foregroundColor(.white)
                   
                   HStack(spacing: 16) {
                       
                       Button(action: {
                           Duration = "Week"
                           
                       }) {
                           Text("Week")
                               .frame(width: 80, height: 40)
                               .background(Duration == "Week" ? Color.orange : Color.gray.opacity(0.3))
                               .foregroundColor(Duration == "Week" ? .black : .orange)
                               .cornerRadius(10)
                       }
                       
                       Button(action: {
                           Duration = "Month"
                       }) {
                           Text("Month")
                               .frame(width: 80, height: 40)
                               .background(Duration == "Month" ? Color.orange : Color.gray.opacity(0.3))
                               .foregroundColor(Duration == "Month" ? .black: .orange)
                               .cornerRadius(10)
                       }
                       
                       Button(action: {
                           Duration = "Year"
                       }) {
                           Text("Year")
                               .frame(width: 80, height: 40)
                               .background(Duration == "Year" ? Color.orange : Color.gray.opacity(0.3))
                               .foregroundColor(Duration == "Year" ? .black : .orange)
                               .cornerRadius(10)
                       }
                   }
               }
               .padding(.horizontal, 30)
               
               Button(action: {
                   
                   
               }) {
                   HStack {
                       Text("Start")
                           .fontWeight(.bold)
                       Image(systemName: "arrow.right")
                   }
                   .foregroundColor(.black)
                   .frame(maxWidth: 150, minHeight: 55)
                   
                   .background(Color.orange)
                   .cornerRadius(5)
               }
               .padding(.horizontal, 30)
               .padding(.top, 20)
               
               Spacer()
           }
           .background(Color.black.edgesIgnoringSafeArea(.all))
           
       }
   
}

#Preview {
    GreetPage()
}
