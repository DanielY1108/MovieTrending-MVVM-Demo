//
//  Observable.swift
//  MovieTrending
//
//  Created by JINSEOK on 2023/02/23.
//

import Foundation

class Observable<T> {
    
    // 전달한 데이터가 없을 수 있으므로 (?)
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listener = listener
    }
}
