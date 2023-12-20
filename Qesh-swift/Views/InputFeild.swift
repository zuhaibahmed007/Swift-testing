import SwiftUI

struct InputField :  View {
    
    @Binding var text: String
    @FocusState private var isFocus: Bool
    
    @State private var isEditing = false
    @State private var isSecure = true
    @State private var xOffset: CGFloat = 30
    @State private var yOffset: CGFloat = 10
    
    var placeholder: String
    var label: String
    var leadingIcon: String
    var leadinIconImage : String
    var trailingIcon: String
    
    init(
         text: Binding<String>,
         placeholder: String? = nil,
         label: String? = nil,
         leadingIcon: String? = nil,
         leadinIconImage: String? = nil,
         trailingIcon: String? = nil
    ) {
        self._text = text
        self.placeholder = placeholder ?? "Placeholder"
        self.label = label ?? "Label"
        self.leadingIcon = leadingIcon ?? "at"
        self.leadinIconImage = leadinIconImage ?? ""
        self.trailingIcon = trailingIcon ?? ""
      }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                HStack {



//                  FOR LOCAL IMAGES
                    if !leadinIconImage.isEmpty {
                        Image(leadinIconImage)
                            .foregroundColor(.gray)
                            .padding(.init(top: 0, leading: 14, bottom: 0, trailing: 18))
                            .frame(width: 16, height: 16)
                    } else {
//                  FOR SYSTEMS ICON
                        if !leadingIcon.isEmpty {
                            Image(systemName: leadingIcon)
                                .foregroundColor(.gray)
                                .padding(.init(top: 0, leading: 14, bottom: 0, trailing: 18))
                                .frame(width: 16, height: 16)
                        }
                    }
                    
//                  CONTENT (TEXT-VIEW)
                    
                    TextField("", text: $text,
                        onCommit: {
                            isEditingChanged(false)
                    })
                    .foregroundColor(Color("Dark"))
                    .focused($isFocus)


//                  FOR SYSTEMS ICON TRIALING
                    if !trailingIcon.isEmpty {
                        Image(systemName: trailingIcon)
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                            .onTapGesture {
                                isSecure.toggle()
                            }
                    }

                }
//               MODIFIRES FOR CONTENT
                .padding(.horizontal, 11)
                .padding(.vertical, 11)
                .border(Color("LightV2"))
                .background(Color("LightV1"))
                .cornerRadius(3.0)

//              PLACEHOLDER (LABEL) DYNAMIC
                Text(placeholder)
                    .foregroundColor(Color("Dark"))
                    .padding(.horizontal, 8)
                    .offset(x: xOffset, y: yOffset)
                    .scaleEffect(isEditing ? 0.8 : 1)
                    .animation(.easeInOut(duration: 0.3), value: isEditing)
            }

//            TAP GUESTER FOR FOUCS INPUT FEILD AND MOVING LABLE TO TOP
            .onTapGesture {
                withAnimation {
                    isEditingChanged(true)
                }
            }


        }.padding(.bottom, 50)
    }
    
    private func isEditingChanged(_ editing: Bool) {
        withAnimation {
            isEditing = editing
            xOffset = editing ? 12 : 30
            yOffset = editing ? -18 : 10
            isFocus = editing
        }
    }
}
