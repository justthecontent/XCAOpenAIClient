import XCTest
@testable import XCAOpenAIClient

final class XCAOpenAIClientTests: XCTestCase {
    var client: XCAOpenAIClient!
    
    override func setUp() {
        super.setUp()
        // Initialize the client with a mock API key
        client = XCAOpenAIClient(apiKey: "mock-api-key")
    }
    
    override func tearDown() {
        client = nil
        super.tearDown()
    }
    
    func testClientInitialization() {
        XCTAssertNotNil(client, "Client should be initialized")
    }
    
    func testClientBaseURL() {
        XCTAssertEqual(client.baseURL, URL(string: "https://api.openai.com/v1"), "Base URL should be set correctly")
    }
    
    // Add more tests here as needed
}
