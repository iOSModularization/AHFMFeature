//
//  ViewController.swift
//  AHFMFeature
//
//  Created by Andy Tong on 10/7/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import AHServiceRouter

import AHFMDownloadListManager
import AHFMAudioPlayerVCManager
import AHFMEpisodeListVCManager
import AHFMHistoryVCManager
import AHFMAudioPlayerManager
import AHFMBottomPlayerManager
import AHFMAudioPlayerManager
import AHFMShowPageManger
import AHFMDownloadCenterManager
import AHFMDownloaderManager
import AHFMFeatureManager

import AHFMBottomPlayerServices
import AHFMShowPageServices
import AHFMFeatureServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        AHFMDownloadListManager.activate()
        AHFMAudioPlayerVCManager.activate()
        AHFMEpisodeListVCManager.activate()
        AHFMHistoryVCManager.activate()
        AHFMAudioPlayerManager.activate()
        AHFMBottomPlayerManager.activate()
        AHFMAudioPlayerManager.activate()
        AHFMShowPageManger.activate()
        AHFMDownloadCenterManager.activate()
        AHFMDownloaderManager.activate()
        AHFMFeatureManager.activate()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let info = AHServiceRouter.doTask(AHFMFeatureServices.service, taskName: AHFMFeatureServices.taskCreateVC, userInfo: [:], completion: nil) else {
            return
        }
        
        guard let vc = info[AHFMShowPageServices.keyGetVC] as? UIViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
