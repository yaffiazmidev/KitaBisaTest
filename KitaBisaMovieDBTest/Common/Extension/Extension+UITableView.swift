//
//  Extension+UITableView.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 09/07/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(ofType type: T.Type) {
        let cellName = String(describing: T.self)
        
        if Bundle.main.path(forResource: cellName, ofType: "nib") != nil {
            let nib = UINib(nibName: cellName, bundle: Bundle.main)
            
            register(nib, forCellReuseIdentifier: cellName)
        } else {
            register(T.self, forCellReuseIdentifier: cellName)
        }
    }
    
    func dequeueCell<T: UITableViewCell>(ofType type: T.Type) -> T     {
       let cellName = String(describing: T.self)
       return dequeueReusableCell(withIdentifier: cellName) as! T
    }
    
    func dequeueCell<T: UITableViewCell>(ofType type: T.Type, indexPath: IndexPath) -> T     {
       let cellName = String(describing: T.self)
       return dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! T
    }
    
    func delegateDataSource(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    func dequeueCell<T: UITableViewCell>(cell: T.Type, _ indexPath: IndexPath) -> T {
        let cell = self.dequeueCell(ofType: T.self, indexPath: indexPath)
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>(cell: T.Type) -> T {
        let cell = self.dequeueCell(ofType: T.self)
        return cell
    }
}
