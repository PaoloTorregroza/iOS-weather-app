//
//  CityNameView.swift
//  WeatherApp
//
//  Created by Paolo on 17/08/21.
//

import SwiftUI

struct CityNameView: View {
    var city: String
    var date: String
    
    var body: some View {
        HStack {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                Text(city)
                    .font(.title)
                    .bold()
                Text(date)
            }).foregroundColor(.white)
        }
    }
}

struct CityNameView_Previews: PreviewProvider {
    static var previews: some View {
        CityNameView(city: "Bogotá", date: "12/12/1970")
    }
}
