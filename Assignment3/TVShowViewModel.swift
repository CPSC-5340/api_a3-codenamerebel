//
//  TVShowView.swift
//  Assignment3
//
//  Created by Brad Payne on 3/23/23.
//

import Foundation

class TVShowViewModel : ObservableObject
{
	
	let url = "https://api.tvmaze.com/lookup/shows?imdb=tt0458290"
//	@Published var	TVShowResults = TVShowModel(name: "Test", type: "", language: "", genres: [])
	
	@Published var	TVShowResults = TVShowModel(name: "Test", type: "", language: "", genres: [], schedule: nil)
	
	@MainActor
	func fetchData() async
	{
				
		if let url = URL(string: url)
		{
			do {
				let (data, _) = try await URLSession.shared.data(from: url)
				guard let results = try JSONDecoder().decode(TVShowModel?.self, from: data) else {

					
					return
				}
				
				print(TVShowResults)
				self.TVShowResults = results
				
			}
			catch
			{
				
			}
			
			

	}
		

	}
	
}
