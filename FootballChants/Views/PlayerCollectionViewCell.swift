//
//  PlayerCollectionViewCell.swift
//  FootballChants
//
//  Created by Hashim Saffarini on 16/12/2025.
//

import UIKit
import Kingfisher

class PlayerCollectionViewCell: UICollectionViewCell {
    
    static let id = "PlayerCollectionViewCell"
    
    private var containerView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .clear
        
        container.layer.shadowColor = UIColor.black.cgColor
        
        container.layer.shadowOpacity = 0.25
        
        container.layer.shadowRadius = 8
        
        container.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        container.clipsToBounds = false
        return container
    }()
    
    private var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.separator.withAlphaComponent(0.1).cgColor
        view.clipsToBounds = true
        return view
    }()
    
    private var infoTextStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        return stackView
    }()
    
    private var contentStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private var infoStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var imageView : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.backgroundColor = UIColor.systemGray6
        img.layer.cornerRadius = 0
        img.clipsToBounds = true
        return img
    }()
    
    private var nameLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        lbl.textColor = .label
        lbl.numberOfLines = 2
        return lbl
    }()
    
    private var positionLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        lbl.textColor = .systemBlue
        return lbl
    }()
    
    private var numberLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        lbl.textColor = .secondaryLabel
        lbl.textAlignment = .center
        return lbl
    }()
    
    private var ageLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        lbl.textColor = .secondaryLabel
        lbl.textAlignment = .center
        return lbl
    }()
    
    private var favBtn : UIButton = {
        let btn = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .semibold)
        let img = UIImage(systemName: "heart", withConfiguration: config)
        btn.setImage(img, for: .normal)
        let filledImg = UIImage(systemName: "heart.fill", withConfiguration: config)
        btn.setImage(filledImg, for: .selected)
        btn.tintColor = .systemRed
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 18
        btn.clipsToBounds = true
        btn.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.95)
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.15
        btn.layer.shadowOffset = CGSize(width: 0, height: 2)
        btn.layer.shadowRadius = 4
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addSubview(containerView)
        
        containerView.addSubview(cardView)
        containerView.addSubview(favBtn)
        
        cardView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(imageView)
        contentStackView.addArrangedSubview(infoTextStackView)
        
        infoTextStackView.addArrangedSubview(nameLabel)
        infoTextStackView.addArrangedSubview(positionLabel)
        infoTextStackView.addArrangedSubview(infoStackView)
        
        infoStackView.addArrangedSubview(numberLabel)
        infoStackView.addArrangedSubview(ageLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            cardView.topAnchor.constraint(equalTo: containerView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 0),
            contentStackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 0),
            contentStackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 0),
            contentStackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -12),
            
            imageView.heightAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 0.65),
            
            favBtn.widthAnchor.constraint(equalToConstant: 36),
            favBtn.heightAnchor.constraint(equalToConstant: 36),
            favBtn.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            favBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])
    }
    
    func configure(with player : Player){
        imageView.kf.setImage(with: URL(string : player.photo))
        nameLabel.text = player.name
        positionLabel.text = player.position.uppercased()
        numberLabel.text = "#\(player.number)"
        ageLabel.text = "\(player.age) yrs"
    }
}
