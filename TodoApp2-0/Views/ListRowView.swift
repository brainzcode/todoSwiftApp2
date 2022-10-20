//
//  ListRowView.swift
//  TodoApp2-0
//
//  Created by SOG on 7/6/22.
//

import SwiftUI

struct ListRowView: View {
		
		let item: ItemModel
		
		var body: some View {
				HStack {
						Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
								.foregroundColor(item.isCompleted ? .green : .pink)
						Text(item.title)
						Spacer()
				}
				.font(.title)
				.padding(.vertical, 8)
		}
}

struct ListRowView_Previews: PreviewProvider {
		
		static var item1 = ItemModel(title: "First Item", isCompleted: false)
		static var item2 = ItemModel(title: "Second Item", isCompleted: true)
		
    static var previews: some View {
				Group {
						ListRowView(item: item1)
						ListRowView(item: item2)
				}
				.previewLayout(.sizeThatFits)
    }
				
		
}
