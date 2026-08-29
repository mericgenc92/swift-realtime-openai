public struct ServerError: Codable, Equatable, Sendable {
	/// The type of error (e.g., "invalid_request_error", "server_error").
	public let type: String

	/// Error code, if any.
	public let code: String?

	/// A human-readable error message.
	public let message: String

	/// Parameter related to the error, if any.
	public let param: String?

	/// The eventId of the client event that caused the error, if applicable.
	public let eventId: String?

	// Public so other modules (e.g. the UI layer surfacing failed responses
	// through the error stream) can construct one — the synthesized memberwise
	// init is internal to this module.
	public init(type: String, code: String?, message: String, param: String?, eventId: String?) {
		self.type = type
		self.code = code
		self.message = message
		self.param = param
		self.eventId = eventId
	}
}
