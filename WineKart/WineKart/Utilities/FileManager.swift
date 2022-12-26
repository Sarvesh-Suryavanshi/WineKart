//
//  FileManager.swift
//  MoBo
//
//  Created by Sarvesh Suryavanshi on 05/11/22.
//

import Foundation

class FileManager {
    
    static let shared = FileManager()
    
    private  init() {}
    
    func getLocalData(for fileName: String) -> Data? {
        guard
            let path = Bundle.main.path(forResource: fileName, ofType: "json")
        else { return nil }
        let pathURL = URL(fileURLWithPath: path)
        return try? Data(contentsOf: pathURL, options: .mappedIfSafe)
    }
}
 
