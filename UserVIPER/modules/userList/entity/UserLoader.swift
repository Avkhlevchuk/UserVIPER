//
//  UserLoader.swift
//  mvp-users
//
//  Created by Artur on 21.08.2024.
//

import Foundation

protocol IUserLoader {
    func fetchUsers(completion: @escaping (Result<[User], NetworkError>) -> Void)
}


enum NetworkError: Error {
    case decode
}

class UserLoader: IUserLoader {
    
    let session = URLSession.init(configuration: .default)
    
    func fetchUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        
        let userUrl = URL(string: "https://reqres.in/api/users")
        
        var request = URLRequest(url: userUrl!)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) {data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                
                switch response.statusCode {
                case 200..<300:
                    print("Success Status\(response.statusCode)")
                    break
                default:
                    print("\(response.statusCode)")
                }
            }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder.init()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                print(Thread.current)
                let userData = try decoder.decode(UserData.self, from: data)
                
                DispatchQueue.main.async {
                    print(Thread.current)
                    completion(.success(userData.data))
                }
              
            }catch {
                completion(Result.failure(NetworkError.decode))
                print(error)
            }
        }
       
        task.resume()
    }
}
