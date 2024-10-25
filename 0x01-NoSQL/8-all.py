#!/usr/bin/env python3
"""list all documents."""
from pymongo import MongoClient


def list_all(mongo_collection):
    """List all documents in a collection."""

    # create a connection to db
    client = MongoClient()
    # access database
    try:
        docs = list(mongo_collection.find())
        return docs
    except Exception as e:
        return []
