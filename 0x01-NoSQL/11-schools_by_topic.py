#!/usr/bin/env python3
"""filter documents."""


def schools_by_topic(mongo_collection, topic):
    """filter documents of documents with topic."""

    docs = mongo_collection.find({"topics": {"$in": [topic]}})
    return docs
