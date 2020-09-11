//
//  Extension_PKHUD.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/09/11.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import PKHUD

class HudExtension {
    func showProgress() {
        HUD.show(.progress)
    }
    func hideProgress() {
        HUD.hide()
    }
}
