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
    
    func testClientInitialization() {
        XCTAssertNotNil(client, "Client should be initialized")
        // Note: We can't directly test the base URL as the Client type doesn't expose it.
        // Further testing might require making API calls or inspecting the client's behavior.
    }
    
    // Add more tests here as needed
}
