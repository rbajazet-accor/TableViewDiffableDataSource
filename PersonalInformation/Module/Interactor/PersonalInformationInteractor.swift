//
//  PersonalInformationInteractor.swift
//  PersonalInformation
//
//  Created by Ronaël Bajazet on 06/05/2021.
//

import Foundation


public enum PersonalInformationCategory {
  case firstName(id: Int, value: String)
  case lastName(id: Int, value: String)
  case address(id: Int, value: String)
  case russianLaw(id: Int, value: Bool)
}

public final class PersonalInformationInteractor: PersonalInformationInteractorInput {

  weak var ouput: PersonalInformationInteractorOuput?

  private var dataSource: [PersonalInformationCategory] = [.firstName(id: 0, value: "Morgan"),
                                                           .lastName(id: 1, value: "Le Bihan"),
                                                           .address(id: 2, value: "1 rue de Rivoli 75004 Paris")]

  func retrieve() {
    ouput?.load(data: dataSource)
  }

  func update() {
    dataSource[2] = .address(id: 2, value: "2 Avenue Montaigne 75008 Paris")
    dataSource.append(.russianLaw(id: 3, value: true)
    ouput?.update(data: dataSource)
  }

  func remove() {
    dataSource.remove(at: 1)
    ouput?.update(data: dataSource)
  }
}

protocol PersonalInformationInteractorInput {
  func retrieve()
  func update()
  func remove()
}

protocol PersonalInformationInteractorOuput: AnyObject {
  func load(data: [PersonalInformationCategory])
  func update(data: [PersonalInformationCategory])
}
