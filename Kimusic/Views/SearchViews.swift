//
//  SearchScreen.swift
//  Kimusic
//
//  Created by dat huynh on 30/07/2022.
//

import SwiftUI

struct SearchScreen: View {
    
    @State var searchResults = SearchGetter.init()
    @State var keyword: String = ""
    @State var url = "https://ac.zingmp3.vn/v1/web/ac-suggestions?num=10&query="
    @State var search = ""
    @State var keywordSuggestions: [Keyword] = []
    @State var suggestedObjects: [Suggestion] = []
    
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter your searching keyword", text: $keyword)
                    .onChange(of: keyword, perform: { value in
                        Task{
                            search = ""
                            search.append(url)
                            search.append(SearchGetter.inputFormatter(keywords: keyword))
                            self.keywordSuggestions = await  searchResults.keyword(JsonUrl:search.utf8DecodedString())
                            self.suggestedObjects = await  searchResults.suggestion(JsonUrl: search.utf8DecodedString())
                            let _ = print(SearchGetter.inputFormatter(keywords: keyword).utf8DecodedString())
                            
                        }
                    })
                ForEach(keywordSuggestions, id: \.self){ suggestedKeyword in
                    Text(suggestedKeyword.keyword!)
                    
                }
                ForEach(suggestedObjects, id: \.self){ suggestion in
                    Text(suggestion.title!)
                }
            }
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
