//
//  TeamTableViewCell.swift
//  FootballChants
//
//  Created by Hashim Saffarini on 12/12/2025.
//

import UIKit

protocol TeamTableViewCellDelegate : AnyObject {
    func didTapPlaybackButton(for team: Team)
}

class TeamTableViewCell: UITableViewCell {
    
    static let id = "TeamTableViewCell"
    private weak var delegate : TeamTableViewCellDelegate?
    private var team : Team?
    
    private var containerView : UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private var contentStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private var badgeImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var playbackButton : UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var nameLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private var foundedLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .white
        return label
    }()
    
    private var jobLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .white
        return label
    }()
    
    private var infoLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 10
    }
    
    func configure(_ team: Team , delegate : TeamTableViewCellDelegate) {
        self.delegate = delegate
        self.team = team
        playbackButton.setImage(team.isPlaying ? Assets.pause : Assets.play, for: .normal)
        containerView.backgroundColor = team.id.background
        badgeImageView.image = team.id.badge
        nameLabel.text = team.name
        jobLabel.text = "Current \(team.manager.job.rawValue) : \(team.manager.name)"
        foundedLabel.text = team.founded
        infoLabel.text = team.info
    }
    
    @objc private func didTapPlayback() {
        guard let team = team else { return }
        
        let newImage = team.isPlaying ? Assets.play : Assets.pause
        playbackButton.setImage(newImage, for: .normal)
        
        delegate?.didTapPlaybackButton(for: team)
    }
    
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(contentStackView)
        containerView.addSubview(badgeImageView)
        containerView.addSubview(playbackButton)
        
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(foundedLabel)
        contentStackView.addArrangedSubview(jobLabel)
        contentStackView.addArrangedSubview(infoLabel)
        
        playbackButton.addTarget(self, action: #selector(didTapPlayback), for: .touchUpInside)

    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -8),
            
            badgeImageView.heightAnchor.constraint(equalToConstant: 50),
            badgeImageView.widthAnchor.constraint(equalToConstant: 50),
            badgeImageView.topAnchor.constraint(equalTo: contentStackView.topAnchor),
            badgeImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),

            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            contentStackView.leadingAnchor.constraint(equalTo: badgeImageView.trailingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: playbackButton.leadingAnchor, constant: -8),

            playbackButton.heightAnchor.constraint(equalToConstant: 44),
            playbackButton.widthAnchor.constraint(equalToConstant: 44),
            playbackButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            playbackButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }

}
