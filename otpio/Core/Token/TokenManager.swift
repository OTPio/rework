//
//  TokenManager.swift
//  otpio
//
//  Created by Mason Phillips on 9/20/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import Foundation
import KeychainAccess
import LibToken
import LibSnowflake
import RxSwift
import RxCocoa
import CoreData

class TokenManager {
    static let shared: TokenManager = TokenManager()
    
    private let mainKeychain: Keychain
    
    private var container: NSPersistentCloudKitContainer! {
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    }
    
    init() {
        mainKeychain = Keychain(accessGroup: "6S4L29QT59.io.matrixstudios.otpio.mainKeychain")
    }
    
    func fetchAll() -> [ExtendedToken] {
        
        let request: NSFetchRequest<ExtendedToken> = ExtendedToken.fetchRequest()
        do {
            return try container.viewContext.fetch(request)
        } catch {
            TokensViewController.handleOutsideNormalFlow(error: error)
            return []
        }
    }
    
    func saveToken(token: Token, today: Bool = false, cloud: Bool = false, position: Int = -1, icon: String = "") -> ExtendedToken {
        defer { try? self.container.viewContext.save() }
        
        let extended = ExtendedToken(context: container.viewContext)
        extended.today = today
        extended.cloud = cloud
        extended.icon = icon
        extended.id = Snowflake.generate()
        
        extended.order = Int16((position == -1) ? mainKeychain.allKeys().count : position)
        extended.associatedToken = token
        
        return extended
    }
    
    func fetchFromKeychain(identifier: String) -> Token? {
        if let urlString = mainKeychain[identifier], let url = URL(string: urlString) {
            do {
                return try Token(from: url)
            } catch { return nil }
        }
        return nil
    }
    func saveToKeychain(identifier: String, token: Token) {
        let url = token.serialize()
        let data = url.absoluteString
        mainKeychain[identifier] = data
    }
}
