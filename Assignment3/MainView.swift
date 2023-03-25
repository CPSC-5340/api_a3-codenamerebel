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
                Section
                {
                    HStack
                    {
                        Text("IMDB ID: ")
                        //  TextField goes here
                        
                    }
                }
                
                Section
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
                    
                    NavigationLink("Schedule")
                    {
                        List
                        {
                            if(TVShowVM.TVShowResults.schedule?.time == "")
                            {
                                Text("No time listed")
                            }
                            else
                            {
                                Text(TVShowVM.TVShowResults.schedule?.time ?? "No time listed")
                            }
                            
                            NavigationLink("Days")
                            {
                                List
                                 {
                                     ForEach(TVShowVM.TVShowResults.schedule?.days ?? [], id: \.self)
                                    { day in
                                        Text(day)
                                    }
                                }
                            }
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
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
