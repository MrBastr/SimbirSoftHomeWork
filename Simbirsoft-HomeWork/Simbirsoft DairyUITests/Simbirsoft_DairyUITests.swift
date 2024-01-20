//
//  Simbirsoft_DairyUITests.swift
//  Simbirsoft DairyUITests
//
//  Created by Nick Sagan on 13.02.2022.
//

import XCTest

class Simbirsoft_DairyUITests: XCTestCase {
    
    func testAddTaskUserInput() throws {
        let app = XCUIApplication()
        app.launch()
        let nameField = app.textFields["inputName"]
        let descField = app.textViews["inputDescription"]
        let skipButton = app.buttons["skip"]
        let addButtonAtCalendar = app.buttons["addButtonCalendarVC"]

        app.swipeLeft()
        app.swipeLeft()
        skipButton.tap()
        addButtonAtCalendar.tap()
        nameField.tap()
        nameField.typeText("Test task")
        descField.tap()
        descField.typeText("Test desc")
        app.tapCoordinate(at: CGPoint(x: app.frame.maxX - 20, y: app.frame.minY + 30))
        app.tapCoordinate(at: CGPoint(x: 10, y: 10))
        app.navigationBars.buttons.element(boundBy: 0).tap()

    }



    
}

extension XCUIApplication {
    func tapCoordinate(at point: CGPoint) {
        let normalized = coordinate(withNormalizedOffset: .zero)
        let offset = CGVector(dx: point.x, dy: point.y)
        let coordinate = normalized.withOffset(offset)
        coordinate.tap()
    }
}
