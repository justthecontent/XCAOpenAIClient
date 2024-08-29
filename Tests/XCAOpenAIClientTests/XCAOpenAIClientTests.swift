import XCTest
import OpenAPIRuntime
import OpenAPIURLSession
@testable import XCAOpenAIClient

final class XCAOpenAIClientTests: XCTestCase {
    var client: Client!
    
    override func setUp() {
        super.setUp()
        // Initialize the client with a mock API key
        let transport = URLSessionTransport()
        client = Client(
            serverURL: URL(string: "https://api.openai.com/v1")!,
            transport: transport,
            middlewares: [AuthMiddleware(apiKey: "mock-api-key")]
        )
    }
    
    override func tearDown() {
        client = nil
        super.tearDown()
    }
    
    func testClientInitialization() {
        XCTAssertNotNil(client, "Client should be initialized")
    }
    
    func testClientBaseURL() {
        XCTAssertEqual(client.configuration.serverURL, URL(string: "https://api.openai.com/v1"), "Base URL should be set correctly")
    }
    
    // Add more tests here as needed
}
