//  
//  ChatViewViewModel.swift
//  HiApp
//
//  Created by Agus Cahyono on 14/04/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

class ChatViewViewModel {

    private let service: ChatViewServiceProtocol

    private var model: [ChatViewModel] = [ChatViewModel]() {
        didSet {
            self.count = self.model.count
        }
    }

    /// Count your data in model
    var count: Int = 0

    //MARK: -- Network checking

    /// Define networkStatus for check network connection

    /// Define boolean for internet status, call when network disconnected
    var isDisconnected: Bool = false {
        didSet {
            self.alertMessage = "No network connection. Please connect to the internet"
            self.internetConnectionStatus?()
        }
    }

    //MARK: -- UI Status

    /// Update the loading status, use HUD or Activity Indicator UI
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }

    /// Showing alert message, use UIAlertController or other Library
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }

    /// Define selected model
    var selectedObject: ChatViewModel?

    //MARK: -- Closure Collection
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var internetConnectionStatus: (() -> ())?
    var serverErrorStatus: (() -> ())?
    var didGetData: (() -> ())?

    init(withChatView serviceProtocol: ChatViewServiceProtocol = ChatViewService() ) {
        self.service = serviceProtocol
    }
}

extension ChatViewViewModel {

}
