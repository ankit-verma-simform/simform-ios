//
//  UIToolBarVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 04/05/23.
//

import UIKit

class UIToolBarVC : UIViewController {
    // MARK: - Variables
    private var autoIncrementCount = false
    private var count = 0
    private var timer: Timer?

    // MARK: - IB Outlets
    @IBOutlet private weak var toolbar: UIToolbar!
    @IBOutlet private weak var lblCounter: UILabel!
    @IBOutlet private weak var btnToggleIncrementAuto: UIBarButtonItem!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IB Actions
extension UIToolBarVC {
    @IBAction private func toggleIncrementAutoAction(_ sender: UIBarButtonItem) {
        autoIncrementCount = !autoIncrementCount
        if autoIncrementCount {
            btnToggleIncrementAuto.image = UIImage(systemName: "pause.fill")
            timer?.invalidate() // just in case this button is tapped multiple times
            timer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(incrementCount),
                                         userInfo: nil,
                                         repeats: true)
        }
        else {
            btnToggleIncrementAuto.image = UIImage(systemName: "play.fill")
            timer?.invalidate()
        }
    }
    
    @IBAction private func decrementCount(_ sender: Any? = nil) {
        changeCount(to: count - 1)
    }
    
    @IBAction private func incrementCount(_ sender: Any? = nil) {
        changeCount(to: count + 1)
    }
}

// MARK: - Functions
extension UIToolBarVC {
    private func changeCount(to newValue: Int) {
        count = newValue
        let time = timeFormat(secs: count)
        lblCounter.text = String(format: "%002d:%002d:%002d", time.hrs, time.mins, time.secs)
    }
    
    private func timeFormat(secs: Int) -> (
        hrs: Int, mins: Int, secs: Int) {
            return (
                secs / 3600,
                (secs % 3600) / 60,
                secs % 60
            )
        }
}
