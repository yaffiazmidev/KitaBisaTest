//
//  Network.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 08/07/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum NetworkError: Int, Error {
    case notFound = 404
    case forbidden = 403
    case badRequest = 400
    case unauthorized = 401
    case serverError = 500
    case serviceUnavailable = 503
    case noInternet = -1009
    case requestTimeOut = -1001
}

class Connectivity {
    class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFound:
            return "Data Not Found"
        case .forbidden:
            return "Access Forbidden"
        case .badRequest:
            return "Bad Request"
        case .unauthorized:
            return "Unauthorized"
        case .serverError:
            return "Internal Server Error"
        case .serviceUnavailable:
            return "Internal Server Error"
        case .noInternet:
            return "No Internet Access"
        case .requestTimeOut:
            return "Request time out"
        }
    }
}

protocol IEndpoint {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameter: Parameters? { get }
    var header: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
}

class Network {
    
    static let share = Network()
    
    private var dataRequest: DataRequest?
    
    @discardableResult
    private func _dataRequest(
        url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil
    )
        -> DataRequest {
            return Session.default.request(
                url,
                method: method,
                parameters: parameters,
                encoding: encoding,
                headers: headers
            )
    }
    
    func requestDecodeble<T: IEndpoint, M: Decodable>(endpoint: T, completion: @escaping (Swift.Result<M, NetworkError>) -> Void) {
        if Connectivity.isConnectedToInternet {
            DispatchQueue.global(qos: .background).async {
                self.dataRequest = self._dataRequest(url: endpoint.path,
                                                     method: endpoint.method,
                                                     parameters: endpoint.parameter,
                                                     encoding: endpoint.encoding,
                                                     headers: endpoint.header)
                self.dataRequest?.responseJSON(completionHandler: { response in
                    
                    print("""
                    ---------------------------------------- [TRACER START] ----------------------------------------
                    
                    PATH            : \(endpoint.path)
                    METHOD          : \(endpoint.method)
                    PARAMETER       : \(String(describing: endpoint.parameter))
                    ENCODING        : \(endpoint.encoding)
                    HEADER          : \(String(describing: endpoint.header))
                    
                    ---------------------------------------- [TRACER FINISH] ----------------------------------------
                    
                    """)
                    
                    DispatchQueue.main.async {
                        guard let data = response.data else {
                            if let statusCode = response.response?.statusCode, let error = NetworkError(rawValue: statusCode) {
                                completion(.failure(error))
                            }
                            return
                        }
                        
                        let decoder = JSONDecoder()
                        do {
                            let object = try decoder.decode(M.self, from: data)
                            completion(.success(object))
                            
                            print("""
                            ---------------------------------------- [Response] ----------------------------------------
                            
                            \(JSON(data))
                            
                            ---------------------------------------- [Response] ----------------------------------------
                            """)
                            
                        } catch let error {
                            if let _error = error as? NetworkError {
                                completion(.failure(_error))
                            }
                        }
                    }
                    self.dataRequest = nil
                })
            }
        } else {
            completion(.failure(NetworkError.noInternet))
        }
    }
    
    func cancelRequest(_ completion: (() -> Void)? = nil) {
        dataRequest?.cancel()
        completion?()
    }
}

