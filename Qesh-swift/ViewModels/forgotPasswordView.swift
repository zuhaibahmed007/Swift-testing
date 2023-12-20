//
//  Login.swift
//  Qesh-swift
//
//  Created by Amir Khan on 05/12/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView(showsIndicators: false){
                    VStack {
                        Image("ForgotPasswordBanner")
                            .padding()
                    }
                    
                    VStack(alignment: .leading, content: {
                            Typography(text: "Forgot\nPassword?", fontSize: 35, customFontName: "Inter-ExtraBold", bottomPadding: 7)
                            
                            Typography(text: "Don’t worry! It happens, Please enter your\naddress associated with your Account." ,textColor: "Secondary", fontSize: 12)
                            
                            VStack {
                                InputField(text: $email, placeholder: "Email")
                            }
                            .padding(.top, 40)
                            .padding(.bottom, 18)
                            
                            Spacer()
                        
                            NavigationLink(destination: ResetPasswordView(), label: {
                                    PrimaryButton(text: "Submit", isDisabled: true)
                            })
                            
                    })
                }.padding(.horizontal, 18)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ForgotPasswordView()
}
