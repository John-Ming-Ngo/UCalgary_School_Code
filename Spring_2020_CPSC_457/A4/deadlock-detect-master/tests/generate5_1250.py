myfile = open("5_1250.txt", "w")
for i in range(1250):
	myfile.write("{} -> {} \n".format(i, i));
myfile.close()
