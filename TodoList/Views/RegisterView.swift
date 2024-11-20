
import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        
        VStack {
            // Header
            HeaderView(title: "Register",
                       subtitle: "Start organizing todos",
                       angle: -15,
                       backgroundColor: .orange)
            // Register Form
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account",
                         backgroundColor: .green
                ) {
                    //Attempt Registration
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -50)
            Spacer()
        } //: VSTACK
    }
}

#Preview {
    RegisterView()
}
