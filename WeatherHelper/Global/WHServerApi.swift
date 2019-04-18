//
//  ServerApi.swift
//  WeatherHelper
//
//  Created by wu ning on 2019/4/17.
//  Copyright © 2019 allen. All rights reserved.
//

import Alamofire

let DARKSKYSECERTKEY = "f6214911400ab8e00c632efca46630df"

public class WHServerApi {
    //MARK:-- interface API
    
    
    static public func request(_ url: URLConvertible,
                               method: HTTPMethod = .get,
                               parameters: Parameters? = nil,
                               headers: HTTPHeaders? = nil,
                               interceptor: RequestInterceptor? = nil,
                               success:@escaping (String) -> Void,
                               failure:@escaping (Error) -> Void ) {
        Alamofire.AF.request(url, method: method, parameters: Parameters.addScrectKey(parameters) , headers: headers, interceptor: interceptor).responseJSON { response in
            let resp = WHResponse.init(response)
            guard resp.success == true else{
                failure(NetWorkError.responseError(description: "\(String(describing: response.value))"))
                return
            }
            switch response.result {
            case .success(let json):success(WHServerApi.anyToJson(json))
            case .failure(let error):failure(NetWorkError.responseError(description: "\(error)"))
            }
        }
    }
}

extension WHServerApi {
    private static func anyToJson(_ info:Any) -> String{
        guard JSONSerialization.isValidJSONObject(info) else {
            return ""
        }
        let jsonData = try? JSONSerialization.data(withJSONObject: info, options: [.prettyPrinted])
        if let json = jsonData, let jsonString = String(data: json, encoding: .utf8){
            return jsonString
        }else{
            return ""
        }
    }
}

private extension Parameters {
    static func addScrectKey(_ parameters:Parameters?) -> Parameters{
        var param: Parameters = ["key": DARKSKYSECERTKEY]
        if let parameter = parameters {
            param = parameter
            param["key"] = DARKSKYSECERTKEY
        }
        return param
    }
}
