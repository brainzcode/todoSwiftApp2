//
//  NoItemsView.swift
//  TodoApp2-0
//
//  Created by SOG on 7/7/22.
//

import SwiftUI

struct NoItemsView: View {
		
		@State var animate: Bool = false
		let secondaryAccentColor = Color("SecondaryAccentColor")
		
    var body: some View {
				ScrollView {
						VStack(spacing: 10) {
								Text("There are no Items!")
										.font(.title)
										.fontWeight(.semibold)
								Text("Being able to effectively manipulate data in your application is extremely important. Before displaying content on the screen, you will (almost always) want to organize the data to show specific...")
										.padding(.bottom, 20)
								
								NavigationLink(
										destination: AddView()) {
												Text("Add Something 🥳🎉")
														.foregroundColor(.white)
														.font(.headline)
														.frame(height: 55)
														.frame(maxWidth: .infinity)
														.background(animate ? secondaryAccentColor : Color.accentColor)
														.cornerRadius(10)
										}
										.padding(.horizontal, animate ? 30 : 50)
										.shadow(
												color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
												radius: animate ? 30 : 10,
												x: 0,
												y: animate ? 50 : 30)
										.scaleEffect(animate ? 1.1 : 1.0)
										.offset(y: animate ? -7 : 0)
						}
						.frame(maxWidth: 400)
						.multilineTextAlignment(.center)
						.padding(40)
						.onAppear(perform: addAnimation)
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
		
		func addAnimation() {
				guard !animate else { return }
				DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
						withAnimation(
								Animation
										.easeInOut(duration: 3.0)
										.repeatForever()
						) {
								animate.toggle()
						}
				}
		}
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
				NavigationView {
						NoItemsView()
								.navigationTitle("Title")
				}
    }
}
