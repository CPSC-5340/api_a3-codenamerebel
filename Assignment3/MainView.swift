//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct MainView: View {
    var body: some View
	{
		
		NavigationStack
		{
			List
			{
				Text("name")
				Text("Summary")
				Text("Type")
				Text("Language")
				
				NavigationLink("Genres")
				{
					//  View for the Generes will go here
				}
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
