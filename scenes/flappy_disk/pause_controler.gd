extends Node

var _paused : bool = false

func pause() -> bool:
	_paused = true
	return _paused

func resume() -> bool:
	_paused = false
	return _paused
