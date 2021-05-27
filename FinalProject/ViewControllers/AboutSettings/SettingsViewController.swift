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
    } ()
    
    var models = [Section]()
    
    
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
        models.append(Section(title: "음성 안내 설정", options: [
            .switchCell(model: SettingsSwitchOption(title: "인식 결과를 음성으로 알려줍니다.", icon: UIImage(systemName: "speaker.wave.2"), iconBackgroundColor: .systemIndigo, handler: {
                
            }, isOn: true)),
            
        ]))
        
        models.append(Section(title: "알림 설정", options: [
            .staticCell(model: SettingsOption(title: "안내 결과를 음성으로 알려줍니다.", icon: UIImage(systemName: "speaker.wave.2"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            }),
            .staticCell(model: SettingsOption(title: "안내 결과를 음성으로 알려줍니다.", icon: UIImage(systemName: "speaker.wave.2"), iconBackgroundColor: .systemGreen) {
                print("Tapped first cell")
            }),
            .staticCell(model: SettingsOption(title: "안내 결과를 음성으로 알려줍니다.", icon: UIImage(systemName: "speaker.wave.2"), iconBackgroundColor: .systemIndigo) {
                print("Tapped first cell")
            }),
            .staticCell(model: SettingsOption(title: "안내 결과를 음성으로 알려줍니다.", icon: UIImage(systemName: "speaker.wave.2"), iconBackgroundColor: .systemYellow) {
                print("Tapped first cell")
            })


        ]))
        
        models.append(Section(title: "기타 설정", options: [
            .staticCell(model: SettingsOption(title: "안내 결과를 음성으로 알려줍니다.", icon: UIImage(systemName: "speaker.wave.2"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            }),
            .staticCell(model: SettingsOption(title: "안내 결과를 음성으로 알려줍니다.", icon: UIImage(systemName: "speaker.wave.2"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            }),
            .staticCell(model: SettingsOption(title: "안내 결과를 음성으로 알려줍니다.", icon: UIImage(systemName: "speaker.wave.2"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            }),
            .staticCell(model: SettingsOption(title: "안내 결과를 음성으로 알려줍니다.", icon: UIImage(systemName: "speaker.wave.2"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            })


        ]))
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
