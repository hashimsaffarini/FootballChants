//
//  PlayersViewController.swift
//  FootballChants
//
//  Created by Hashim Saffarini on 16/12/2025.
//

import UIKit

class PlayersViewController: UIViewController {
    
    private let playersListView = PlayersListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Players"
        setupViews()
    }
    
    private func setupViews(){
        view.addSubview(playersListView)
        NSLayoutConstraint.activate([
            playersListView.topAnchor.constraint(equalTo: view.topAnchor),
            playersListView.rightAnchor.constraint(equalTo: view.rightAnchor),
            playersListView.leftAnchor.constraint(equalTo: view.leftAnchor),
            playersListView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }


}
