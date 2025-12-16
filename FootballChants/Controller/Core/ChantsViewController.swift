//
//  ChantsViewController.swift
//  FootballChants
//
//  Created by Hashim Saffarini on 12/12/2025.
//

import UIKit

class ChantsViewController: UIViewController {

    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.allowsSelectionDuringEditing = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 44
        tableView.backgroundColor = .clear
        tableView.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.id)
        return tableView
    }()
    
    private var teamsViewModel = TeamsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Teams"
        setupTableView()
    }
}

extension ChantsViewController {
    func setupTableView() {


        tableView.dataSource = self
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ChantsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsViewModel.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.id, for: indexPath) as! TeamTableViewCell
        let item = teamsViewModel.teams[indexPath.row]
        
        cell.configure(item , delegate: self)

        return cell
    }
    
    
}


extension ChantsViewController : TeamTableViewCellDelegate {
    func didTapPlaybackButton(for team: Team) {
        guard let index = teamsViewModel.teams.firstIndex(where: { $0.id == team.id }) else { return }
        
        teamsViewModel.teams[index].isPlaying.toggle()
        
        let indexPath = IndexPath(row: index, section: 0)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
}
