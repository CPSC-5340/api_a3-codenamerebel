//
//  TVShowView.swift
//  Assignment3
//
//  Created by Brad Payne on 3/23/23.
//

import Foundation

class TVShowViewModel : ObservableObject
{
	
	var url = "https://api.tvmaze.com/lookup/shows?imdb=tt0458290"
    
    let baseURL = "https://api.tvmaze.com/lookup/shows?imdb="

	@Published var	TVShowResults = TVShowModel(name: "Test", type: "", language: "", genres: [], schedule: nil)
	
	@Published var hasError = false
	@Published var error : TVShowModelError?
	
	@MainActor
	func fetchData() async
	{
				
		if let url = URL(string: url)
		{
			do {
				let (data, _) = try await URLSession.shared.data(from: url)
				guard let results = try JSONDecoder().decode(TVShowModel?.self, from: data) else
				{
					self.hasError.toggle()
					self.error = TVShowModelError.decodeError
				
					return
				}
				
				print(TVShowResults)
				self.TVShowResults = results
				
			}
			catch
			{
				self.hasError.toggle()
				self.error = TVShowModelError.customError(error: error)
			}
			
			

	}
		

	}
	
    func setURL(IMDBid:String)
    {
        self.url = self.baseURL + IMDBid
    }
    
}


extension TVShowViewModel
{
	enum TVShowModelError : LocalizedError
	{
		case decodeError
		case customError(error: Error)
		
		var errorDescription: String?
		{
			switch self
			{
				case .decodeError:
					return "Decoding Error"
				case .customError(let error):
					return error.localizedDescription
			}
		}
		
	}

}

