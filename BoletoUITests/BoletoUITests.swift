//
//  BoletoUITests.swift
//  BoletoUITests
//
//  Created by Rose Maina on 11/11/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import XCTest

class BoletoUITests: XCTestCase {
    
    fileprivate let app = XCUIApplication()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launchArguments.append("--uitesting")
    }
    
    override func tearDown() {}
    
    func testSignInButtonDidTap() {
        app.launch()

        app.buttons["Sign Up"].tap()
        app.alerts["“Boleto” Wants to Use “google.com” to Sign In"].scrollViews.otherElements.buttons["Continue"].tap()

        app.terminate()
    }
    
    func testSelectDate() {
        app.launch()
        
        app.buttons["Select a date"].tap()
        app.datePickers/*@START_MENU_TOKEN@*/.pickerWheels["19"]/*[[".pickers.pickerWheels[\"19\"]",".pickerWheels[\"19\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        app.toolbars["Toolbar"].buttons["Done"].tap()
        
        app.terminate()
        
    }
    
    func testSelectTime() {
        app.launch()
        
        app.buttons["Select time"].tap()
        
        let pmPickerWheel = app.datePickers/*@START_MENU_TOKEN@*/.pickerWheels["PM"]/*[[".pickers.pickerWheels[\"PM\"]",".pickerWheels[\"PM\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        pmPickerWheel.tap()
        app.toolbars["Toolbar"].buttons["Done"].tap()
        
        app.terminate()
    }
    
    func testSelectClass() {
        app.launch()
        
        app.buttons["Select preferred class"].tap()
        app.sheets.scrollViews.otherElements.buttons["BUSINESS"].tap()
        
        app.terminate()
    }
    
    func testScheculeTrip() {
        app.launch()

        let datePickersQuery = app.datePickers
        datePickersQuery/*@START_MENU_TOKEN@*/.pickerWheels["19"]/*[[".pickers.pickerWheels[\"19\"]",".pickerWheels[\"19\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        
        let doneButton = app.toolbars["Toolbar"].buttons["Done"]
        doneButton.tap()
        app.buttons["Select time"].tap()
        
        datePickersQuery/*@START_MENU_TOKEN@*/.pickerWheels["12 o’clock"]/*[[".pickers.pickerWheels[\"12 o’clock\"]",".pickerWheels[\"12 o’clock\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        doneButton.tap()
        
        app.buttons["Select preferred class"].tap()
        app.sheets.scrollViews.otherElements.buttons["NORMAL"].tap()
        app.buttons["Schedule"].tap()
          
         app.terminate()
    }
    
}
