myfile = open("3_10000", "w")
for i in range(10000):
	myfile.write("{} {}\n".format(1, 100));
myfile.write("{}\n".format(-1));
myfile.close()
