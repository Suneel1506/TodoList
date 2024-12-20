
import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List",
                           subtitle: "Get things done",
                           angle: 15,
                           backgroundColor: .pink)
                
                // Login Form
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In",
                             backgroundColor: .blue
                    ) {
                        //Attempt Login
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                // Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create New Account", destination: RegisterView())
                } //: VSTACK
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
