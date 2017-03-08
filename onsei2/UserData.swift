//
//  UserData.swift
//  onsei2
//
//  Created by 原 あゆみ on 2017/03/04.
//  Copyright © 2017年 原 あゆみ. All rights reserved.
//

import UIKit
import RealmSwift

class UserData: Object {
    dynamic var text = ""
    dynamic var flag : NSData = NSData()
    dynamic var tone = 0
    dynamic var speed = 0
    dynamic var volume = 0
    dynamic var language = 0

}
