//
//  ViewController.swift
//  TableView
//
//  Created by Dima on 11.11.21.
//

import UIKit

class TableViewController: UIViewController {
    let height : CGFloat = 80
    let cellreuseXib = "cellreuseXib"
    var colorList = ColorModel.colors
    var lastLimit = 1
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cellreuseXib")
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = height
        tableView.rowHeight = UITableView.automaticDimension
        greatSwipe()
    }
    
    func greatSwipe() {
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(greatSwipeDirection(sender:)))
        leftSwipe.direction = .left
        tableView.addGestureRecognizer(leftSwipe)
    }
    
    @objc func greatSwipeDirection(sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .left:
            leftAnimate()
        default:
            break
        }
    }
    
    func leftAnimate() {
        colorList = (0..<lastLimit).map({index in colorList.randomElement()!})
        lastLimit += 1
        tableView.reloadData()
    }
}

extension TableViewController :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellreuseXib,  for: indexPath ) as? TableViewCell else {
            return UITableViewCell()
        }
        let color = colorList[indexPath.row]
        let textView = UITextView (frame: CGRect(x: 150, y: 14, width: 150, height: 50))
        let str = String(repeating: "TechMeSkills \r ", count:indexPath.row + 1)
        textView.text = str
        textView.backgroundColor = color
        let firstImage = UIImage(named: "image_1")!
        let secondImage = UIImageView(image: UIImage(named: "image_2"))
        secondImage.frame = CGRect(x: 150, y: 0, width: 80, height: 80)
        switch indexPath.row {
        case 0:
            cell.addSubview(textView)
        case 1:
            cell.addSubview(textView)
        case 2:
            textView.text = "TechMeSkills"
            cell.addSubview(textView)
            cell.imageView?.image = firstImage
        case 3:
            cell.imageView?.image = firstImage
            cell.addSubview(secondImage)
        default:
            break
        }
        cell.backgroundColor = color
        cell.selectionStyle = .none
        cell.onButtonTap = {
            tableView.backgroundColor = color
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height
    }
}

