//
//  ViewController.swift
//  APIPractice
//
//  Created by 優樹永井 on 2019/08/11.
//  Copyright © 2019 com.nagai. All rights reserved.
//

import UIKit

class QiitaViewController: UIViewController {
    private var tableView = UITableView()
    fileprivate var articles: [QiitaStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "QiitaAPI"
        
        tableView.dataSource = self
        tableView.frame = view.frame
        view.addSubview(tableView)
        QiitaViewModel.fetchArticle(completion: { (articles) in
            self.articles = articles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension QiitaViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.user.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
}
