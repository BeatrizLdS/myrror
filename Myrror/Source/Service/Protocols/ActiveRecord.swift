//
//  ActiveRecord.swift
//  Myrror
//
//  Created by Beatriz Leonel on 14/06/24.
//

import Foundation

protocol ReadRecord {
    static func getAll() -> [Self]
    static func find(query: String, arguments: [Any]?) -> [Self]
}

protocol CreateRecord {
    static func create() -> Self
}

protocol DeleteRecord {
    func destruct()
}

protocol ActiveRecordType: ReadRecord, CreateRecord, DeleteRecord {}

protocol RecordModelType: ActiveRecordType {
    associatedtype Context
    static var context: Context { get }
}
