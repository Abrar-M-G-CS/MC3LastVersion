
//  Model.swift
//  t
//
//  Created by Lujain Abdullah Halabi Almeri on 15/07/1445 AH.
//

// to communicate with cloudkit (view > model > cloudKit)
import Foundation
import CloudKit

//Aggregate model
@MainActor
class Model: ObservableObject{
    
    enum CloudKitHelperError: Error {
        case castFailure
        // Add more cases as needed
    }
    
    private var db = CKContainer(identifier: "iCloud.MC3Project").publicCloudDatabase //public
    
    
    
    @Published private var itemDictionary: [CKRecord.ID: place] = [:]
    
    var places: [place] {
        itemDictionary.values.compactMap {$0}
    }
    
    func addItem(element: place){
        db.save(element.record) { record, error in
            guard  error  == nil else{
                print(error?.localizedDescription ?? "an unknown error occurred")
                return
            }
        }
    }
    
    
    func fetchItems() async throws {
        let query = CKQuery(recordType: placeKeys.type.rawValue, predicate: NSPredicate(value:true))
        // let query = CKQuery(recordType: placeKeys.type.rawValue, predicate: NSPredicate(format: "category == %@", "مقاهي"))
        
        //sort items
        //query.sortDescriptors = [NSSortDescriptor(key: "dateAssigned", ascending: true)]
        let result = try await db.records(matching: query)
        let records = result.matchResults.compactMap { try? $0.1.get() }
        
        records.forEach { record in
            itemDictionary[record.recordID] = place(record: record)
        }
    }
}


