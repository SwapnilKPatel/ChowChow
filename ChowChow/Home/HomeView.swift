//
//  HomeView.swift
//  ChowChow
//
//  Created by Swapnil on 17/09/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primaryColor.edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Hey Swapnil,").modifier(SFont(.bold, size: 24))
                                    .foregroundColor(Color.textPrimaryColor).padding(.top, 16)
                                Text("Here are world's best dishes for you.").modifier(SFont(.regular, size: 18))
                                    .foregroundColor(Color.textPrimaryColor).padding(.top, 4)
                            }
                            Spacer()
                        }
                        Text("Nearby results").modifier(SFont(.bold, size: 14))
                            .foregroundColor(Color.textPrimaryColor)
                            .padding(.top, 24).padding(.bottom, 8)
                        ForEach(viewModel.foodList) { model in
                            NavigationLink(destination: DetailsView(model: model), label: {
                                HomeListModelView(image: model.image, name: model.name, location: model.location, type: model.type, country: model.country, calories: model.calories).padding(.bottom, 4)
                            })
                        }
                    }
                    Spacer()
                    Spacer().frame(height: 150)
                }
                .padding(.horizontal, 16).padding(.top, 1)
                .navigationBarHidden(true)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


//HomeListModelView(image: model.image, name: model.name, location: model.location, type: model.type, country: model.country, calories: model.calories)
struct HomeListModelView: View {
    
    var image: String, name: String, location: String, type: String, country: String, calories: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(image)
                .resizable().scaledToFill()
                .frame(width: 100, height: 100).cornerRadius(16)
            VStack(alignment: .leading, spacing: 12) {
                Text(name).lineLimit(1).modifier(SFont(.medium,size: 20)).foregroundColor(Color.textPrimaryColor)
                Text("\(calories) cal.").lineLimit(1).modifier(SFont(.regular,size: 14)).foregroundColor(Color.textPrimaryColor)
                HStack(alignment: .center, spacing: 2) {
                    Image.iconLocation.resizable().frame(width: 20, height: 20)
                    Text("\(location) away").modifier(SFont(.regular,size: 14))
                        .foregroundColor(Color.textPrimaryColor).padding(.top, 2)
                }
            }
            Spacer()
            VStack(alignment: .trailing) {
                FoodTypeView(isVeg: type == "Veg.")
                Spacer()
                Text("\(country) - Food").modifier(SFont(.regular,size: 12))
                    .foregroundColor(Color.textPrimaryColor)
            }.padding(.vertical, 4)
        }
        .padding(16)
        .background(Color.secondaryColor)
        .cornerRadius(16)
    }
}

struct FoodTypeView: View {
    var isVeg: Bool
    var body: some View {
        Text(isVeg ? "Veg." : "Non-Veg.").modifier(SFont(.regular,size: 12))
            .foregroundColor(isVeg ? Color.greenColor : Color.redColor)
            .padding(.horizontal, 18).padding(.vertical, 8)
            .background(isVeg ? Color.greenColorTrans : Color.redColorTrans)
            .cornerRadius(12)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
