#!/usr/bin/env python3
"""redis db class."""
import redis
import uuid
from typing import Union, Any


class Cache():
    """Manages the communication ith the redis db."""

    def __init__(self) -> None:
        """Initialize connection start and end values."""

        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, int, bytes, float]) -> str:
        """Insert data into the redis db."""

        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(self, key: str, fn=None) -> Any:
        """convert key values to originat format."""

        data = self._redis.get(key)
        if data == None:
            return None
        if fn:
            return self.fn(data)
        return data

    def get_str(self, data: bytes) -> str:
        """Convert data to a sting"""

        return str(data.decode('utf-8'))

    def get_int(self, data: bytes) -> int:
        """Converts data into integer."""

        return int(data.decode('utf-8'))

