
//import Foundation
//import Firebase
//import FirebaseAuth
//import FirebaseFirestore
//
//let USER_COLLECTION_NAME = "users"
//enum AuthError: Error {
//    case unexpectedError
//    case signInError
//    case signOutError
//    case createUserError
//    case fetchUsersError
//    case deleteUserError
//    case noCurrentUser
//    case noUserData
//    case invalidUserData
//}
//
//// Thank you to StackOverflow for help with @MainActor. Before was getting issue that "Publishing changes from background threads is not allowed": https://stackoverflow.com/questions/61108947/swiftui-make-sure-to-publish-values-from-the-main-thread-via-operators-like-r
//@MainActor class AuthViewModel: ObservableObject {
//    private let db = Firestore.firestore()
//    
//    //firebase variables
//    @Published var userSession: Firebase.User?
//    @Published var currentUser: User?
//    @Published var needsAuthentification: Bool = true
//    @Published var showDeletionMessage = false
//    @Published var deletionMessage: String = ""
//    @Published var error: Error?
//    
//    //user model variables
//    var username: String = ""
//    var displayName: String = ""
//    var email: String = ""
//    var password: String = ""
//    var showPassword = false
//    
//    var showPasswordToggle: Bool {
//        get { showPassword }
//        set { showPassword = newValue }
//    }
//    
//    //all functions
//    
//    init() {
//        self.userSession = Auth.auth().currentUser
//        
//        Task {
//            do {
//                try await fetchUser()
//            } catch {
//                throw error
//            }
//        }
//    }
//    
//    func signIn(withEmail email: String, password: String) async throws {
//        do {
//            let result = try await Auth.auth().signIn(withEmail: email, password: password)
//            self.userSession = result.user
//            do {
//                try await fetchUser()
//            } catch {
//                throw error
//            }
//            
//        } catch {
//            throw AuthError.signInError
//        }
//    }
//    
//    func createUser(withEmail email: String, password: String, displayName: String) async throws {
//        do {
//            //creates the user via firebase authentification
//            let result = try await Auth.auth().createUser(withEmail: email, password: password)
//            self.userSession = result.user
//            let user = User(id: result.user.uid, username: username, displayName: displayName, email: email)
//            let encodedUser = try Firestore.Encoder().encode(user)
//            
//            //adding user to firestore database collection
//            try await db.collection(USER_COLLECTION_NAME).document(user.id).setData(encodedUser)
//            
//            //need to fetch the user to be able to use it in the app
//            do {
//                try await fetchUser()
//            } catch {
//                throw error
//            }
//        } catch {
//            throw AuthError.signOutError
//        }
//    }
//    
//    func fetchUser() async throws {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        
//        guard let snapshot = try? await db.collection(USER_COLLECTION_NAME).document(uid).getDocument() else { return }
//        self.currentUser = try? snapshot.data(as: User.self)
//        
//        if self.currentUser?.displayName == nil {
//            throw AuthError.fetchUsersError
//        }
//    }
//    
//    //credits: Raihana's last assignment
//    func deleteAccount() async throws {
//        guard let user = Auth.auth().currentUser else {
//            throw AuthError.noCurrentUser
//        }
//        
//        do {
//            try await db.collection(USER_COLLECTION_NAME).document(user.uid).delete()
//            try await user.delete()
//            
//            //resetting local user session data
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                self.showDeletionMessage = true
//                self.deletionMessage = "Your account has been successfully deleted. All information has been cleared."
//                self.userSession = nil
//                self.currentUser = nil
//                self.needsAuthentification = true
//            }
//        } catch {
//            self.showDeletionMessage = true
//            throw AuthError.deleteUserError
//        }
//    }
//    
//    func signOut() async throws {
//        do {
//            try Auth.auth().signOut()
//            self.userSession = nil
//            self.currentUser = nil
//            self.email = ""
//            self.username = ""
//            self.displayName = ""
//            self.password = ""
//        } catch {
//            throw AuthError.signOutError
//        }
//    }
//}
//
//protocol AuthenticationFormProtocol {
//    var formValid: Bool { get }
//}
