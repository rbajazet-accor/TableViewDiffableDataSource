//
//  TableViewController.swift
//  PersonalInformation
//
//  Created by Ronaël Bajazet on 06/05/2021.
//

import UIKit

public final class TableViewController: UIViewController {

  // MARK: - Outlets

  @IBOutlet private(set) var tableView: UITableView!

  // MARK: - Properties

  private lazy var diffableDataSource = makeDataSource()

  private lazy var presenter: PersonalInformationPresenterInput = {
    let interactor = PersonalInformationInteractor()
    let presenter = TableViewPresenter(interactor: interactor)
    presenter.output = self
    interactor.ouput = presenter
    return presenter
  }()

  // MARK: - Lifecycle

  public override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    presenter.viewDidLoad()
  }

  // MARK: - Private

  @objc private func refresh(_ sender: AnyObject) {
    presenter.viewRefreshing()
  }

  private func setupView() {
    let fieldCellNib = UINib(nibName: "CompositionFieldTableViewCell", bundle: .main)
    tableView.register(fieldCellNib, forCellReuseIdentifier: "compositionFieldCellID")
    let switchCellNib = UINib(nibName: "CompositionSwitchTableViewCell", bundle: .main)
    tableView.register(switchCellNib, forCellReuseIdentifier: "compositionSwitchCellID")
    tableView.delegate = self

    let refreshControl = UIRefreshControl()
    refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
    refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    tableView.refreshControl = refreshControl
  }

  private func makeDataSource() -> UITableViewDiffableDataSource<SectionIdentifier, ItemIdentifier> {
    TableViewDataSource(tableView: tableView) { tableView, indexPath, itemIdentifier in

      switch itemIdentifier.type {
      case let .textField(viewItem):
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "compositionFieldCellID", for: indexPath) as? CompositionFieldTableViewCell else {
          print("cell not found")
          return nil
        }
        cell.configure(with: viewItem.title, value: viewItem.value)
        return cell

      case .switch:
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "compositionSwitchCellID", for: indexPath) as? CompositionSwitchTableViewCell else {
          print("cell not found")
          return nil
        }

        return cell
      }
    }
  }
}

extension TableViewController: UITableViewDelegate {
  public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Bye", handler: { _, _, _ in
      self.presenter.viewDidDelete()
    })])
  }
}


extension TableViewController: PersonalInformationPresenterOutput {
  func displayForm(with sections: [SectionIdentifier]) {
    var snapshot = NSDiffableDataSourceSnapshot<SectionIdentifier, ItemIdentifier>()
    snapshot.appendSections(sections)
    sections.forEach {
      snapshot.appendItems($0.itemIdentifiers)
    }
    diffableDataSource.apply(snapshot)
  }

  func updateForm(with sections: [SectionIdentifier]) {
    tableView.refreshControl?.endRefreshing()

    var snapshot = NSDiffableDataSourceSnapshot<SectionIdentifier, ItemIdentifier>()
    snapshot.appendSections(sections)
    sections.forEach {
      snapshot.appendItems($0.itemIdentifiers)
    }
    diffableDataSource.apply(snapshot)
  }
}

private class TableViewDataSource: UITableViewDiffableDataSource<SectionIdentifier, ItemIdentifier> {
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    true
  }
}
