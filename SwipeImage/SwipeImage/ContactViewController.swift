//
//  ContactViewController.swift
//  SwipeImage
//
//  Created by Dima on 8.12.21.
//

import UIKit
import Contacts
import ContactsUI

struct Person {
    let name: String
    let id: String
    let source: CNContact
}

class ContactViewController: UIViewController,CNContactPickerDelegate ,UITableViewDataSource, UITableViewDelegate{
    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    var models = [Person]()
    override func viewDidLoad() {
        config()
    }
    
    func config() {
        view.addSubview(table)
        table.frame = view.bounds
        table.dataSource = self
        table.delegate = self
        super.viewDidLoad()
        addNavItem()
        
    }
    
    func addNavItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    @objc func didTapAdd() {
        let vc = CNContactPickerViewController()
        vc.delegate = self
        present(vc,animated: true)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let name = contact.givenName + "" + contact.familyName
        let identifier = contact.identifier
        let model = Person(name: name, id: identifier, source: contact )
        models.append(model)
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = models[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        let contact = models[indexPath.row].source
        let vc = CNContactViewController(for: contact)
        present(UINavigationController(rootViewController: vc),animated: true)
    }
}
