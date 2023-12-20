//
//  PrimaryButton.swift
//  Qesh-swift
//
//  Created by Amir Khan on 04/12/2023.
//

import SwiftUI

struct PrimaryButton : View {
    
    var text: String
    var customFontName: String
    var bgColor: String
    var textcolor: String
    var textAlignment: Alignment
    var fontSize: CGFloat
    var topPadding: CGFloat
    var trailingPadding: CGFloat
    var bottomPadding: CGFloat
    var leadingPadding: CGFloat
    var borderRadius : CGFloat
    var isDisabled: Bool
    var callBack: (() -> Void)? // Specify the optional callback parameter

    
    init(text: String? = nil , customFontName: String? = nil, bgColor: String? = nil, textcolor: String? = nil, textAlignment: Alignment? = nil ,fontSize: CGFloat? = nil, topPadding: CGFloat? = nil, trailingPadding: CGFloat? = nil , bottomPadding: CGFloat? = nil, leadingPadding: CGFloat? = nil, borderRadius: CGFloat? = nil, isDisabled: Bool? = nil ,callBack: (()-> Void)? = nil) {
        
        self.text = text ?? "Button"
        self.customFontName = customFontName ?? "Inter-Regular"
        self.bgColor = bgColor ?? "Primary"
        self.textcolor = textcolor ?? "Light"
        self.textAlignment = textAlignment ?? .center
        self.fontSize = fontSize ?? 18
        self.topPadding = topPadding ?? 16
        self.trailingPadding = trailingPadding ?? 0
        self.bottomPadding = bottomPadding ?? 16
        self.leadingPadding = leadingPadding ?? 0
        self.borderRadius = borderRadius ?? 40
        self.isDisabled = isDisabled ?? false
        self.callBack = callBack
    }
    
    var body: some View {
        Button(action: {
            callBack?() // Call the callback function if it's not nil
        }, label: {
            Typography(text: text, textColor: textcolor , fontSize: fontSize, textAlignment: textAlignment )
        })
        .padding(EdgeInsets(top: topPadding, leading: leadingPadding, bottom: bottomPadding, trailing: trailingPadding))
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color(bgColor))
        .cornerRadius(borderRadius)
        .disabled(isDisabled)
    }
}
