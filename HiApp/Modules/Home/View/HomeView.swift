//  
//  HomeView.swift
//  HiApp
//
//  Created by Agus Cahyono on 10/04/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class HomeView: HiBase, UISearchControllerDelegate {
    

    // OUTLETS HERE
    @IBOutlet weak var tableView: UITableView!
    // VARIABLES HERE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.extendedLayoutIncludesOpaqueBars = true
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        self.tableView.backgroundColor = .white
        self.tableView.allowsMultipleSelectionDuringEditing = true
        
        tableView.register(MessageListTableViewCell.reusableNIB(), forCellReuseIdentifier: MessageListTableViewCell.reusableIndentifer)
        
        self.addBarItem()
        
    }
    
    
    // MARK: Add with Programmatically UIBarbuttonItem
    fileprivate func addBarItem() {
        // more and search
        let moreButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(self.openmoremenu(_:)))
        self.navigationItem.rightBarButtonItem = moreButtonItem
        self.navigationController?.navigationBar.tintColor = .white
        
        let rightButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.showEditing(_:)))
        self.navigationItem.leftBarButtonItem = rightButton
        
        if #available(iOS 11.0, *) {
            let sc = UISearchController(searchResultsController: nil)
            sc.delegate = self
            let scb = sc.searchBar
            scb.tintColor = UIColor.white
            scb.barTintColor = UIColor.white
            
            if let textfield = scb.value(forKey: "searchField") as? UITextField {
                textfield.textColor = UIColor.blue
                if let backgroundview = textfield.subviews.first {
                    // Background color
                    backgroundview.backgroundColor = UIColor.hexStringToUIColor(hex: "#f5f5f5")
                    // Rounded corner
                    backgroundview.layer.cornerRadius = 10
                    backgroundview.clipsToBounds = true
                }
            }
            navigationItem.searchController = sc
            navigationItem.hidesSearchBarWhenScrolling = true
        }
        self.setupToolbar()
        
    }
    
    func setupToolbar() {
        //toolbar setup
        let flexible = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let deleteButton: UIBarButtonItem = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(didPressDelete))
        let archiveButton: UIBarButtonItem = UIBarButtonItem(title: "Archive", style: .plain, target: self, action: #selector(didPressDelete))
        self.toolbarItems = [archiveButton, flexible, deleteButton]
        self.navigationController?.toolbar.barTintColor = UIColor.white
        
        self.navigationController?.setToolbarHidden(true, animated: true)
    }
    
    @objc func didPressDelete() {
        let selectedRows = self.tableView.indexPathsForSelectedRows
        if selectedRows != nil {
            if let rows = selectedRows {
                //                self.tableView.beginUpdates()
                //                self.tableView.deleteRows(at: rows, with: .fade)
                //                self.tableView.endUpdates()
            }
        }
    }
    
    
    /// SHOW EDITING TABLEVIEW
    ///
    /// - Parameter sender: UIBarButtonItem
    @objc func showEditing(_ sender: UIBarButtonItem)
    {
        if(self.tableView.isEditing == true)
        {
            self.tableView.isEditing = false
            self.navigationItem.rightBarButtonItem?.title = "Done"
            self.navigationController?.setToolbarHidden(true, animated: true)
        }
        else
        {
            self.tableView.isEditing = true
            self.navigationItem.rightBarButtonItem?.title = "Edit"
            self.navigationController?.setToolbarHidden(false, animated: true)
        }
    }
    
    
    /// OPEN MENU
    ///
    /// - Parameter sender: UIBarButtonItem
    @objc func openmoremenu(_ sender: UIBarButtonItem) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Chats"
        self.navigationController?.navigationBar.tintColor = UIColor.hexStringToUIColor(hex: "#c30f42")
    }
    
    
    
}


// MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageListTableViewCell.reusableIndentifer, for: indexPath) as! MessageListTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatview = ChatViewView(nibName: "ChatViewView", bundle: Bundle.main)
        chatview.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(chatview, animated: true)
    }
    
}
