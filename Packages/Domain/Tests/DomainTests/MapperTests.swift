@testable import Data
@testable import Domain
import XCTest

final class MapperTests: XCTestCase {

    func testSampleMapper() {
        let result = SampleMapper().convert(
            response: [
                .init(userId: 1, id: 1, title: "title", body: "body")
            ]
        )

        let expect: [SampleEntity] = [
            .init(userId: 1, id: 1, title: "title", body: "body")
        ]

        XCTAssertEqual(result, expect)
    }
}
