#!/usr/bin/python2 

obj = {"a": {"b": {"c": "d"}}}

def get_from_dict(dataDict, str):
    mapList = str.split('/')
    """Iterate nested dictionary"""
    try:
        return reduce(dict.get, mapList, dataDict)
    except TypeError:
        return None  # or some other default value

print(get_from_dict(obj, "a/b/c"))
#print( get_from_dict(obj, ['a','b','c']) )
