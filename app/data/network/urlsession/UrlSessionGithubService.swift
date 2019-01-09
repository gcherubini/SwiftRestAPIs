//
//  GithubService.swift
//  app
//
//  Created by Guilherme Cherubini on 21/11/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation
import RxSwift

class UrlSessionGithubService {
	private let session: URLSession
	private let decoder: JSONDecoder
	private var dataTask: URLSessionDataTask?
	
	init() {
		session = URLSession(configuration: .default)
		/*.default: Creates a default configuration object that uses the disk-persisted global cache, credential and cookie storage objects.
		  .ephemeral: Similar to the default configuration, except that all session-related data is stored in memory. Think of this as a “private” session.
		  .background: Lets the session perform upload or download tasks in the background. Transfers continue even when the app itself is suspended or terminated by the system.*/
		decoder = JSONDecoder()
	}
	
	func getRepos(userName: String) -> Observable<[RepositoryOutput]> {
		let repositoriesVariable = Variable([RepositoryOutput]())

		let endpoint = GithubAPIEndpoint.repos(userName: userName).path
		print("GithubService - getRepos for: \(userName)")
		print(endpoint)

		dataTask?.cancel()

		if var urlComponents = URLComponents(string: endpoint) {
			guard let url = urlComponents.url else {
				return repositoriesVariable.asObservable()
			}
			
			dataTask = session.dataTask(with: url) { data, response, error in
				defer {
					self.dataTask = nil
				}
				
				if let error = error {
					print("GithubService - DataTask error: \(error.localizedDescription)")
					return
				}

				guard let data = data else {
					print("GithubService - DataTask error: data is nil")
					return
				}
				
				if let response = response as? HTTPURLResponse,
				response.statusCode == HTTPStatusCode.ok.rawValue {
					print("GithubService - 200 OK")
					
					do {
						let repositories = try self.decoder.decode([RepositoryOutput].self, from: data)
						//print("GithubService - Repositories: \(repositories)")
					  repositoriesVariable.value = repositories
						
						//Get back to the main queue
						DispatchQueue.main.async {
						}
					} catch let parsingError {
						print("GithubService - Error parsing object, error: \(parsingError)")
					}
				}
			}
		
			dataTask?.resume()
		}
		
		return repositoriesVariable.asObservable()
	}
}
