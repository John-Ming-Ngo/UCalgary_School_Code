myfile = open("2_100000", "w")
for i in range(100000):
	myfile.write("{} {}\n".format(1, 100));
myfile.write("{}\n".format(-1));
myfile.close()
