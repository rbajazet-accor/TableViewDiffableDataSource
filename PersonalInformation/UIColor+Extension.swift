//
//  UIColor+Extension.swift
//  PersonalInformation
//
//  Created by Ronaël Bajazet on 06/05/2021.
//

import UIKit

public extension UIColor {
  // MARK: - Brand

  static let brand = UIColor(hex: "#1E1852", alpha: 1.0)
  static let brandDark = UIColor(hex: "#050033", alpha: 1.0)

  // MARK: - Accent

  static let accent = UIColor(hex: "#068484", alpha: 1.0)

  // MARK: - Contrast

  static let contrast = UIColor(hex: "#FFFFFF", alpha: 1.0)

  // MARK: - Text

  static let textTitle = UIColor(hex: "#252339", alpha: 1.0)
  static let textBody = UIColor(hex: "#3E3D48", alpha: 1.0)
  static let textMuted = UIColor(hex: "#6F6E77", alpha: 1.0)
  static let textAccent = UIColor(hex: "#068484", alpha: 1.0)
  static let textContrast = UIColor(hex: "#FFFFFF", alpha: 1.0)
  static let textContrastMuted = UIColor(hex: "#FFFFFF", alpha: 0.75)

  // MARK: - Button Link

  static let buttonLink = UIColor(hex: "#1264A3", alpha: 1.0)
  static let buttonLinkPressedLight = UIColor(hex: "#ADD1E6", alpha: 1.0)
  static let buttonLinkPressedDark = UIColor(hex: "#003E79", alpha: 1.0)

  // MARK: - Button Primary

  static let buttonPrimary = UIColor(hex: "#068484", alpha: 1.0)
  static let buttonPrimaryPressed = UIColor(hex: "#006163", alpha: 1.0)

  // MARK: - Button Secondary

  static let buttonSecondary = UIColor(hex: "#1E1852", alpha: 1.0)
  static let buttonSecondaryPressedLight = UIColor(hex: "#E9E8F2", alpha: 1.0)
  static let buttonSecondaryPressedDark = UIColor(hex: "#050033", alpha: 1.0)
  static let buttonSecondaryContrast = UIColor(hex: "#FFFFFF", alpha: 1.0)
  static let buttonSecondaryInverse = UIColor(hex: "#FFFFFF", alpha: 1.0)

  // MARK: - Button Destructive

  static let buttonDestructive = UIColor(hex: "#B2000C", alpha: 1.0)
  static let buttonDestructivePressed = UIColor(hex: "#870000", alpha: 1.0)

  // MARK: - Button Disabled

  static let buttonDisabled = UIColor(hex: "#DADADD", alpha: 1.0)

  // MARK: - Background

  static let backgroundDefault = UIColor(hex: "#F4F4F5", alpha: 1.0)
  static let backgroundLight = UIColor(hex: "#FFFFFF", alpha: 1.0)
  static let backgroundDark = UIColor(hex: "#050033", alpha: 1.0)
  static let backgroundAccent = UIColor(hex: "#EEF7F7", alpha: 1.0)

  // MARK: - Stroke

  static let stroke = UIColor(hex: "#DADADD", alpha: 1.0)
  static let strokeLight15 = UIColor(hex: "#DADADD", alpha: 0.15)
  static let strokeDark15 = UIColor(hex: "#252339", alpha: 0.15)

  // MARK: - Outline

  static let outline = UIColor(hex: "#3470DF", alpha: 1.0)

  // MARK: - Icon

  static let icon = UIColor(hex: "#252339", alpha: 1.0)
  static let iconContrast = UIColor(hex: "#FFFFFF", alpha: 1.0)

  // MARK: - Functional

  static let functional = UIColor(hex: "#8B8A93", alpha: 1.0)

  // MARK: - Alert

  static let alertDanger = UIColor(hex: "#B2000C", alpha: 1.0)
  static let alertWarning = UIColor(hex: "#D88100", alpha: 1.0)
  static let alertInformative = UIColor(hex: "#FACC00", alpha: 1.0)
  static let alertSuccess = UIColor(hex: "#3C8703", alpha: 1.0)
  static let alertDangerOpacity = UIColor(hex: "#B2000C", alpha: 0.1)
  static let alertWarningOpacity = UIColor(hex: "#D88100", alpha: 0.1)
  static let alertInformativeOpacity = UIColor(hex: "#FACC00", alpha: 0.1)
  static let alertSuccessOpacity = UIColor(hex: "#3C8703", alpha: 0.1)

  // MARK: - Status

  static let statusClassic = UIColor(hex: "#1B2354", alpha: 1.0)
  static let statusSilver = UIColor(hex: "#7D7E81", alpha: 1.0)
  static let statusGold = UIColor(hex: "#CC9C49", alpha: 1.0)
  static let statusPlatinum = UIColor(hex: "#3A4650", alpha: 1.0)
  static let statusDiamond = UIColor(hex: "#C8C8C8", alpha: 1.0)
  static let statusLimitless = UIColor(hex: "#000000", alpha: 1.0)
  static let statusBlack20 = UIColor(hex: "#000000", alpha: 0.2)

  // MARK: - StatusGradient

  static let statusClassicGradientStart = UIColor(hex: "#050033", alpha: 1.0)
  static let statusClassicGradientEnd = UIColor(hex: "#37335C", alpha: 1.0)
  static let statusSilverGradientStart = UIColor(hex: "#76777A", alpha: 1.0)
  static let statusSilverGradientEnd = UIColor(hex: "#919295", alpha: 1.0)
  static let statusGoldGradientStart = UIColor(hex: "#AF913A", alpha: 1.0)
  static let statusGoldGradientEnd = UIColor(hex: "#DDBA69", alpha: 1.0)
  static let statusPlatinumGradientStart = UIColor(hex: "#394049", alpha: 1.0)
  static let statusPlatinumGradientEnd = UIColor(hex: "#6A6F76", alpha: 1.0)
  static let statusDiamondGradientStart = UIColor(hex: "#BABABA", alpha: 1.0)
  static let statusDiamondGradientEnd = UIColor(hex: "#C8C8C8", alpha: 1.0)
  static let statusLimitlessGradientStart = UIColor(hex: "#000000", alpha: 1.0)
  static let statusLimitlessGradientEnd = UIColor(hex: "#333333", alpha: 1.0)

  // MARK: - CARD

  static let cardTag = UIColor(hex: "#706B9D", alpha: 1.0)
  static let cardStroke = UIColor(hex: "#706B9D", alpha: 1.0)
  static let cardBackground = UIColor(hex: "#050033", alpha: 1.0)

  convenience init(hex: String, alpha: CGFloat) {
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    let alpha: CGFloat = alpha

    if hex.hasPrefix("#") {
      let index = hex.index(hex.startIndex, offsetBy: 1)
      let hex = hex.suffix(from: index)
      let scanner = Scanner(string: String(hex))
      var hexValue: CUnsignedLongLong = 0
      if scanner.scanHexInt64(&hexValue) {
        if hex.count == 6 {
          red = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
          green = CGFloat((hexValue & 0x00FF00) >> 8) / 255.0
          blue = CGFloat(hexValue & 0x0000FF) / 255.0
        }
      }
    }
    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}

extension UIColor {
  var colorComponents: ColorComponent? {
    guard let components = self.cgColor.components else { return nil }

    return ColorComponent(red: components[0],
                          green: components[1],
                          blue: components[2],
                          alpha: components[3])
  }
}

public struct ColorComponent {
  var red: CGFloat
  var green: CGFloat
  var blue: CGFloat
  var alpha: CGFloat
}
