import UIKit
import Kingfisher

class PaddingLabel: UILabel {
    var topInset: CGFloat = 4
    var bottomInset: CGFloat = 4
    var leftInset: CGFloat = 10
    var rightInset: CGFloat = 10

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}

class FavoritesCollectionViewCell: UICollectionViewCell {
    static let id = "FavoritePlayerCell"
    
    // MARK: - UI Elements
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemGroupedBackground
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.08
        view.layer.shadowRadius = 12
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        return view
    }()
    
    private var playerImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 18
        img.backgroundColor = .systemGray6
        return img
    }()
    
    private var infoStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 8
        return stack
    }()
    
    private var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        lbl.textColor = .label
        return lbl
    }()
    
    private var positionLabel: PaddingLabel = {
        let lbl = PaddingLabel()
        lbl.font = UIFont.systemFont(ofSize: 10, weight: .black)
        lbl.textColor = .systemBlue
        lbl.backgroundColor = .systemBlue.withAlphaComponent(0.12)
        lbl.layer.cornerRadius = 6
        lbl.clipsToBounds = true
        return lbl
    }()
    
    private var detailsLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        lbl.textColor = .secondaryLabel
        return lbl
    }()
    
    private var removeButton: UIButton = {
        let btn = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 14, weight: .bold)
        btn.setImage(UIImage(systemName: "xmark", withConfiguration: config), for: .normal)
        btn.tintColor = .systemGray
        btn.backgroundColor = .systemGray6
        btn.layer.cornerRadius = 14
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var onRemove: (() -> Void)?
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(playerImageView)
        containerView.addSubview(infoStack)
        containerView.addSubview(removeButton)
        
        infoStack.addArrangedSubview(nameLabel)
        infoStack.addArrangedSubview(positionLabel)
        infoStack.addArrangedSubview(detailsLabel)
        
        removeButton.addTarget(self, action: #selector(didTapRemove), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            
            playerImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            playerImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            playerImageView.widthAnchor.constraint(equalToConstant: 80),
            playerImageView.heightAnchor.constraint(equalToConstant: 80),
            
            infoStack.leadingAnchor.constraint(equalTo: playerImageView.trailingAnchor, constant: 16),
            infoStack.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            infoStack.trailingAnchor.constraint(lessThanOrEqualTo: removeButton.leadingAnchor, constant: -8),
            
            removeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -14),
            removeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 14),
            removeButton.widthAnchor.constraint(equalToConstant: 28),
            removeButton.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    @objc private func didTapRemove() {
        onRemove?()
    }
    
    func configure(with player: Player) {
        playerImageView.kf.setImage(with: URL(string: player.photo))
        nameLabel.text = player.name
        positionLabel.text = player.position.uppercased()
        
        detailsLabel.text = "No. \(player.number)  •  \(player.age) Years"
    }
}
