import random

class Pursuer:

	def __init__(self, xInterationChance):
		self.xInterations = 0
		self.yInterations = 0
		self.xInteractionChance = xInterationChance
		self.yInteractionChance = 100 - self.xInterations
		
	def report(self):
		print("==================================================")
		print("Pursuer statistics:")
		print("Number of X interations: %i" % self.xInterations)
		print("Number of Y interations: %i" % self.yInterations)
		print("==================================================")
		
	def interaction(self):
		chance = random.randrange(1, 101)
		if chance <= self.xInteractionChance:
			action = "X"
			self.xInterations += 1
		else:
			action = "Y"
			self.yInterations += 1
		return action