//
//  Login.swift
//  Qesh-swift
//
//  Created by Amir Khan on 05/12/2023.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var otp: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView(showsIndicators: false){
                    VStack {
                        Image("ForgotPasswordBanner")
                            .padding()
                    }
                    
                    VStack(alignment: .leading, content: {
                            Typography(text: "Reset\npassword?", fontSize: 35, customFontName: "Inter-ExtraBold", bottomPadding: 7)
                            
                            Typography(text: "Enter OTP code that we have sent to your\nemail JohnDoe56@Example.com" ,textColor: "Secondary", fontSize: 12)
                            
                            VStack {
                                InputField(text: $otp, placeholder: "OTP")
                             
                                PasswordField(text: $password, placeholder: "Password")
                                
                                PasswordField(text: $confirmPassword, placeholder: "Confirm Password")
                            }
                            .padding(.top, 40)
                            .padding(.bottom, 18)
                            
                            Spacer()
                        
                        PrimaryButton(text: "Reset Password", callBack: {
                            presentationMode.wrappedValue.dismiss()
                        })
                            
                            
                    })
                }.padding(.horizontal, 18)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ResetPasswordView()
}
