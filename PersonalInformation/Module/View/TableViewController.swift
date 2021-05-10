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
    let cellNib = UINib(nibName: "CompositionFieldTableViewCell", bundle: .main)
    tableView.register(cellNib, forCellReuseIdentifier: "compositionCellID")

    let refreshControl = UIRefreshControl()
    refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
    refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    tableView.refreshControl = refreshControl
  }

  private func makeDataSource() -> UITableViewDiffableDataSource<SectionIdentifier, ItemIdentifier> {
    UITableViewDiffableDataSource<SectionIdentifier, ItemIdentifier> (tableView: tableView) { tableView, indexPath, itemIdentifier in
      switch self.presenter.viewItem(for: itemIdentifier) {

      case let .textField(viewItem):
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "compositionCellID", for: indexPath) as? CompositionFieldTableViewCell else {
          print("cell not found")
          return nil
        }
        cell.configure(with: viewItem.title)
        return cell

      case .switch:
        break

      default:
        break
      }
      return nil
    }
  }
}

extension TableViewController: PersonalInformationPresenterOutput {
  func displayNames(_ sections: [SectionIdentifier]) {
    var snapshot = NSDiffableDataSourceSnapshot<SectionIdentifier, ItemIdentifier>()
    snapshot.appendSections(sections)
    sections.forEach {
      snapshot.appendItems($0.itemIdentifiers)
    }
    diffableDataSource.apply(snapshot)
  }

  func updateNames(_ sections: [SectionIdentifier]) {
    tableView.refreshControl?.endRefreshing()

    var snapshot = NSDiffableDataSourceSnapshot<SectionIdentifier, ItemIdentifier>()
    snapshot.appendSections(sections)
    sections.forEach {
      snapshot.appendItems($0.itemIdentifiers)
    }
    diffableDataSource.apply(snapshot)
  }
}
