
import FirebaseFirestore
import Foundation

/// ViewModel for list of items View
/// Primary tab
class TodoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete TodoList Item
    /// - Parameter id: item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("todos").document(id).delete()
    }
}
