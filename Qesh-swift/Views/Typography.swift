//
//  TextViewModifier.swift
//  Qesh-swift
//
//  Created by Amir Khan on 01/12/2023.
//

import SwiftUI

struct Typography : View {
    
    var text: String
    var textColor: String
    var fontSize: CGFloat
    var customFontName: String
    var textAlignment : Alignment
    var topPadding: CGFloat
    var bottomPadding: CGFloat
    var leadingPadding: CGFloat
    var trailingPadding: CGFloat
    
    init(
         text: String? = nil,
         textColor: String? = nil,
         fontSize: CGFloat? = nil,
         customFontName: String? = nil,
         textAlignment: Alignment? = nil,
         topPadding: CGFloat? = nil,
         bottomPadding: CGFloat? = nil,
         leadingPadding: CGFloat? = nil,
         trailingPadding: CGFloat? = nil
    ) {
        self.text = text ?? "Label"
        self.textColor = textColor ?? "Dark"
        self.fontSize = fontSize ?? 14
        self.customFontName = customFontName ?? "Inter-Regular"
        self.textAlignment = textAlignment ?? .leading
        self.topPadding = topPadding ?? 0
        self.bottomPadding = bottomPadding ?? 0
        self.leadingPadding = leadingPadding ?? 0
        self.trailingPadding = trailingPadding ?? 0
        
    }
    
    var body: some View {
        Text(text)
            .foregroundColor(Color(textColor))
            .font(Font.custom(customFontName, size: fontSize))
            .frame(maxWidth: .none,alignment: textAlignment)
            .padding(EdgeInsets(top: topPadding, leading: leadingPadding, bottom: bottomPadding, trailing: trailingPadding))
    }
}




