//
//  AddFriendVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 25/04/23.
//

import UIKit
import SPIndicator

// MARK: - Protocol for Sending Friend
protocol FriendDelegate: AnyObject {
    func friend(onFriendAdded friend: Friend)
}

class AddFriendVC: UIViewController {
    // MARK: - Variables
    private lazy var friend: Friend = Friend()
    weak var delegate: FriendDelegate?
    
    // MARK: - IB Outlets
    @IBOutlet private weak var imgProfile: CircularImageView!
    @IBOutlet private weak var btnAddProfileImage: UIButton!
    @IBOutlet private weak var tfFirstName: UIView!
    @IBOutlet private weak var tfLastName: UIView!
    @IBOutlet private weak var lblAgeInYears: UILabel!
    @IBOutlet private weak var lblMinAge: UILabel!
    @IBOutlet private weak var lblMaxAge: UILabel!
    @IBOutlet private weak var sliderAge: UISlider!
    @IBOutlet private weak var btnPickProfileImage: UIButton!
    @IBOutlet private weak var constBottomView: NSLayoutConstraint!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    deinit {
        deregisterKeyboardNotifications()
    }
}

// MARK: - Functions
extension AddFriendVC {
    private func initialSetup() {
        btnAddProfileImage.maskCircle()
        setSliderLabels()
        friend.age = Int(sliderAge.value)
        registerKeyboardNotifications()
    }
    
    private func setSliderLabels() {
        lblMinAge.text = String(Int(sliderAge.minimumValue))
        lblMaxAge.text = String(Int(sliderAge.maximumValue))
        lblAgeInYears.text = String(Int(sliderAge.value))
    }
}

extension AddFriendVC {
    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onKeyboardAppear(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onKeyboardDisappear(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    private func deregisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    @objc private func onKeyboardAppear(_ notification: NSNotification) {
        guard let info = notification.userInfo,
              let rect: CGRect = info[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect
        else { return }
        let kbSize = rect.size
        constBottomView.constant = kbSize.height - view.safeAreaInsets.bottom
    }
    
    @objc private func onKeyboardDisappear(_ notification: NSNotification) {
        constBottomView.constant = 0
    }
}

// MARK: - IB Actions
extension AddFriendVC {
    @IBAction private func onAgeChange(_ sender: UISlider) {
        friend.age = Int(sender.value)
        lblAgeInYears.text = String(friend.age ?? 0)
    }
    
    @IBAction func addFriend(_ sender: UIButton) {
        guard friend.validEntries() else {
            SPIndicator.present(
                title: "Error",
                message: "Fill all details correctly!",
                preset: .error)
            return
        }
              
        delegate?.friend(onFriendAdded: friend)
        SPIndicator.present(
            title: "Success",
            message: "Friend added successfully!",
            preset: .done)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pickProfilePhoto(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true)
    }
}

// MARK: - Delegate Methods for UIImagePicker
extension AddFriendVC: UIImagePickerControllerDelegate,
                       UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        imgProfile.image = image
        picker.dismiss(animated: true)
        friend.image = imgProfile.image
    }
}

// MARK: - Delegate Methods for UITextFields
extension AddFriendVC: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField {
        case tfFirstName:
            friend.firstName = textField.text
        case tfLastName:
            friend.lastName = textField.text
        default:
            break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case tfFirstName:
            tfLastName.becomeFirstResponder()
        case tfLastName:
            tfLastName.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
