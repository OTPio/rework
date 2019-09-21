//
//  BaseTableCell.swift
//  otpio
//
//  Created by Mason Phillips on 9/19/19.
//  Copyright © 2019 Matrix Studios. All rights reserved.
//

import UIKit
import RxSwift

protocol BaseTableCellType where Self: UITableViewCell {
    associatedtype M: BaseModel
    associatedtype T: Any
    
    var model: M { get }
    var bag: DisposeBag { get }
    
    func bind()
    func configure(with item: T)
}

class BaseTableCell<T: Any, M: BaseModel>: UITableViewCell, BaseTableCellType {
    let model: M
    let bag: DisposeBag
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        model = M()
        bag = DisposeBag()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bind()
    }
    
    func bind() {
        
    }
    func configure(with item: T) {
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
}
