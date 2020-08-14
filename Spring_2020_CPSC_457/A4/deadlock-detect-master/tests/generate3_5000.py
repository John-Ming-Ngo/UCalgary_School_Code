myfile = open("3_5000.txt", "w")
for i in range(5000):
	myfile.write("{} -> {} \n".format(i, i));
myfile.close()
