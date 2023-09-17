//
//  Color+Extension.swift
//  ChowChow
//
//  Created by Swapnil on 17/09/23.
//

import SwiftUI

extension Color {
    
    static let mainColor = Color("mainColor")
    static let primaryColor = Color("primary")
    static let secondaryColor = Color("secondary")
    static let textPrimaryColor = Color("textPrimaryColor")
    
    static let redColor = Color(UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 1.0))
    static let blueColor = Color(UIColor(red: 0/255, green: 106/255, blue: 246/255, alpha: 1.0))
    static let greenColor = Color(hex: "#00D100", alpha: 1)
    
    static let redColorTrans = Color(UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 0.1))
    static let blueColorTrans = Color(UIColor(red: 0/255, green: 106/255, blue: 246/255, alpha: 0.1))
    static let greenColorTrans = Color(hex: "#00D100", alpha: 0.1)
    
    init(hex: String, alpha: Double = 1) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) { cString.remove(at: cString.startIndex) }
        
        let scanner = Scanner(string: cString)
        scanner.currentIndex = scanner.string.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        self.init(.sRGB, red: Double(r) / 0xff, green: Double(g) / 0xff, blue:  Double(b) / 0xff, opacity: alpha)
    }
}
