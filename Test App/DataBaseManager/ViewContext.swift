//
//  ViewContext.swift
//  Test App
//
//  Created by Ильнур Закиров on 03.07.2023.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    
    func saveDish() {
        
        do {
            try self.save()
        } catch {
            print(error)
        }
    }
}
