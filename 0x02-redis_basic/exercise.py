#!/usr/bin/env python3
"""redis db class."""
import redis
import uuid


class Cache():
    """Manages the communication ith the redis db."""

    def __init__(self):
        """Initialize connection start and end values."""

        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data) -> str:
        """Insert data into the redis db."""

        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
