
import FirebaseFirestore
import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile........")
                }
            } //: VSTACK
            .navigationTitle("Profile")
        } //: Navigation
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
        //Info
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Name")
                        .bold()
                    Text(user.name)
                }
                .padding()
                HStack {
                    Text("Email")
                        .bold()
                    Text(user.email)
                }
                .padding()
                HStack {
                    Text("Member Since")
                        .bold()
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                }
                .padding()
            }
        }
        .padding()
        //Sign Out
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        Spacer()
    }
}

#Preview {
    ProfileView()
}
