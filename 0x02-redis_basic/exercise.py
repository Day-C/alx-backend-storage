#!/usr/bin/env python3
"""redis db class."""
import redis
import uuid
from typing import Union


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
