//
//  RSSFeedVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 30/06/23.
//

import UIKit
import SWXMLHash

struct NewsFeed {
    var title = ""
    var url = ""
    var description = ""
    var pubDate = Date()
}

class RSSFeedVC: UIViewController {
    // MARK: - Variables
    private let vcTitle = "RSS News Feed"
    private var channelName = ""
    private var channelURL = ""
    private var imageURL = ""
    private var newsItems = [NewsFeed]()

    // MARK: - IB Outlets
    @IBOutlet private weak var tblRSSFeed: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = vcTitle
        tableViewSetup()
    }
}

// MARK: - Table View Datasource & Delegate Methods
extension RSSFeedVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblRSSFeed.dequeueReusableCell(withIdentifier: R.reuseIdentifier.rssFeedTVCell, for: indexPath) else {
            return UITableViewCell()
        }
        cell.configure(with: newsItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

// MARK: - Functions
extension RSSFeedVC {
    private func tableViewSetup() {
        tblRSSFeed.delegate = self
        tblRSSFeed.dataSource = self
        tblRSSFeed.register(R.nib.rssFeedTVCell)
        getRSSNewsFeed()
    }

    func getRSSNewsFeed() {
        activityIndicator.startAnimating()
        let url = URL(string: "https://www.nytimes.com/svc/collections/v1/publish/https://www.nytimes.com/section/world/rss.xml")
        let task = URLSession.shared.dataTask(with: url! as URL) { [weak self] (data, response, error) in
            if data != nil
            {
                guard let self else {
                    return
                }
                
                let feed=NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
                let xml = SWXMLHash.parse(feed)

                self.channelName = xml["rss"]["channel"]["title"].element!.text
                self.channelURL = xml["rss"]["channel"]["link"].element!.text
                self.imageURL = xml["rss"]["channel"]["image"]["url"].element!.text

                for elem in xml["rss"]["channel"]["item"].all
                {
                    var item = NewsFeed()
                    item.title = elem["title"].element!.text
                    item.description = elem["description"].element!.text
                    item.url = elem["link"].element!.text
                    item.pubDate = self.cleanDate(date: elem["pubDate"].element!.text)
                    self.newsItems.append(item)
                    //Sort the news items by publication date
                    self.newsItems = self.newsItems.sorted{$0.pubDate.compare($1.pubDate) == .orderedDescending}
                }
                
                print(self.newsItems)
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.tblRSSFeed.reloadData()
                }
            }
        }
        task.resume()
    }

    func cleanDate(date: String) -> Date
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        let pubDate = dateFormatter.date(from:date)!
        return pubDate
    }
}
