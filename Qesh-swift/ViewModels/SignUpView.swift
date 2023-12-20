//
//  SignUpView.swift
//  Qesh-swift
//
//  Created by Amir Khan on 11/12/2023.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var userName :String = ""
    @State private var email :String = ""
    @State private var password :String = ""
    @State private var confirmPassword :String = ""
    @State private var phoneNumber :String = ""
    
    var body: some View {
        NavigationStack {
            VStack{
                ScrollView(showsIndicators: false){
                    VStack{
                        Image("LoginBanner")
                            .padding()
                    }
                    
                    VStack(alignment: .leading, content:  {
                        Typography(text: "Sign Up", fontSize: 25, customFontName: "Inter-Black", bottomPadding: 7)
                        
                        Typography(text: "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem." ,textColor: "Secondary", fontSize: 12)
                        VStack {
                            formWrapper
                        }.padding(.top, 30)
                    })
                    
                    VStack{
                        PrimaryButton(text: "Sign Up")
                    }.padding(.top, 46)
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                        Typography(text: "Joined us Before?", customFontName: "Inter-ExtraLight")
                        Typography(text: "Sign In", textColor: "Primary", customFontName: "Inter-ExtraBold", leadingPadding: -2)
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                    }).padding(.top, 18)
                }
            }.padding(.horizontal, 18)
        }.navigationBarBackButtonHidden(true)
    }
    
    var formWrapper : some View {
        Group {
            InputField(text: $userName, placeholder: "Name", leadinIconImage: "PersonSquareIcon")
            InputField(text: $email, placeholder: "Email")
            PasswordField(text: $password, placeholder: "Password")
            PasswordField(text: $confirmPassword, placeholder: "Confirm Password")
            InputField(text: $phoneNumber, placeholder: "Phone Number", leadinIconImage: "PhoneFillIcon")
        }
    }
}

#Preview {
    SignUpView()
}
