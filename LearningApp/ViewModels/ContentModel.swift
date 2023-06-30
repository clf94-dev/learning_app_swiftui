//
//  ContentModel.swift
//  LearningApp
//
//  Created by Carmen Lucas on 26/6/23.
//

import Foundation

class ContentModel: ObservableObject{
    @Published var modules = [Module]()
    @Published var currentModule: Module?
    
    var currentModuleIndex = 0
    
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    @Published var lessonDescription = NSAttributedString()
    
    var styleData: Data?
    init(){
        getLocalData()
    }
    func getLocalData(){
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            self.modules = modules
            
        }
        catch{
            print(error)
        }
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
        }
        catch{
            print(error)
        }
    }
    //MARK: - Module navigation methods
    func beginModule(_ moduleId: Int){
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                currentModuleIndex = index
                break
            }
        }
        currentModule = modules[currentModuleIndex]
    }
    //MARK: - Module navigation methods
    func beginLesson(_ lessonIndex: Int){
        if lessonIndex < currentModule!.content.lessons.count{
            currentLessonIndex = lessonIndex
        }
        else{
            currentLessonIndex = 0
        }
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        lessonDescription = addStyling(currentLesson!.explanation)
    }
    func hasNextLesson() -> Bool{
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
    }
    func nextLesson () {
        currentLessonIndex += 1
        if hasNextLesson() {
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonDescription = addStyling(currentLesson!.explanation)
        }
        else{
            currentLesson = nil
            currentLessonIndex = 0
        }
        
    }
    // MARK: - Code styling
    private func addStyling(_ htmlString: String) -> NSAttributedString{
        var resultsStrings = NSAttributedString()
        
        var data = Data()
        if styleData != nil {
            data.append(styleData!)
        }
        data.append(Data(htmlString.utf8))
        
        // option to convert to attributed string (withou catching the error)
        
         if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
             resultsStrings = attributedString
        }
        
        // catch error
        // do {
            // let attributedString = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            // resultsStrings = attributedString
            
        // }
        // catch{
            // print("Couldn't turn html into attributed string")
        // }
        
        
        return resultsStrings
        
        
    }
}
