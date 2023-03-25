//
//  TVShowModel.swift
//  JSON Test
//
//  Created by Brad Payne on 3/22/23.
//

import Foundation


struct TVShowModel : Codable
{
	let name: String
	let type: String
	let language: String
	let genres : [String]
    let schedule: ScheduleModel?
}
