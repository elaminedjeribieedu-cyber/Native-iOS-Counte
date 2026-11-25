import XCTest

final class CounterAppUITests: XCTestCase {
    func testCounterCanIncreaseDecreaseAndReset() throws {
        let app = XCUIApplication()
        app.launch()

        let value = app.staticTexts["counterValue"]
        XCTAssertEqual(value.label, "0")

        let initialShot = XCTAttachment(screenshot: app.screenshot())
        initialShot.name = "01-Initial-Screen"
        initialShot.lifetime = .keepAlways
        add(initialShot)

        app.buttons["incrementButton"].tap()
        XCTAssertEqual(value.label, "1")

        app.buttons["decrementButton"].tap()
        XCTAssertEqual(value.label, "0")

        app.buttons["incrementButton"].tap()
        app.buttons["incrementButton"].tap()
        XCTAssertEqual(value.label, "2")

        let incrementedShot = XCTAttachment(screenshot: app.screenshot())
        incrementedShot.name = "02-After-Increment"
        incrementedShot.lifetime = .keepAlways
        add(incrementedShot)

        app.buttons["resetButton"].tap()
        XCTAssertEqual(value.label, "0")
    }
}
