class_name NodePool extends RefCounted

var _objectToPool: PackedScene
var _startObjectCount: int
var allowPoolExpansion: bool = true

var _itemPool: Array[Variant] = []


func _init(object: PackedScene, initialCount: int):
	_objectToPool = object
	_startObjectCount = initialCount
	InitalisePool(_startObjectCount)

func InitalisePool(toNumber: int, nukePool: bool = false):
	if nukePool:
		ClearPool()
	
	#if we currently have less things in than we want
	# resize array to the required number
	#turns out this fills with null
	#if _itemPool.size() < toNumber:
	#	_itemPool.resize(toNumber)

	# keep adding till we are full
	while _itemPool.size() < toNumber:
		var newItem = _objectToPool.instantiate()
		_itemPool.append(newItem)


func ClearPool():
	_itemPool.all(
		func(nukeObject: Node):
			nukeObject.queue_free()
	)

func GetNextAvalibleItem() -> Node:
	var found: Node = null
	for obj in _itemPool:
		if !obj.is_inside_tree():
			found = obj
			break

	if found != null or !allowPoolExpansion:
		return found
	
	var currentPoolCount = _itemPool.size()
	var newPoolCount = currentPoolCount + (currentPoolCount/2);
	InitalisePool(newPoolCount)
	return GetNextAvalibleItem();

func ActivateNextAvalibleItem(parent: Node) -> Node:
	var item := GetNextAvalibleItem()
	parent.add_child(item)
	return item



