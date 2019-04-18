//
//  WHResponse.swift
//  WeatherHelper
//
//  Created by wu ning on 2019/4/18.
//  Copyright © 2019 allen. All rights reserved.
//

import Alamofire

public enum NetWorkError:Error{
    case responseError(description:String)
    case serverError(description:String)
}

public struct WHResponse {
    /// response statusCode
    public let statusCode: Int?
    
    public let success: Bool?
    /// The URL request sent to the server.
    public let request: URLRequest?
    
    /// The server's response to the URL request.
    public let response: HTTPURLResponse?
    
    /// The data returned by the server.
    public let data: Data?
    
    /// The final metrics of the response.
    public let metrics: URLSessionTaskMetrics?
    
    /// The time taken to serialize the response.
    public let serializationDuration: TimeInterval
    
    /// Returns the associated value of the result if it is a success, `nil` otherwise.
    public var value: Any?
    
    /// Returns the associated error value if the result if it is a failure, `nil` otherwise.
    public var error: Error?
    
    public init(_ dataResoonse:DataResponse<Any>) {
        self.request = dataResoonse.request
        self.response = dataResoonse.response
        self.data = dataResoonse.data
        self.metrics = dataResoonse.metrics
        self.serializationDuration = dataResoonse.serializationDuration
        self.success = dataResoonse.response?.statusCode == 200
        self.statusCode = dataResoonse.response?.statusCode
        self.value = dataResoonse.value
        self.error = dataResoonse.error
    }
}
