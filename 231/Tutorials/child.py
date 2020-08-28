class child:
  def __init__(self, name, parent):
    self.name = name
    self.parent = parent
  def display(self):
    print("My name is: %s" % self.name)
    print("My parent is %s" % self.parent.name)
