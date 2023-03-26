//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct MainView: View
{
	@ObservedObject	var TVShowVM = TVShowViewModel()
	
    @State var IMDB_ID = ""
    var body: some View
	{

		NavigationStack
        {

            List
            {
                //  Input data
                Section
                {
                    HStack
                    {
                        Text("IMDB ID: ")
                        TextField(IMDB_ID, text: $IMDB_ID)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                        
                    }
                }
                
                //  Data from the feed
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
                
                
                Section
                {
                    HStack
                    {
                        Spacer()
                        Text("Update Feed").bold()
                        Spacer()
                    }.onTapGesture
                    {
                        TVShowVM.setURL(IMDBid: IMDB_ID)
                        Task
                        {
                            await TVShowVM.fetchData()
                        }
                        print(TVShowVM.TVShowResults)
                    }

                    .listRowBackground(Color.green)
                    
                        
                    
                }
                
                
                //  Test data to send new feeds to parse
                Section(header: Text("IMDB ID's of Interest to test with"))
                {
                    Text("Clone Wars:   tt0458290").onTapGesture
                    {
                            IMDB_ID = "tt0458290"
                    }
                    Text("Rebels:   tt2930604").onTapGesture
                    {
                            IMDB_ID = "tt2930604"
                    }
                    Text("The Bad Batch:    tt12708542").onTapGesture
                    {
                            IMDB_ID = "tt12708542"
                    }
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
