//
//  PersonalInformationInteractor.swift
//  PersonalInformation
//
//  Created by Ronaël Bajazet on 06/05/2021.
//

import Foundation

public struct NameModel {
  var id: Int
  var name: String
}

public struct InteractorModel {
  var names: [NameModel]
}

fileprivate enum InteractorModelID: Int {
  case morgan = 4
  case ronael = 2
  case tarik = 3
  case salwa = 1
}

public final class PersonalInformationInteractor: PersonalInformationInteractorInput {

  weak var ouput: PersonalInformationInteractorOuput?

  private var dataSource: [String] = ["Morgan", "Ronaël", "Tarik", "Salwa"]

  private var notifiedModel: InteractorModel?

  func retrieve() {
    let model = InteractorModel(names: [
      NameModel(id: InteractorModelID.morgan.rawValue, name: dataSource[0]),
      NameModel(id: InteractorModelID.ronael.rawValue, name: dataSource[1]),
      NameModel(id: InteractorModelID.tarik.rawValue, name: dataSource[2]),
      NameModel(id: InteractorModelID.salwa.rawValue, name: dataSource[3])
    ])
    notifiedModel = model
    ouput?.load(data: model)
  }

  func update() {
    guard var model = notifiedModel else {
      return
    }

    model.names[1].name = "Pierre"
    model.names[3].name = "Jean-Philip"

    ouput?.update(data: model)
  }
}

protocol PersonalInformationInteractorInput {
  func retrieve()
  func update()
}

protocol PersonalInformationInteractorOuput: AnyObject {
  func load(data: InteractorModel)
  func update(data: InteractorModel)
}
