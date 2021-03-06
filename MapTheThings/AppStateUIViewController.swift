//
//  AppStateUIViewController.swift
//  MapTheThings
//
//  Created by Frank on 2016/7/3.
//  Copyright © 2016 The Things Network New York. All rights reserved.
//

import UIKit
import ReactiveCocoa

class AppStateUIViewController: UIViewController {
    var stateDisposer: Disposable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Listen for app state changes...
        self.stateDisposer = appStateObservable.observeOn(QueueScheduler.mainQueueScheduler).observeNext({state in
            //print(state)
            self.renderAppState(state.old, state: state.new)
        })

        // Set initial view
        let (oldState, state) = appStateProperty.value
        renderAppState(oldState, state: state)
    }
    
    func renderAppState(oldState: AppState, state: AppState) {
        preconditionFailure("This method must be overridden")
    }
}
