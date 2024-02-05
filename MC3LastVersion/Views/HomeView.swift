//
//  HomeView.swift
//  MC3LastVersion
//
//  Created by Abrar Ghandurah on 23/07/1445 AH.
//

import SwiftUI

struct HomeView: View {
    //Creating an array for categories
    let CategoriesArray = ["تمشية","انجاز","انجاز مهام","الترفيه","مطاعم","مقاهي"]
    @State private var searchText = ""
    @State private var selectedCategoryIndex: Int?
    //@ObservedObject var placeModel: Model
    @State private var selectedPlace: place?
    
    var body: some View {
        
        
        VStack{
            HStack{
                
                Text("")
                Text("وين ودّك تروح اليوم؟")
                    .font(
                        Font.custom("SF Arabic", size: 25)
                            .weight(.bold)
                    )
                    .foregroundColor(.customBackground)
                    .padding(.trailing,140)
                
            }//HStack
            
            
            //Replace with Searchable
            TextField(" مقاهي، مطاعم ، جلسات خارجية", text: $searchText)
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(Color(.systemGray6))
                .cornerRadius(15)
                .font(.system(size: 14))
                .foregroundColor(.black)
                .frame(width:350)
                .padding(.bottom, 150)
            
            
            
            
            //MARK: First Section
            Text("الهبّة")
                .font(
                    Font.custom("SF Arabic", size: 25)
                        .weight(.semibold)
                )
                .offset(x: -140 , y: -90)
//                .onAppear{
//                    Task{
//                        do{
//                            try await placeModel.fetchItems()
//                        }catch{
//                            print("Error fetching items:: \(error)")
//                        }
//                    }
//                }
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack (spacing: 15)  {
                    //ForEach(placeModel.places){ place in
                    ZStack{
                        //Replace with images from the database , use a for loop
                        
                        Image("mg6")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 145 , height: 200 )
                        
                            .offset(x: 5 , y: 20)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 145, height: 40)
                            .background(.white.opacity(0.8))
                        
                            .cornerRadius(5)
                        
                        
                            .offset(x: 5 , y:75 )
                        
                    }//Zstack
//                    .onTapGesture {
//                        selectedPlace = place
//                    }
                }//HStack
            }//ScrollView
        //}forEach

            
            
            
//MARK: Second Section
            
            Text("التصنيفات")
                .font(
                    Font.custom("SF Arabic", size: 25)
                        .weight(.semibold)
                )
                .offset(x: -120 , y: 10)
            
            
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(0..<CategoriesArray.count) { index in
                    Text(CategoriesArray[index])
                        .font(Font.custom("SF Arabic", size: 12))
                        .multilineTextAlignment(.center)
                        .foregroundColor(index == selectedCategoryIndex ? .white : .black)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(index == selectedCategoryIndex ? Color.customBackground : Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(index == selectedCategoryIndex ? Color.accentColor : Color.customBackground, lineWidth: 1)
                                )
                        )
                        .onTapGesture {
                            // Toggle the selected state
                            if selectedCategoryIndex == index {
                                selectedCategoryIndex = nil
                            } else {
                                selectedCategoryIndex = index
                            }
                            
                            // Perform an action based on the tapped category
                            let tappedCategory = CategoriesArray[index]
                            print("Tapped category: \(tappedCategory)")
                        }
                }
            }
        }//ScrollView
        .padding(.bottom , 140)
    

        }//vstack
        //.padding(.bottom , 145)
        .environment(\.layoutDirection,.rightToLeft)
    }//body
       
}//HomeView


#Preview {
HomeView()

}
