myfile = open("1bigLag.txt", "w")
for i in range(10000):
	myfile.write("{} -> {} \n".format(i, i));
myfile.close()
