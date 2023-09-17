//
//  DetailsView.swift
//  ChowChow
//
//  Created by Swapnil on 17/09/23.
//

import SwiftUI

struct DetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var viewModel: DetailsViewModel
    
    init(model: FoodModel) {
        viewModel = DetailsViewModel(model: model)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primaryColor.edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ZStack(alignment: .top) {
                            Image(viewModel.model.image).resizable().scaledToFill()
                                .frame(height: 300).frame(maxWidth: UIScreen().bounds.width)
                                .scaledToFit()
                            HStack {
                                Button(action: { self.presentationMode.wrappedValue.dismiss() },
                                       label: { Image.iconBackArrow.resizable().frame(width: 34, height: 34) })
                                .background(Color.black.opacity(0.3))
                                .cornerRadius(17)
                                Spacer()
                                Button(action: { viewModel.favouriteMethod() },
                                       label: { Image.iconFav.resizable().frame(width: 26, height: 26) })
                            }.padding(.horizontal, 24).padding(.top, 46)
                        }
                        Group {
                            HStack {
                                Text(viewModel.model.name).modifier(SFont(.bold,size: 24)).lineLimit(1)
                                    .foregroundColor(Color.textPrimaryColor)
                                Spacer()
                                FoodTypeView(isVeg: viewModel.model.type == "Veg.")
                            }.padding(.vertical, 8)
                            
                            HStack(alignment: .center) {
                                HStack(alignment: .center, spacing: 2) {
                                    Image.iconLocation.resizable().frame(width: 24, height: 24)
                                    Text("\(viewModel.model.location) away").modifier(SFont(.regular,size: 14))
                                        .foregroundColor(Color.textPrimaryColor).padding(.top, 2)
                                }
                                Spacer()
                                Text("\(viewModel.model.country) - Food").modifier(SFont(.regular,size: 14))
                                    .lineLimit(1).foregroundColor(Color.textPrimaryColor)
                            }
                            
//                            HStack {
//                                Text("12 min ago").modifier(SFont(.regular,size: 14))
//                                    .foregroundColor(Color.textPrimaryColor)
//                                Spacer()
//                            }.padding(.leading, 6).padding(.top, 2)
                            
                            VStack(spacing: 16) {
                                HStack {
                                    Text("About Dish").modifier(SFont(.bold,size: 18))
                                        .foregroundColor(Color.textPrimaryColor)
                                    Spacer()
                                }
                                Text(viewModel.model.about).modifier(SFont(.regular,size: 16))
                                    .foregroundColor(Color.textPrimaryColor)
                            }.padding(.vertical, 16)
                            
                            VStack(spacing: 16) {
                                HStack {
                                    Text("Info").modifier(SFont(.bold,size: 18))
                                        .foregroundColor(Color.textPrimaryColor)
                                    Spacer()
                                }
                                HStack(spacing: 8) {
                                    DetailsInfoView(primary: "\(viewModel.model.rate)", secondary: "Rating")
                                    DetailsInfoView(primary: "\(viewModel.model.calories)", secondary: "Cal.")
                                    DetailsInfoView(primary: "\(viewModel.model.time)", secondary: "Prep. Time")
                                    
                                }
                            }.padding(.vertical, 16)
                            
                            VStack(spacing: 16) {
                                HStack {
                                    Text("Restaurant Info").modifier(SFont(.bold,size: 18))
                                        .foregroundColor(Color.textPrimaryColor)
                                    Spacer()
                                }
                                RestaurantDetailView(image: viewModel.model.restaurant.image, name: viewModel.model.restaurant.name, bio: viewModel.model.restaurant.bio, messageMethod: viewModel.messageMethod)
                            }.padding(.vertical, 16)
                            
                            Button(action: { viewModel.callMethod() },
                                   label: { Text("Call Restaurant").modifier(SFont(.medium,size: 16)).foregroundColor(.white) })
                                .frame(height: 50).frame(maxWidth: .infinity)
                                .background(Color.mainColor).cornerRadius(8)
                                .padding(.vertical, 24)
                            
                        }.padding(.horizontal, 16).padding(.top, 8)
                    }.background(Color.primaryColor)
                    
                    Spacer()
                    Spacer().frame(height: 150)
                }
                .edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct RestaurantDetailView: View {
    var image: String, name: String, bio: String
    var messageMethod: () -> ()
    var body: some View {
        HStack {
            Image(image).resizable().scaledToFill().frame(width: 60, height: 60).cornerRadius(30)
            VStack(alignment: .leading, spacing: 8) {
                Text(name).modifier(SFont(.medium,size: 16))
                    .foregroundColor(Color.textPrimaryColor)
                Text(bio).modifier(SFont(.regular,size: 14))
                    .foregroundColor(Color(hex: "828282"))
            }.padding(.leading, 8)
            Spacer()
            Button(action: { self.messageMethod() },
                   label: { Image.iconMSG.resizable().frame(width: 20, height: 20) })
                .frame(width: 45, height: 45).background(Color.mainColor).cornerRadius(25)
        }
    }
}

struct DetailsInfoView: View {
    var primary: String, secondary: String
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 8) {
                Text(primary).modifier(SFont(.medium,size: 16))
                    .foregroundColor(Color.textPrimaryColor)
                Text(secondary).modifier(SFont(.regular,size: 12))
                    .foregroundColor(Color(hex: "828282"))
            }
            Spacer()
        }
        .padding(.vertical, 12)
        .background(Color.secondaryColor)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "DDDDDD"), lineWidth: 0.25)
        )
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailsView(model: FoodData.food[0])
        }
    }
}
