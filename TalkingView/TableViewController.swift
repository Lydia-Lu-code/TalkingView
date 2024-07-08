import UIKit

class TableViewController: UITableViewController {
    
    let messages = ["Hello!", "How are you?", "I'm good, thanks!thanks!thanks!thanks!thanks!thanks!", "What about you?What about you?What about you?What about you?What about you?What about you?", "I'm doing well too."]
    let images: [UIImage?] = [UIImage(named: "image1"), UIImage(named: "image2"), UIImage(named: "image3"), UIImage(named: "image4"), UIImage(named: "image5")]
    let isIncomingMessages = [true, false, true, false, true] // 模擬A和B的對話
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TalkerCell.self, forCellReuseIdentifier: "ChatCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! TalkerCell
        let message = messages[indexPath.row]
        let image = images[indexPath.row]
        let isIncoming = isIncomingMessages[indexPath.row]
        cell.configure(with: message, image: image, isIncoming: isIncoming)
        
        // 打印消息文字
        print("Cell at row \(indexPath.row) configured with message: \(message)")
        
        return cell
    }
}



