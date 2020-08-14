myfile = open("4_1000", "w")
for i in range(1000):
	myfile.write("{} {}\n".format(1, 100));
myfile.write("{}\n".format(-1));
myfile.close()
