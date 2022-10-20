//
//  ListView.swift
//  TodoApp2-0
//
//  Created by SOG on 7/6/22.
//

import SwiftUI

struct ListView: View {
		
		@EnvironmentObject var listViewModel: ListViewModel
		
    var body: some View {
				ZStack {
						if listViewModel.items.isEmpty {
								NoItemsView()
										.transition(AnyTransition.opacity.animation(.easeIn(duration: 0.9)))
						} else {
								List {
										ForEach(listViewModel.items) { item in
												ListRowView(item: item)
														.onTapGesture {
																withAnimation(.linear) {
																		listViewModel.updateItem(item: item)
																}
														}
										}
										.onDelete(perform: listViewModel.deleteItem)
										.onMove(perform: listViewModel.moveItem)
								}
						}
								}
				.navigationTitle("Todo List ✍️")
				.toolbar {
						ToolbarItem(placement: .navigationBarLeading) {
								EditButton()
						}
						ToolbarItem(placement: .navigationBarTrailing) {
								NavigationLink("Add") {
										AddView()
								}
						}
				}
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
				NavigationView {
						ListView()
				}
				.environmentObject(ListViewModel())
    }
}


