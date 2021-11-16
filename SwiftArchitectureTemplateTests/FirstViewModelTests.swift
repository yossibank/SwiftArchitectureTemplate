@testable import Data
@testable import Domain
@testable import SwiftArchitectureTemplate
import XCTest

final class FirstViewModelTests: XCTestCase {

    private var viewModel: FirstViewModel!

    override func setUpWithError() throws {
        self.viewModel = FirstViewModel(
            usecase: Domain.Usecase.FetchSample(useTestData: true)
        )
    }

    func testViewWillAppear() throws {
        let publisher = self.viewModel.$state.collect(1).first()

        self.viewModel.viewWillAppear()

        let result = try awaitPublisher(publisher)

        let expectation = try TestDataFetchRequest(
            testDataJsonPath: SampleGetRequest(
                parameters: .init(userId: nil)
            )
            .testDataPath
        )
        .fetchLocalTestData(responseType: [SampleResponse].self)
        .map(SampleMapper().convert)
        .get()

        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first, .done(expectation))
    }
}
