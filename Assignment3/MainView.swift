//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct MainView: View
{
	@ObservedObject	var TVShowVM = TVShowViewModel()
	
    var body: some View
	{
		NavigationStack
		{
			List
			{
				Text(TVShowVM.TVShowResults.n)
				Text("Type")
				Text("Language")
				
				NavigationLink("Genres")
				{
					//  View for the Generes will go here
				}
			}.task
			{await
				TVShowVM.fetchData()
				
				print(TVShowVM.TVShowResults)
				
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
