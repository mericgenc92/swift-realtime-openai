public enum Model: RawRepresentable, Equatable, Hashable, Codable, Sendable {
	case gptRealtime
	case gptRealtimeMini
	case custom(String)

	public var rawValue: String {
		switch self {
			case .gptRealtime: return "gpt-realtime"
			case .gptRealtimeMini: return "gpt-realtime-mini"
			case let .custom(value): return value
		}
	}

	public init?(rawValue: String) {
		switch rawValue {
			case "gpt-realtime": self = .gptRealtime
			case "gpt-realtime-mini": self = .gptRealtimeMini
			default: self = .custom(rawValue)
		}
	}
}

public extension Model {
	// Raw values verified against the GA realtime endpoint (2026-08-29): its
	// supported list is whisper-1, gpt-realtime-whisper, gpt-live-transcribe,
	// gpt-transcribe, gpt-4o-transcribe, gpt-4o-mini-transcribe (+ dated minis).
	// The previous `gpt4o = "gpt-4o-transcribe-latest"` was rejected with an
	// invalid-value error, so that case could never have worked there.
	enum Transcription: String, CaseIterable, Equatable, Hashable, Codable, Sendable {
		case whisper = "whisper-1"
		case gptRealtimeWhisper = "gpt-realtime-whisper"
		case gpt4o = "gpt-4o-transcribe"
		case gpt4oMini = "gpt-4o-mini-transcribe"
		case gptTranscribe = "gpt-transcribe"
		case gptLiveTranscribe = "gpt-live-transcribe"
		case gpt4oDiarize = "gpt-4o-transcribe-diarize"
	}
}
