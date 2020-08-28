import child
import parent
def main():
	mother = parent.parent("Alicia")
	childOne = child.child("Bernard", mother)
	childTwo = child.child("Cato", mother)
	childThree = child.child("Doomsden", mother)
	mother.display()
	childOne.display()
	childTwo.display()
	childThree.display()
main() 
