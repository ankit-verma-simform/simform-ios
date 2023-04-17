//
//  ViewController.swift
//  DemoApp
//
//  Created by Ankit Verma on 04/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: View lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Loaded")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View Will Appeared")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View Did Appeared")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View Will Disappear")
    }
}

// MARK: IB Actions
extension ViewController {
    @IBAction func btnUILabelAction(_ sender: Any) {
        guard let uiLabelVC = UILabelVC.create(storyboardName: .uiLabel) as? UILabelVC else { return }
        navigate(to: uiLabelVC)
    }
    
    @IBAction func btnUIButtonAction(_ sender: Any) {
        guard let uiButtonVC = UIButtonVC.create(storyboardName: .uiButton) as? UIButtonVC else { return }
        navigate(to: uiButtonVC)
    }
    
    @IBAction func btnUITextFieldAction(_ sender: Any) {
        guard let uiTextFieldVC = UITextFieldVC.create(storyboardName: .uiTextField) as? UITextFieldVC else { return }
        navigate(to: uiTextFieldVC)
    }
    
    @IBAction func btnUITextViewAction(_ sender: Any) {
        guard let uiTextViewVC = UITextViewVC.create(storyboardName: .uiTextView) as? UITextViewVC else { return }
        navigate(to: uiTextViewVC)
    }
    
    @IBAction func btnUISwitchAction(_ sender: Any) {
        guard let uiSwitchVC = UISwitchVC.create(storyboardName: .uiSwitch) as? UISwitchVC else { return }
        navigate(to: uiSwitchVC)
    }
    
    @IBAction func btnUISliderAction(_ sender: Any) {
        guard let uiSliderVC = UISliderVC.create(storyboardName: .uiSlider) as? UISliderVC else { return }
        navigate(to: uiSliderVC)
    }
}
