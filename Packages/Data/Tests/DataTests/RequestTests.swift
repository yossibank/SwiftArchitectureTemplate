@testable import Data
import XCTest

final class RequestTests: XCTestCase {
    override func setUpWithError() throws {
        PersistedDataHolder.onboardingFinished = nil
    }

    func testGetSample() {
        let expectation = XCTestExpectation(description: "get sample")

        Repos.Sample.Get().request(
            useTestData: true,
            parameters: .init(userId: nil),
            pathComponent: .init()
        ) { result in
            switch result {
                case let .success(response):
                    XCTAssertNotNil(response)
                    XCTAssertEqual(response.count, 2)
                    expectation.fulfill()

                case let .failure(error):
                    XCTFail(error.localizedDescription)
            }
        }

        wait(for: [expectation], timeout: 3.0)
    }

    func testPostSample() {
        let expectation = XCTestExpectation(description: "post sample")

        Repos.Sample.Post().request(
            useTestData: true,
            parameters: .init(userId: 1, title: "title", body: "body"),
            pathComponent: .init()
        ) { result in
            switch result {
                case let .success(response):
                    XCTAssertNotNil(response)
                    expectation.fulfill()

                case let .failure(error):
                    XCTFail(error.localizedDescription)
            }
        }

        wait(for: [expectation], timeout: 3.0)
    }

    func testPutSample() {
        let expectation = XCTestExpectation(description: "put sample")

        Repos.Sample.Put().request(
            useTestData: true,
            parameters: .init(userId: 1, id: 1, title: "title", body: "body"),
            pathComponent: .init()
        ) { result in
            switch result {
                case let .success(response):
                    XCTAssertNotNil(response)
                    expectation.fulfill()

                case let .failure(error):
                    XCTFail(error.localizedDescription)
            }
        }

        wait(for: [expectation], timeout: 3.0)
    }

    func testGetIsFinished() {
        XCTAssertNil(Repos.Onboarding.GetIsFinished().request())

        PersistedDataHolder.onboardingFinished = true

        XCTAssertTrue(Repos.Onboarding.GetIsFinished().request()!)

        PersistedDataHolder.onboardingFinished = false

        XCTAssertFalse(Repos.Onboarding.GetIsFinished().request()!)
    }

    func testSetIsFinished() {
        XCTAssertNil(PersistedDataHolder.onboardingFinished)

        Repos.Onboarding.SetIsFinished().request(parameters: true)

        XCTAssertTrue(PersistedDataHolder.onboardingFinished!)

        Repos.Onboarding.SetIsFinished().request(parameters: false)

        XCTAssertFalse(PersistedDataHolder.onboardingFinished!)
    }
}
