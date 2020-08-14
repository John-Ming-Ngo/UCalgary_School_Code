myfile = open("1bigLag.txt", "w")
for i in range(1000000):
	myfile.write("{} {}\n".format(1, 100));
myfile.write("{}\n".format(-1));
myfile.close()
