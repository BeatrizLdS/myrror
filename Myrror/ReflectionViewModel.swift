//
//  ReflectionViewModel.swift
//  Myrror
//
//  Created by Christian Paulo on 16/09/22.
//

import Foundation
import UIKit
import CoreData

// Copywriter, aprender mais 

class ReflectionViewModel: ObservableObject {
    var reflectionList : [Reflection]?
    
    //    Referencia ao Container que está no App Delegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //    MARK: CREATE
    func addReflection(date: Date, subject: String, textoReflection: String, emoji: String) {
        let newReflection = Reflection.create()
        newReflection.date = date
        newReflection.subject = subject
        newReflection.text_reflection = textoReflection
        newReflection.emoji = emoji
        
        reflectionList?.append(newReflection)
    }
    
    // MARK: Update
    func updateReflection(index: Int?, subject: String, text: String, emoji: String) {
        let reflection = reflectionList![index!]
        reflection.subject = subject
        reflection.text_reflection = text
        reflection.emoji = emoji
    }
    
    // MARK: READ
    func fetchReflection(date: Date) {
        let startDate = Calendar.current.startOfDay(for: date)
        var components = DateComponents()
        components.day = 1
        components.second = -1
        let endDate = Calendar.current.date(byAdding: components, to: startDate)!
        self.reflectionList = Reflection.find(query: "date >= %@ AND date <= %@", arguments: [startDate as NSDate, endDate as NSDate])
    }
    
    func deleteReflection(indexPath: IndexPath) {
        guard let reflectionList = self.reflectionList else {
            return
        }
        reflectionList[indexPath.row].destruct()
    }
}
