import UIKit

class TalkerCell: UITableViewCell {
    
    let profileImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.layer.cornerRadius = 20
        img.clipsToBounds = true
        return img
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let bubbleBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    var isIncoming: Bool = true {
        didSet {
            updateConstraintsForDirection()
            updateColorsForDirection()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(bubbleBackgroundView)
        bubbleBackgroundView.addSubview(messageLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with message: String, image: UIImage?, isIncoming: Bool) {
        messageLabel.text = message
        profileImageView.image = image
        self.isIncoming = isIncoming
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        messageLabel.text = nil
        profileImageView.image = nil
    }
    
    private func updateConstraintsForDirection() {
        NSLayoutConstraint.deactivate(profileImageView.constraints)
        NSLayoutConstraint.deactivate(bubbleBackgroundView.constraints)
        NSLayoutConstraint.deactivate(messageLabel.constraints)
        
        if isIncoming {
            NSLayoutConstraint.activate([
                profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                profileImageView.widthAnchor.constraint(equalToConstant: 40),
                profileImageView.heightAnchor.constraint(equalToConstant: 40),
                
                bubbleBackgroundView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
                bubbleBackgroundView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -40),
                bubbleBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                bubbleBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                
                messageLabel.leadingAnchor.constraint(equalTo: bubbleBackgroundView.leadingAnchor, constant: 8),
                messageLabel.trailingAnchor.constraint(equalTo: bubbleBackgroundView.trailingAnchor, constant: -8),
                messageLabel.topAnchor.constraint(equalTo: bubbleBackgroundView.topAnchor, constant: 8),
                messageLabel.bottomAnchor.constraint(equalTo: bubbleBackgroundView.bottomAnchor, constant: -8)
            ])
        } else {
            NSLayoutConstraint.activate([
                profileImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                profileImageView.widthAnchor.constraint(equalToConstant: 40),
                profileImageView.heightAnchor.constraint(equalToConstant: 40),
                
                bubbleBackgroundView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 40),
                bubbleBackgroundView.trailingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: -8),
                bubbleBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                bubbleBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                
                messageLabel.leadingAnchor.constraint(equalTo: bubbleBackgroundView.leadingAnchor, constant: 8),
                messageLabel.trailingAnchor.constraint(equalTo: bubbleBackgroundView.trailingAnchor, constant: -8),
                messageLabel.topAnchor.constraint(equalTo: bubbleBackgroundView.topAnchor, constant: 8),
                messageLabel.bottomAnchor.constraint(equalTo: bubbleBackgroundView.bottomAnchor, constant: -8)
            ])
        }

    }

 
    private func updateColorsForDirection() {
        if isIncoming {
            profileImageView.backgroundColor = .yellow
            bubbleBackgroundView.backgroundColor = .blue
        } else {
            profileImageView.backgroundColor = .white
            bubbleBackgroundView.backgroundColor = .green
        }
    }
}


