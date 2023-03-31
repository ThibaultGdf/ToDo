//
//  AddViewModelTests.swift
//  ToDoTests
//
//  Created by Thibault GODEFROY on 03/03/2023.
//

import XCTest
@testable import ToDo

class AddViewModelTests : XCTestCase {
    
    // SUJET À TESTER
    var underTest: AddViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        underTest = AddViewModel()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        underTest = nil
    }
    
    func testViewModel_isButtonDisabledWhenAllFieldsAreEmpty() {
        // Given... (Sachant/Etant donné que)
        underTest.title = ""
        underTest.recompense = ""
        underTest.mission = ""
        
        // When... (Quand je fais)
        let result = underTest.isAddButtonDisabled
        
        // Then... (Alors)
        XCTAssertEqual(result, true, "Vérifier que le bouton est disabled")
    }
    
    func testViewModel_isButtonDisabledWhenTitleFieldIsEmpty() {
        // Given... (Sachant/Etant donné que)
        underTest.title = ""
        underTest.recompense = "a"
        underTest.mission = "a"
        
        // When... (Quand je fais)
        let result = underTest.isAddButtonDisabled
        
        // Then... (Alors)
        XCTAssertEqual(result, true, "Vérifier que le bouton est disabled")
    }
    
    func testViewModel_isButtonDisabledWhenRecompenseFieldIsEmpty() {
        // Given... (Sachant/Etant donné que)
        underTest.title = "a"
        underTest.recompense = ""
        underTest.mission = "a"
        
        // When... (Quand je fais)
        let result = underTest.isAddButtonDisabled
        
        // Then... (Alors)
        XCTAssertEqual(result, true, "Vérifier que le bouton est disabled")
    }
    
    func testViewModel_isButtonDisabledWhenMissionFieldIsEmpty() {
        // Given... (Sachant/Etant donné que)
        underTest.title = "a"
        underTest.recompense = "a"
        underTest.mission = ""
        
        // When... (Quand je fais)
        let result = underTest.isAddButtonDisabled
        
        // Then... (Alors)
        XCTAssertEqual(result, true, "Vérifier que le bouton est disabled")
    }
    
    func testViewModel_isButtonEnabledWhenAllFieldsAreFilled() {
        // Given... (Sachant/Etant donné que)
        underTest.title = "a"
        underTest.recompense = "a"
        underTest.mission = "a"
        
        // When... (Quand je fais)
        let result = underTest.isAddButtonDisabled
        
        // Then... (Alors)
        XCTAssertEqual(result, false, "Vérifier que le bouton est enabled")
    }
}
