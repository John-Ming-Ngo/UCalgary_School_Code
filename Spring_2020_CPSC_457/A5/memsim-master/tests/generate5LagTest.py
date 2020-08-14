myfile = open("5_100", "w")
for i in range(100):
	myfile.write("{} {}\n".format(1, 100));
myfile.write("{}\n".format(-1));
myfile.close()
