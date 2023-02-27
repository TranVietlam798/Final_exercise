//
//  UserApi.swift
//  Final_exercise
//
//  Created by VIETLAMTR on 27/02/2566 BE.
//

import Foundation
import Alamofire

class APIHandler{
    static let sharedInstance = APIHandler()
    
    let token: HTTPHeaders = [.authorization(bearerToken: "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")]

    func fetchDataListUser(handler: @escaping (_ apiData:[User]) -> (Void)) {
        let url = "https://api.github.com/users"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: token, interceptor: nil)
            .response { response in
                switch response.result {
                    case .success(let data):
                        do{
                            let jsonData = try JSONDecoder().decode([User].self, from: data!)
                            handler(jsonData)
                        } catch {
                            print(error.localizedDescription)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
    }
    
    func fetchDataListUserDetail(handler: @escaping (_ apiData:[Detail]) -> (Void), login: String) {
        let url = "https://api.github.com/users/" + login
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: token, interceptor: nil)
            .response { response in
                switch response.result {
                    case .success(let data):
                        do{
                            let jsonData = try JSONDecoder().decode([Detail].self, from: data!)
                            handler(jsonData)
                        } catch {
                            print(error.localizedDescription)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
    }
}

