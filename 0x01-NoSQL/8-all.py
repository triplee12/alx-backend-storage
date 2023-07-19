#!/usr/bin/env python3
"""List all documents in Python."""

import pymongo
from typing import List


def list_all(mongo_collection: List) -> List:
    """Function to list all doc in a collection."""
    if not mongo_collection:
        return []
    documents = mongo_collection.find()
    return [post for post in documents]
