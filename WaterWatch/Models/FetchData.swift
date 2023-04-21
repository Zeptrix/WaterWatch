//
//  FetchData.swift
//  WaterWatch
//
//  Created by Brendan McGrew (student LM) on 3/13/23.
//
import Foundation
class FetchData: ObservableObject{
    @Published var response = Response()
    var locationManager = LocationManager()
        var latitude: String{
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 39.9526)"
    }
    var longitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? -75.1652)"
    }
    
    
    func getData() async{
        let URLString = "https://api.weatherapi.com/v1/current.json?key=1944725f95b74aa1a38141558222212&q=\(latitude),\(longitude)&aqi=no"
        guard let url = URL(string: URLString) else {return}
        do{
            let (data,_) =  try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Response.self, from: data)
            self.response = response
            
        }
        catch {
//            print(error)
        }
    }
}
struct Response: Codable{
    var current: Current = Current()
}

struct Current: Codable{
    var temp_f: Double = 0.0
    var humidity: Int = 0
}


