
import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses() // @State keeps the object alive
    
    @State private var showingAddExpense = false
    
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal Expenses") {
                    ForEach(expenses.personalExpenses) { item in
                        ItemView(item: item)
                    }
                    .onDelete(perform: removePersonalItems)
                }
                
                Section("Business Expenses") {
                    ForEach(expenses.businessExpenses) { item in
                        ItemView(item: item)
                    }
                    .onDelete(perform: removeBusinessItems)
                }
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        for offset in offsets {
            if let index = expenses.items.firstIndex(where: { $0.id == expenses.businessExpenses[offset].id}) {
                expenses.items.remove(at: index)
            }
        }
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        for offset in offsets {
            if let index = expenses.items.firstIndex(where: { $0.id == expenses.personalExpenses[offset].id}) {
                expenses.items.remove(at: index)
            }
        }
    }
    
}

#Preview {
    ContentView()
}

struct ItemView: View {
    let item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                
                Text(item.type)
            }
            
            Spacer()
            
            Text(item.amount, format: .currency(code: Constants.currency))
                .expenseStyle(for: item)
            
        }
    }
}
