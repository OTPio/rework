//
//  ExtendedToken+CoreDataProperties.swift
//  otpio
//
//  Created by Mason Phillips on 9/19/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//
//

import Foundation
import CoreData
import LibToken

extension ExtendedToken {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExtendedToken> {
        return NSFetchRequest<ExtendedToken>(entityName: "ExtendedToken")
    }

    @NSManaged public var id: Int64
    @NSManaged public var icon: String?
    @NSManaged public var order: Int16
    @NSManaged public var today: Bool
    @NSManaged public var cloud: Bool

    var associatedToken: Token? {
        get { TokenManager.shared.fetchFromKeychain(identifier: "\(self.id)") }
        set { TokenManager.shared.saveToKeychain(identifier: "\(self.id)", token: newValue!) }
    }
}
