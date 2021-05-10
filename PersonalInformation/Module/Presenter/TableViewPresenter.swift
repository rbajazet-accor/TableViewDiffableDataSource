//
//  TableViewPresenter.swift
//  PersonalInformation
//
//  Created by Ronaël Bajazet on 06/05/2021.
//

import Foundation

struct SectionIdentifier: Hashable {
  var id: Int
  var itemIdentifiers: [ItemIdentifier]

  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

struct ItemIdentifier: Hashable {
  var id: Int
}

struct TextFieldViewItem {
  var title: String
  var value: String
  var message: String
}

struct SwitchViewItem {
  var title: String
  var value: Bool
  var message: String
}

enum ViewItemType {
  case textField(TextFieldViewItem)
  case `switch`(SwitchViewItem)
}

public final class TableViewPresenter: PersonalInformationPresenterInput {

  private let interactor: PersonalInformationInteractorInput
  weak var output: TableViewController?
  private var viewItems: [ItemIdentifier: ViewItemType] = [:]

  init(interactor: PersonalInformationInteractor) {
    self.interactor = interactor
  }

  func viewDidLoad() {
    interactor.retrieve()
  }

  func viewRefreshing() {
    interactor.update()
  }

  func viewItem(for itemIdentifier: ItemIdentifier) -> ViewItemType? {
    return viewItems[itemIdentifier]
  }
}

extension TableViewPresenter: PersonalInformationInteractorOuput {
  func load(data: InteractorModel) {
    viewItems = data.names.reduce(into: [:]) {
      $0[ItemIdentifier(id: $1.id)] = .textField(TextFieldViewItem(title: $1.name, value: "", message: ""))
    }

    output?.displayNames([SectionIdentifier(id: 0, itemIdentifiers: Array(viewItems.keys))])
  }

  func update(data: InteractorModel) {
    viewItems = data.names.reduce(into: [:]) {
      $0[ItemIdentifier(id: $1.id)] = .textField(TextFieldViewItem(title: $1.name, value: "", message: ""))
    }

    output?.updateNames([SectionIdentifier(id: 0, itemIdentifiers: Array(viewItems.keys))])
  }
}

protocol PersonalInformationPresenterInput {
  func viewDidLoad()
  func viewRefreshing()
  func viewItem(for itemIdentifier: ItemIdentifier) -> ViewItemType?
}

protocol PersonalInformationPresenterOutput: AnyObject {
  func displayNames(_ sections: [SectionIdentifier])
  func updateNames(_ sections: [SectionIdentifier])
}
