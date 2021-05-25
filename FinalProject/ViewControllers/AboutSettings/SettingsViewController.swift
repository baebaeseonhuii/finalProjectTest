//
//  SettingsViewController.swift
//  FinalProject
//
//  Created by Sun hee Bae on 2021/04/27.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOption]
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifier)
        return table
    } ()
    
    var models = [SettingsOption]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "환경설정"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure() {
        self.models = Array(0...5).compactMap({
            SettingsOption(title: "Item \($0)", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                
            }
        })
    }
    
//    func configure() {
//        models.append(Section(title: "음성 안내", options: [
//            SettingsOption(title: "안내 결과를 음성으로 알려줍니다.", icon: UIImage(systemName: "mic"), iconBackgroundColor: .systemPink) {
//
//            },
//            SettingsOption(title: "안내 결과를 음성으로 알려줍니다.", icon: UIImage(systemName: "mic"), iconBackgroundColor: .systemPink) {
//
//            },
//            SettingsOption(title: "안내 결과를 음성으로 알려줍니다.", icon: UIImage(systemName: "mic"), iconBackgroundColor: .systemPink) {
//
//            },
//            SettingsOption(title: "안내 결과를 음성으로 알려줍니다.", icon: UIImage(systemName: "mic"), iconBackgroundColor: .systemPink) {
//
//            },
//
//        ]))
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath
        ) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
}
