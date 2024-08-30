//
//  File.swift
//  
//
//  Created by Krishna Kumar on 8/30/24.
//

import Foundation
import SwiftOpenAI

public class OpenAIAssistantClient {
	let apiKey: String
	let service: OpenAIService
	let model = "gpt-4o-2024-05-13"
	init(apiKey: String, service: OpenAIService) {
		self.apiKey = apiKey
		self.service = service
	}

	public func createAssistant(name: String) async throws -> AssistantObject {
		let parameters = AssistantParameters(action: .create(model: model), name: name)
		let assistant = try await service.createAssistant(parameters: parameters)
		return assistant
	}

	public func retrieveAssistant(assistantID: String) async throws -> AssistantObject {
		let assistant = try await service.retrieveAssistant(id: assistantID)
		return assistant
	}

	public func modifyAssistant(assistantID: String, newName: String) async throws -> AssistantObject {
		let parameters = AssistantParameters(action: .modify(model: model), name: newName)
		let assistant = try await service.modifyAssistant(id: assistantID, parameters: parameters)
		return assistant
	}

	public func deleteAssistant(assistantID: String) async throws -> Bool {
		let deletionStatus = try await service.deleteAssistant(id: assistantID)
		return deletionStatus.deleted
	}

	public func listAssistants() async throws -> OpenAIResponse<AssistantObject> {
		let assistants = try await service.listAssistants(limit: nil, order: nil, after: nil, before: nil)
		return assistants
	}

	// New functions for Thread operations
	public func createThread(parameters: CreateThreadParameters) async throws -> ThreadObject {
		let thread = try await service.createThread(parameters: parameters)
		return thread
	}

	public func retrieveThread(id: String) async throws -> ThreadObject {
		let thread = try await service.retrieveThread(id: id)
		return thread
	}

	public func modifyThread(id: String, parameters: ModifyThreadParameters) async throws -> ThreadObject {
		let thread = try await service.modifyThread(id: id, parameters: parameters)
		return thread
	}

	public func deleteThread(id: String) async throws -> Bool {
		let thread = try await service.deleteThread(id: id)
		return thread.deleted
	}

	// New functions for Message operations
	public func createMessage(threadID: String, parameters: MessageParameter) async throws -> MessageObject {
		let message = try await service.createMessage(threadID: threadID, parameters: parameters)
		return message
	}

	public func retrieveMessage(threadID: String, messageID: String) async throws -> MessageObject {
		let message = try await service.retrieveMessage(threadID: threadID, messageID: messageID)
		return message
	}

	public func modifyMessage(threadID: String, messageID: String, parameters: ModifyMessageParameters) async throws -> MessageObject {
		let message = try await service.modifyMessage(threadID: threadID, messageID: messageID, parameters: parameters)
		return message
	}

	public func listMessages(threadID: String, limit: Int? = nil, order: String? = nil, after: String? = nil, before: String? = nil, runID: String? = nil) async throws -> OpenAIResponse<MessageObject> {
		let messages = try await service.listMessages(threadID: threadID, limit: limit, order: order, after: after, before: before, runID: runID)
		return messages
	}

	// New functions for Run operations
	public func createRun(threadID: String, parameters: RunParameter) async throws -> RunObject {
		let run = try await service.createRun(threadID: threadID, parameters: parameters)
		return run
	}

	public func retrieveRun(threadID: String, runID: String) async throws -> RunObject {
		let run = try await service.retrieveRun(threadID: threadID, runID: runID)
		return run
	}

	public func modifyRun(threadID: String, runID: String, parameters: ModifyRunParameters) async throws -> RunObject {
		let run = try await service.modifyRun(threadID: threadID, runID: runID, parameters: parameters)
		return run
	}

	public func listRuns(threadID: String, limit: Int? = nil, order: String? = nil, after: String? = nil, before: String? = nil) async throws -> OpenAIResponse<RunObject> {
		let runs = try await service.listRuns(threadID: threadID, limit: limit, order: order, after: after, before: before)
		return runs
	}

	public func submitToolOutputsToRun(threadID: String, runID: String, parameters: RunToolsOutputParameter) async throws -> RunObject {
		let run = try await service.submitToolOutputsToRun(threadID: threadID, runID: runID, parameters: parameters)
		return run
	}

	public func cancelRun(threadID: String, runID: String) async throws -> RunObject {
		let run = try await service.cancelRun(threadID: threadID, runID: runID)
		return run
	}

	public func createThreadAndRun(parameters: CreateThreadAndRunParameter) async throws -> RunObject {
		let run = try await service.createThreadAndRun(parameters: parameters)
		return run
	}
}
