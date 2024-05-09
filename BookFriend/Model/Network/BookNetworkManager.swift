//
//  BookNetworkManager.swift
//  BookFriend
//
//  Created by 배지해 on 5/10/24.
//

import Alamofire

struct BookNetworkManager {
    
    static let shared = BookNetworkManager()
    private init() {}
    
    private let url = "https://dapi.kakao.com/v3/search/book"
    
    private let headers : HTTPHeaders = [
        "Authorization": "KakaoAK e62d9879b6d40abb3444dcf749496850"
    ]
    
    func fetchDatas(query: String, page: Int, size: Int, completion: @escaping((Result<[Document], Error>) -> Void)) {
        
        let url = url + "?query=\"\(query)\"&page=\(page)&size=\(size)"
        AF.request(url).responseDecodable(of: [Document].self) { response in
            switch response.result {
            case .success(let documents):
                completion(.success(documents))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
