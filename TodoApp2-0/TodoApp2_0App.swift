//
//  TodoApp2_0App.swift
//  TodoApp2-0
//
//  Created by SOG on 7/6/22.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - Manages Models for View

 */

@main
struct TodoApp2_0App: App {
		
		@StateObject var listViewModel: ListViewModel = ListViewModel()
		
    var body: some Scene {
        WindowGroup {
						NavigationView {
								ListView()
						}
						.navigationViewStyle(.stack)
						.environmentObject(listViewModel)
        }
    }
}
