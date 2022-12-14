//
//  SuggestedRow.swift
//  Kimusic
//
//  Created by Cuong Nguyen Phuc on 05/09/2022.
//

import Foundation
import SwiftUI



struct SuggestedRow : View{
    var name: String
    var imageURL: String
    var body: some View{
        VStack{
            ZStack{
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width - 5, height: 50, alignment: .center)
                HStack{
                    AsyncImage(url: URL(string: imageURL)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                    }
                        placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                    
                    Spacer()
                    Text(name)
                        .foregroundColor(.white)
                }
                .frame(width: UIScreen.main.bounds.width - 5, height: 15, alignment: .center)
            }
        }
    }
    init(name: String, imageURL: String){
        self.name = name
        self.imageURL = imageURL
    }
}
