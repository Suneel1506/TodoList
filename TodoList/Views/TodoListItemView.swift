
import SwiftUI

struct TodoListItemView: View {
    
    @StateObject var viewModel = TodoListItemViewViewModel()
    
    let item: TodoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
        
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            } //: VSTACK
            Spacer()
            
            Button(action: {
                viewModel.toggleIsDone(item: item)
            }, label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            })
        } //: HSTACK
    }
}

#Preview {
    TodoListItemView(item: .init(id: "123",
                                 title: "Get milk",
                                 dueDate: Date().timeIntervalSince1970,
                                 createdDate: Date().timeIntervalSince1970,
                                 isDone: true))
}
