@testable import Data
@testable import Domain
import XCTest

final class UsecaseTests: XCTestCase {

    func testSampleUsecase() throws {
        let result = try awaitPublisher(
            Domain.Usecase.FetchSample(useTestData: true).execute(userId: nil)
        )
        let expect = try TestDataFetchRequest(
            testDataJsonPath: SampleGetRequest(parameters: .init(userId: nil)).testDataPath
        )
        .fetchLocalTestData(responseType: [SampleResponse].self)
        .map(SampleMapper().convert)
        .get()

        XCTAssertEqual(result, expect)
    }
}
