//
//  ViewController.swift
//  MVC-N
//
//  Created by Александр Касьянов on 17.01.2022.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var comments = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //вызываем менеджер
        CommentNetworkService.getComments { (response) in
            self.comments = response.comments
            //перезагружаем tableView
            self.tableView.reloadData()
        }
    }
}

extension CommentsViewController: UITableViewDelegate {}
extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    //создаём ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentCell
        let comment = comments[indexPath.row]
        cell.configure(with: comment)
        return cell
    }
}
