import SwiftUI
import Combine

struct FormView: View {
    @ObservedObject var viewModel = FormViewModel()
    
    var body: some View {
        VStack {
            TextField("Username", text: $viewModel.username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $viewModel.password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Login") {
                if viewModel.isFormValid {
                    print("Login successful!")
                } else {
                    print("Please fill in all fields.")
                }
            }
            .padding()
            .disabled(!viewModel.isFormValid)
        }
        .padding()
    }
}


class FormViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isFormValid: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        Publishers.CombineLatest($username, $password)
            .map { username, password in
                !username.isEmpty && !password.isEmpty
            }
            .assign(to: \.isFormValid, on: self)
            .store(in: &cancellables)
    }
}
