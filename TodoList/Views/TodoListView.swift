
import FirebaseFirestore
import SwiftUI

struct TodoListView: View {
    
    @StateObject var viewModel: TodoListViewViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                List(items) { item in
                    TodoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            } //: VSTACK
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    //Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        } //: Navigation
    }
}

#Preview {
    TodoListView(userId: "xvZq3PNxMiNy66ZnlaIDrDTzYOI3")
}
