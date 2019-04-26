//  
//  ChatViewView.swift
//  HiApp
//
//  Created by Agus Cahyono on 14/04/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class ChatViewView: HiBase {

    // OUTLETS HERE
    @IBOutlet weak var marginBottomChat: NSLayoutConstraint!
    
    // VARIABLES HERE

    override func viewDidLoad() {
        super.viewDidLoad()
        self.generateHeader()
        
        // *** Listen to keyboard show / hide ***
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        // *** Hide keyboard when tapping outside ***
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.tintColor = UIColor.hexStringToUIColor(hex: "#c30f42")
        self.navigationController?.navigationBar.backItem?.title = "Custom"
    }
    
    @objc private func tapGestureHandler() {
        view.endEditing(true)
    }
    
    @objc private func keyboardWillChangeFrame(_ notification: Notification) {
        if let endFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = UIScreen.main.bounds.height - endFrame.origin.y + 38
            marginBottomChat.constant = keyboardHeight
            view.layoutIfNeeded()
        }
    }
    
    func generateHeader() {
        
        let containView = UIView(frame: CGRect(x: 0, y: 0, width: navigationController?.navigationBar.frame.width ?? 0.0, height: navigationController?.navigationBar.frame.height ?? 0.0))
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))


        imageview.contentMode = UIView.ContentMode.scaleAspectFill
        imageview.layer.cornerRadius = 20
        imageview.layer.masksToBounds = true
        imageview.clipsToBounds = true
        imageview.image = UIImage(named: "me")
        containView.addSubview(imageview)
        
        let one = UILabel()
        one.font = UIFont.boldSystemFont(ofSize: 16)
        one.textColor = .black
        one.textAlignment = .left
        one.text = "Agus Cahyono"
        one.sizeToFit()
        
        let two = UILabel()
        two.font = UIFont.systemFont(ofSize: 12)
        two.textAlignment = .left
        two.textColor =  UIColor.hexStringToUIColor(hex: "686868")
        two.text = "Last seen today at 10:00"
        two.sizeToFit()
        
        let stackView = UIStackView(arrangedSubviews: [one, two])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        
        let width = max(one.frame.size.width, two.frame.size.width)
        stackView.frame = CGRect(x: imageview.bounds.size.width + 8, y: 0, width: width, height: 35)
        
        containView.addSubview(stackView)
        
        
        self.navigationItem.titleView = containView
        
        
        
        // call icon
        let btnCalls = UIButton(type: .custom)
        btnCalls.setImage(UIImage(named: "calls_item"), for: .normal)
        btnCalls.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let btnCallsItem = UIBarButtonItem(customView: btnCalls)
        
        let videoCalls = UIButton(type: .custom)
        videoCalls.setImage(UIImage(named: "video_call"), for: .normal)
        videoCalls.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let videoCallsItem = UIBarButtonItem(customView: videoCalls)
        
        self.navigationItem.rightBarButtonItems = [btnCallsItem, videoCallsItem]
        
    }
    
    @objc func dismissChat(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didAddFile(_ sender: UIButton) {
        
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let phoneAction = UIAlertAction(title: "", style: .default) { (_) in
            print("camera action")
        }
        phoneAction.mode = .camera
        sheet.addAction(phoneAction)
        
        let homeAction = UIAlertAction(title: "", style: .default) { (_) in
            print("photo video action")
        }
        homeAction.mode = .photovideo
        sheet.addAction(homeAction)
        
        let documentAction = UIAlertAction(title: "", style: .default) { (_) in
            print("document action")
        }
        documentAction.mode = .document
        sheet.addAction(documentAction)
        
        let locationAction = UIAlertAction(title: "", style: .default) { (_) in
            print("location action")
        }
        locationAction.mode = .location
        sheet.addAction(locationAction)
        
        let contactAction = UIAlertAction(title: "", style: .default) { (_) in
            print("contact action")
        }
        contactAction.mode = .contact
        sheet.addAction(contactAction)
        
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(sheet, animated: true, completion: nil)
        
    }
    
    
}


