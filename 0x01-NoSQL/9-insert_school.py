#!/usr/bin/env python3
"""insert to mongodb."""
import pymongo


def insert_school(mongo_collection, **kwargs):
    """inset a new documents into a collection."""

    document = mongo_collection.insert_one(kwargs)
    return document.inserted_id
