//
//  TokensViewController.swift
//  otpio
//
//  Created by Mason Phillips on 9/18/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import FontAwesome_swift

#if DEBUG
    import FLEX
#endif

class TokensViewController: BaseController<TokensModel> {
    
    var addButton: UIBarButtonItem {
        let b = FontAwesomeBarButtonItem(title: .fontAwesomeIcon(name: .plus), style: .plain, target: self, action: #selector(showAdd))
        b.setTitleTextAttributes([.font: UIFont.fontAwesome(ofSize: 20, style: .regular)], for: .normal)
        b.setTitleTextAttributes([.font: UIFont.fontAwesome(ofSize: 20, style: .regular)], for: .highlighted)
        return b
    }
    var settingsButton: UIBarButtonItem {
        let b = FontAwesomeBarButtonItem(title: .fontAwesomeIcon(name: .cogs), style: .plain, target: self, action: #selector(showSettings))
        b.setTitleTextAttributes([.font: UIFont.fontAwesome(ofSize: 20, style: .regular)], for: .normal)
        b.setTitleTextAttributes([.font: UIFont.fontAwesome(ofSize: 20, style: .regular)], for: .highlighted)
        return b
    }
    
    lazy var add      = AddViewController()
    lazy var settings = SettingsViewController()
    
    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = addButton
        navigationItem.rightBarButtonItem = settingsButton
        navigationItem.title = "My Tokens"
        
        table.separatorStyle = .none
        table.register(TokenCell.self, forCellReuseIdentifier: TokenCell.identifier)
        table.rx.setDelegate(self).disposed(by: bag)
        model.tokens.bind(to: table.rx.items(cellIdentifier: TokenCell.identifier, cellType: TokenCell.self)) { _, item, cell in
            cell.configure(with: item)
        }.disposed(by: bag)
        view.addSubview(table)
        table.fillSuperview()
        
        #if DEBUG
        let flexTrigger = UITapGestureRecognizer(target: self, action: #selector(flexTriggerHandler))
            flexTrigger.numberOfTouchesRequired = 2
            flexTrigger.numberOfTapsRequired = 2
            view.addGestureRecognizer(flexTrigger)
        #endif
    }
}

extension TokensViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RegularTokenView.requiredHeight + 25
//        switch ThemeManager.shared.currentCellStyle.value {
//        case .compact : return CompactTokenView.requiredHeight + 25
//        case .regular : return RegularTokenView.requiredHeight + 25
//        case .expanded: return ExpandedTokenView.requiredHeight + 25
//        }
    }
}

extension TokensViewController {
    @objc func showAdd() {
        let n = UINavigationController(rootViewController: add)
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Scan Code", style: .default) { _ in
            alert.dismiss(animated: true) {
                self.present(n, animated: true) { self.add.showCamera() }
            }
        })
        alert.addAction(UIAlertAction(title: "Enter Details", style: .default) { _ in
            alert.dismiss(animated: true) {
                self.present(n, animated: true, completion: nil)
            }
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
            alert.dismiss(animated: true, completion: nil)
        })
        present(alert, animated: true, completion: nil)
    }
    @objc func showSettings() {
        let n = UINavigationController(rootViewController: settings)
        present(n, animated: true, completion: nil)
    }
    
    static func handleOutsideNormalFlow(error: Error) {
        if
            let window = UIApplication.shared.windows.first,
            let nav = window.rootViewController as? UINavigationController,
            let controller = nav.viewControllers.first as? TokensViewController
        {
            controller.handle(error: error)
        } else {
            print(error)
        }
    }
    
    #if DEBUG
    @objc func flexTriggerHandler() {
        FLEXManager.shared()?.showExplorer()
    }
    #endif
}
