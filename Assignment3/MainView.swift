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
                    Text(TVShowVM.TVShowResults.name)
                    Text(TVShowVM.TVShowResults.type)
                    Text(TVShowVM.TVShowResults.language)
                    
                    NavigationLink("Genres")
                    {
                        
                        List(TVShowVM.TVShowResults.genres, id: \.self)
                        { genre in
                            Text(genre)
                        }
                        
                        
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
