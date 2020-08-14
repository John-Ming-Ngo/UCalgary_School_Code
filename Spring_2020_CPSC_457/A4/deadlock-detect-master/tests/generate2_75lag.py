myfile = open("2_7500.txt", "w")
for i in range(7500):
	myfile.write("{} -> {} \n".format(i, i));
myfile.close()
