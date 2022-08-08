//
//  ContentView.swift
//  iExpense
//
//  Created by Alpay Calalli on 25.07.22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    
    @State private var addExpenseItem = false
    

    
    var body: some View {
        NavigationView{
            List{
                            ForEach(expenses.items){ item in
                                HStack{
                                    VStack(alignment: .leading){
                                        Text(item.name)
                                            .font(.subheadline)
                                        Text(item.type)
                                    }

                                    
                                    Spacer()
                                    
                                    Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                        .foregroundColor(item.amount > 25 ? .red : .blue)
                                        
                                }
                            }
                            .onDelete(perform: deleteRows)
                        }
            .navigationTitle("iExpense")
            .toolbar {
                Button{
                    addExpenseItem = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $addExpenseItem){
                AddView(expenses: expenses)
            }
        }
        
    
    }
    func deleteRows(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
