//
//  UtilityExtensions.swift
//  WineKart
//
//  Created by SI.SarveshSuryavansh on 24/12/22.
//

import Foundation

extension HTTPURLResponse {
    func isResponseOK() -> Bool {
        return (200...299).contains(self.statusCode)
    }
}
