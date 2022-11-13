//
//  HistoryCellTest.swift
//  rickbadTests
//
//  Created by Valeria Fuster on 13/11/22.
//

import XCTest
@testable import rickbad

class HistoryCellTest: XCTestCase {
    
    func test_setupCell_shouldConfigureCell() {
     
        let bundle = Bundle(for: HistoryCell.self)
        guard let sut = bundle.loadNibNamed("HistoryCell", owner: nil)?.first as? HistoryCell else {
            return XCTFail("Ops!")
        }
        
        // 2022-11-13
        let date = Date(timeIntervalSince1970: 1668373001)
        let battle = Battle(winner: "Panko", loser: "Bochi", date: date, image: Data())
        
        sut.setupCell(battle: battle)
        
        XCTAssertEqual(sut.winnerName.text, "Panko venceu Bochi")
        XCTAssertEqual(sut.winnerDate.text, "13/11/2022")
        
    }
    
}
