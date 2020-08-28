import pursuer
import target

class Manager:

	def __init__(self, pursuerXChance, targetXChance, simulationTime):
		self.simulationTime = simulationTime
		self.successfulInterations = 0
		self.failedInteractions = 0
		self.pursuer = pursuer.Pursuer(pursuerXChance)
		self.target = target.Target(targetXChance)
		
	def simulate(self):
		interactionSuccess = False
		for turnNumber in range(self.simulationTime):
			pursuerAction = self.pursuer.interaction()
			targetAction = self.target.interaction()
			if pursuerAction == targetAction:
				self.successfulInterations += 1
				interactionSuccess = True
			else:
				self.failedInteractions += 1
				interactionSuccess = False
			print("Turn Number: %i, interaction successful: %s, pursuer action: %s, target action: %s" \
			% (turnNumber+1, interactionSuccess, pursuerAction, targetAction))
			
	def report(self):
		print("==================================================")
		print("Simulation Statistics:")
		print("Number of successful interations: %i" % self.successfulInterations)
		print("Number of failed interations: %i" % self.failedInteractions)
		print("==================================================")
		self.pursuer.report()
		self.target.report()

def chancePrompting():
	try:
		xChance = int(input("input the chance of a X interaction here: "))
		yChance = int(input("Input the chance of a Y interaction here: "))
	except:
		print("You didn't even type in interger numbers.")
		print("For that reason, I have defaulted to both numbers being 0.")
		xChance = 0
		yChance = 0
	if (xChance + yChance) != 100:
		print("==================================================")
		print("Your numbers don't add up to 100 %")
		print("In fact, they add up to %i" % (xChance + yChance), "%")
		print("Try again.")
		chancePrompting()
	else:
		return xChance

def main():
	print("==================================================")
	print("Enter the probabilities of interaction for the pursuer:")
	pursuerXChance = chancePrompting()
	print("==================================================")
	print("Enter the probabilities of interaction for the target:")
	targetXChance = chancePrompting()
	print("==================================================")
	simulationTime = int(input("How many times shall this simulate? "))
	interactionManager = Manager(pursuerXChance, targetXChance, simulationTime)
	interactionManager.simulate()
	interactionManager.report()
	
main()