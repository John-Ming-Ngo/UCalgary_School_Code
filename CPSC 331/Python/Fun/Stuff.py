import random
def quickSort(aList):
	if aList == []: 
		return aList
	lastIndex = len(aList)-1
	index = random.randint(0, lastIndex)
	aList[index], aList[lastIndex] = aList[lastIndex], aList[index]
	pivot = aList.pop()
	return quickSort([x for x in aList if x < pivot]) + [pivot] + quickSort([x for x in aList if x >= pivot])
	
randomList = [2,34,24,2,2,34,2,1,3,234,3,4,5,12,2]
print(quickSort(randomList))

