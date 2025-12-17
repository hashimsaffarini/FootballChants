//
//  FavoriteViewController.swift
//  FootballChants
//
//  Created by Hashim Saffarini on 16/12/2025.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    private let listView = FavoritesListView()
    private let viewModel = FavoritesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Favorites"
        
        setupLayout()
        bind()
        loadData()
    }
    
    private func setupLayout() {
        view.addSubview(listView)
        listView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            listView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFavorites()
    }

    private func updateFavorites() {
        viewModel.loadFavorites()
        listView.apply(players: FavoritesViewModel.favoritesPlayers)
    }

    private func bind() {
        listView.onRemovePlayer = { [weak self] player in
            self?.viewModel.remove(player: player)
            // تحديث القائمة بعد الحذف
            self?.listView.apply(players: FavoritesViewModel.favoritesPlayers)
        }
    }
    
    private func loadData() {
        viewModel.loadFavorites()
        listView.apply(players: FavoritesViewModel.favoritesPlayers, animated: true)
    }
}
