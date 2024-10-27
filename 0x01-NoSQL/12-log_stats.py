#!/usr/bin/env python3
"""status about Nginx"""
from pymongo import MongoClient


def filter_mongo():
    """filter and display information from mongodb."""

    client = MongoClient('mongodb://localhost:27017/')
    # create db
    db = client.logs
    # create collection
    nginx = db.nginx
    methods = {"GET": 0, "POST": 0, "PUT": 0, "PATCH": 0, "DELETE": 0}
    # print the number of documents in collection
    print(f"{nginx.count_documents({})} logs")
    # print the count of each method
    print('Methods:')
    for key in methods.keys():
        method_count = nginx.count_documents({"method": key})
        print(f"    method {key}: {method_count}")

    lastLine = nginx.count_documents({"method": "GET", "path": "/status"})
    print(f"{lastLine} status check")


filter_mongo()
