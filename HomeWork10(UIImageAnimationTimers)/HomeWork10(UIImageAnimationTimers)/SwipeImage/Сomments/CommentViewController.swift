//
//  СommentViewController.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 12.11.21.
//

import UIKit

struct Comments: Codable{
    let commentText: String
}

class CommentViewController: UIViewController {
    private var alert: Alert!
    let height : CGFloat = 50
    let cellreuseXib = "cellreuseXib"
    var arrayComment: [String] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cellreuseXib")
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = height
        tableView.rowHeight = UITableView.automaticDimension
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        navigationController?.navigationBar.barTintColor = .lightGray
        navigationController?.navigationBar.tintColor = .darkGray
        createAddButton()
        createCanselButton()

    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 2
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    private func createAddButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTapAddButton)
        )
    }
    
    @objc func  didTapAddButton() {
        setAlert()
        
    }
    
        func setAlert() {
            alert = Alert.loadfronNIB()
            view.addSubview(alert)
            alert.center = view.center
            alert.setTitle(title: "Comments", exitTitle: "Save",yesTitle: "Exit")
            alert.exit.addTarget(self, action: #selector(continPressed), for: .touchUpInside)
            alert.YesButton.addTarget(self, action: #selector(exitPressed), for: .touchUpInside)
            alert.YesButton.addShadow()
            alert.YesButton.addGradient()
            alert.exit.addShadow()
            alert.exit.addGradient()
            alert.comments.resignFirstResponder()
            print(arrayComment.count)
        }
        
        @objc func exitPressed() {
            alert.removeFromSuperview()
            self.dismiss(animated: true)
        }
        
        @objc func continPressed() {
            arrayComment.append( alert.comments.text)
            addToDefaults()
            alert.removeFromSuperview()
            tableView.reloadData()
        }
    
    func addToDefaults() {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        let coments = Comments(commentText: alert.comments.text!)
        if let data = try? encoder.encode(coments.commentText) {
            for (key,_) in imageDic {
            defaults.set(data, forKey: key)
        }
        }
    }
        
    private func createCanselButton() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel ,
            target: self,
            action: #selector(didTapCanselButton)
        )
    }
    
    @objc func  didTapCanselButton() {
        self.dismiss(animated: true)
    }
}
extension CommentViewController :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayComment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellreuseXib,  for: indexPath ) as? TableViewCell else {
            return UITableViewCell()
            
        }
        cell.labelComments.text = arrayComment[indexPath.row]
      return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height
    }
}
