//
//  SFont.swift
//  ChowChow
//
//  Created by Swapnil on 17/09/23.
//


import SwiftUI

enum FontType: String {
    case bold = "NotoSans-Bold"
    case medium = "NotoSans-Medium"
    case regular = "NotoSans-Regular"
}

struct SFont: ViewModifier {
    
    var type: FontType
    var size: CGFloat
    
    init(_ type: FontType = .regular, size: CGFloat = 16) {
        self.type = type
        self.size = size
    }
    
    func body(content: Content) -> some View {
        content.font(Font.custom(type.rawValue, size: size))
    }
    
}

