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
  var type: ViewItemType

  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

struct TextFieldViewItem: Equatable {
  var title: String
  var value: String
  var message: String
}

struct SwitchViewItem: Equatable {
  var title: String
  var value: Bool
  var message: String
}

enum ViewItemType: Equatable {
  case textField(TextFieldViewItem)
  case `switch`(SwitchViewItem)

  static func == (lhs: ViewItemType, rhs: ViewItemType) -> Bool {
    switch (lhs, rhs) {
    case let (.textField(lhsViewItem), .textField(rhsViewItem)):
      return lhsViewItem == rhsViewItem
    case let (.switch(lhsViewItem), .switch(rhsViewItem)):
      return lhsViewItem == rhsViewItem
    default:
      return false
    }
  }
}

public final class TableViewPresenter: PersonalInformationPresenterInput {

  private let interactor: PersonalInformationInteractorInput
  weak var output: PersonalInformationPresenterOutput?
  private var viewItems: [ItemIdentifier] = []

  init(interactor: PersonalInformationInteractor) {
    self.interactor = interactor
  }

  func viewDidLoad() {
    interactor.retrieve()
  }

  func viewRefreshing() {
    interactor.update()
  }

  func viewDidDelete() {
    interactor.remove()
  }
}

extension TableViewPresenter: PersonalInformationInteractorOuput {
  func load(data: [PersonalInformationCategory]) {
    viewItems = data.map {
      switch $0 {
      case let .firstName(id, value):
        return ItemIdentifier(id: id, type: .textField(TextFieldViewItem(title: "Prénom", value: value, message: "")))
      case let .lastName(id, value):
        return ItemIdentifier(id: id, type: .textField(TextFieldViewItem(title: "Nom", value: value, message: "")))
      case let .address(id, value):
        return ItemIdentifier(id: id, type: .textField(TextFieldViewItem(title: "Adresse", value: value, message: "")))
      case let .russianLaw(id, value):
        return ItemIdentifier(id: id, type: .switch(SwitchViewItem(title: "Autorisez-vous le transfert de vos données ?", value: value, message: "")))
      }
    }
    output?.displayForm(with: [SectionIdentifier(id: 0, itemIdentifiers: viewItems)])
  }

  func update(data: [PersonalInformationCategory]) {
    viewItems = data.map {
      switch $0 {
      case let .firstName(id, value):
        return ItemIdentifier(id: id, type: .textField(TextFieldViewItem(title: "Prénom", value: value, message: "")))
      case let .lastName(id, value):
        return ItemIdentifier(id: id, type: .textField(TextFieldViewItem(title: "Nom", value: value, message: "")))
      case let .address(id, value):
        return ItemIdentifier(id: id, type: .textField(TextFieldViewItem(title: "Adresse", value: value, message: "")))
      case let .russianLaw(id, value):
        return ItemIdentifier(id: id, type: .switch(SwitchViewItem(title: "Autorisez-vous le transfert de vos données ?", value: value, message: "")))
      }
    }
    output?.updateForm(with: [SectionIdentifier(id: 0, itemIdentifiers: viewItems)])
  }

}

protocol PersonalInformationPresenterInput {
  func viewDidLoad()
  func viewRefreshing()
  func viewDidDelete()
}

protocol PersonalInformationPresenterOutput: AnyObject {
  func displayForm(with sections: [SectionIdentifier])
  func updateForm(with sections: [SectionIdentifier])
}
