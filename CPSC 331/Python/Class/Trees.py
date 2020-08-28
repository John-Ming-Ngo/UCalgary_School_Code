import random
#not done; goes to show I don't have a clue what I'm doing aaaaaaaa damn it.
class Node:
	def __init__(self, value):
		self.value = value
		self.rightChild = None
		self.leftChild = None
	def getValue(self):
		return self.value
	def setValue(self, value):
		self.value = value
	def getChildren(self):
		children = []
		if self.leftChild != None:
			children.append(self.leftChild)
		if self.rightChild != None:
			children.append(self.rightChild)
		return children
class BinarySearchTree:
	def __init__(self):
		self.root = None
	def insert(self, value):
		if self.root == None:
			self.root = Node(value)
		else:
			self.insertNode(self.root, value)
	def insertNode(self, node, value):
		isLarger = node.value <= value
		if isLarger and node.rightChild == None:
			node.rightChild = Node(value)
		elif not isLarger and node.leftChild == None:
			node.leftChild = Node(value)
		elif isLarger:
			self.insertNode(node.rightChild, value)
		elif not isLarger:
			self.insertNode(node.leftChild, value)
	def remove(self, value):
		#NOT DONE
	def removeNode(self, node, value):
		
		
	def printTree(self, node = "rootNode"):
		if node == "rootNode":
			node = self.root
		if node == None: return
		print(str(node.value) + " ", end = "")
		self.printTree(node.rightChild)
		self.printTree(node.leftChild)

newBinaryTree = BinarySearchTree()
for i in range(100):
	newBinaryTree.insert(random.randint(1, 100))
newBinaryTree.printTree()