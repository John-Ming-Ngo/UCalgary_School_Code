myfile = open("4_2500.txt", "w")
for i in range(2500):
	myfile.write("{} -> {} \n".format(i, i));
myfile.close()
