
class Document:
  def __init__(self):
    self.accessed = 0
  
  def describe_object(self):
    self.accessed += 1
    return(f"Document object (you've asked {self.accessed} times)")

doc = Document()
doc.describe_object()
doc.describe_object()

doc.accessed
