#!/usr/bin/env python3
"""Update doc."""
import pymongo


def update_topics(mongo_collection, name, topics):
    """Update all documents topic."""

    updt =  mongo_collection.update_one({name:  name}, {"$set": {name: topics}})
