//
//  HomeViewController.swift
//  Insagram
//
//  Created by Kirill Dev on 27.02.2023.
//

import UIKit

final class HomeViewController: UIViewController {


  @IBOutlet private weak var feedTableView: UITableView!
  
  private var posts = Source.makePost()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setTable()
    setRefreshForTable()
  }
  
  @objc private func refresh() {
    feedTableView.refreshControl?.endRefreshing()
  }
  
  private func setTable() {
    feedTableView.delegate = self
    feedTableView.dataSource = self
    
    feedTableView.register(StoriesTableViewCell.self, forCellReuseIdentifier: "StoriesCell")
    feedTableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedCell")
    feedTableView.register(RecommendationTableViewCell.self, forCellReuseIdentifier: "RecomendationCell")
    feedTableView.separatorColor = .systemGray
  }
  
  private func setRefreshForTable() {
    feedTableView.refreshControl = UIRefreshControl()
    feedTableView.refreshControl?.tintColor = .white
    feedTableView.refreshControl?.addTarget(self,
                                            action: #selector(refresh),
                                            for: .valueChanged)
  }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
      3
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0, 2: return 1
    case 1: return posts.count
    default: return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch indexPath.section {
    case 0:
      guard let cell = feedTableView.dequeueReusableCell(withIdentifier: "StoriesCell", for: indexPath) as? StoriesTableViewCell else { fatalError() }
      return cell
    case 1:
      guard let cell = feedTableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as? FeedTableViewCell else { fatalError() }
      cell.configure(post: posts[indexPath.row])
      return cell
    case 2:
      guard let cell = feedTableView.dequeueReusableCell(withIdentifier: "RecomendationCell", for: indexPath) as? RecommendationTableViewCell else { fatalError() }
      return cell
    default: return UITableViewCell()
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.section {
    case 0: return 90
    case 1: return 600
    case 2: return 300
    default: return UITableView.automaticDimension
    }
  }
}
