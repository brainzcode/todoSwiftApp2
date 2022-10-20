//
//  AddView.swift
//  TodoApp2-0
//
//  Created by SOG on 7/6/22.
//

import SwiftUI

struct AddView: View {
		
		@Environment(\.presentationMode) var presentationMode
		@EnvironmentObject var listViewModel: ListViewModel
		@State var textFieldText: String = ""
		
		@State var alertTitle: String = ""
		@State var showAlert: Bool = false
		
    var body: some View {
				ScrollView {
						VStack {
								TextField("Type something here", text: $textFieldText)
										.padding(.horizontal)
										.frame(height: 55)
										.background(Color(UIColor.secondarySystemBackground))
										.cornerRadius(10)
								
								Button {
										savedButtonPressed()
								} label: {
										Text("Save".uppercased())
												.font(.headline)
												.frame(height: 55)
												.frame(maxWidth: .infinity)
												.foregroundColor(.white)
												.background(Color.accentColor)
												.cornerRadius(10)
								}

						}
						.padding(14)
								
				}
				.navigationTitle(("Add an Item 🖊"))
				.alert(isPresented: $showAlert) {
						getAlert()
				}
    }
		
		func savedButtonPressed() {
				if textIsAppropriate() {
						listViewModel.addItem(title: textFieldText)
						presentationMode.wrappedValue.dismiss()
				}
		}
		
		func textIsAppropriate() -> Bool {
				if textFieldText.count < 3 {
						alertTitle = "Your new todo item must be at least 3 characters long!!! 😰😰"
						showAlert.toggle()
						return false
				}
				return true
		}
		
		func getAlert() -> Alert {
				return Alert(title: Text(alertTitle))
		}
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
				NavigationView {
						AddView()
				}
				.environmentObject(ListViewModel())
    }
}
