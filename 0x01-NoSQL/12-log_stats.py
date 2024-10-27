#!/usr/bin/env python3
"""status about Nginx"""
from pymongo import MongoClient


client = MongoClient('mongodb://localhost:27017/')
# create db
db = client.logs
# create collection
nginx = db.nginx
methods = {"GET": 0, "POST": 0, "PUT": 0, "PATCH": 0, "DELETE": 0}
for key in methods.keys():
    methods[key] = nginx.count_documents({"method": key})
print(f"{nginx.count_documents({})} logs")
print('Methods:')
for method in methods.keys():
    print(f"    method {method}: {methods[method]}")

lastLine = nginx.count_documents({"method": "GET", "path": "/status"})
print(f"{lastLine} status check")
