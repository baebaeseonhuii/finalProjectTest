//
//  SettingsViewController.swift
//  FinalProject
//
//  Created by Sun hee Bae on 2021/04/27.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
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
        table.register(SwitchTableViewCell.self,
                       forCellReuseIdentifier: SwitchTableViewCell.identifier)
        
        return table
    }()
    
    var models = [Section]()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.setTitle("어플 공유하기", for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "환경설정"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        shareButton.frame = CGRect(x: 20, y: 600, width: 350, height: 100)
        //shareButton.center = view.center
        shareButton.layer.cornerRadius = 20
        shareButton.addTarget(self, action: #selector(presentShareSheet(_:)), for: .touchUpInside)
        view.addSubview(shareButton)
    }
    
    func configure() {
        models.append(Section(title: "음성 안내 설정", options: [
            .switchCell(model: SettingsSwitchOption(title: "인식 결과를 음성으로 알려줍니다.", icon: UIImage(systemName: "speaker.wave.2"), iconBackgroundColor: .link, handler: {
                
            }, isOn: true)),
            
        ]))
        models.append(Section(title: "알림 설정", options: [
            .switchCell(model: SettingsSwitchOption(title: "즐겨찾기에 추가되면 알람이 옵니다.", icon: UIImage(systemName: "speaker.wave.2"), iconBackgroundColor: .systemGreen, handler: {
                
            }, isOn: true)),
            
        ]))
        models.append(Section(title: "기타 설정", options: [
            .switchCell(model: SettingsSwitchOption(title: "볼륨 버튼을 누를 때마다 촬영합니다.", icon: UIImage(systemName: "speaker.wave.2"), iconBackgroundColor: .systemYellow, handler: {
                
            }, isOn: true)),
            
        ]))
        
        
    }
    
    @objc private func presentShareSheet(_ sender: UIButton) {
        guard let url = URL(string: "https://baebaeseonhuii.github.io/finalProjectTest/") else {
            return
        }
        
        let shareSheetVC = UIActivityViewController(activityItems: [url],
                                                    applicationActivities: nil)
        
        present(shareSheetVC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath
            ) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
            
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath
            ) as? SwitchTableViewCell
            else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.row].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
}
