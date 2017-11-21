//
//  Extension.swift
//  SetOfPractice
//
//  Created by 배지영 on 2017. 11. 15..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import Foundation

extension Array {
    func remove(index:Int) -> Array {
        var newArr = Array()
        for i in 0...self.count-1 {
            if index != i {
                newArr.append(self[i])
            }
        }
        return newArr
    }
}
