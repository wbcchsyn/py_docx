from xml.dom import minidom
from zipfile import ZipFile


def docx2xml(path: str) -> str:
    """
    Extracts the main xml file from the .docx file

    Files with .docx extension are actually zip files,
    and the main contents is stored in the file 'word/document.xml'

    This function extracts and returns the file 'word/document.xml'.
    """

    zip = ZipFile(path)
    return zip.read("word/document.xml").decode("utf-8")


def xml2text(xml: str) -> str:
    """
    Extracts the text from the XML document
    """

    stack = [minidom.parseString(xml)]
    texts = []

    while stack:
        node = stack.pop()

        if isinstance(node, minidom.Text):
            texts.append(node.data)
        else:
            stack.extend(reversed(node.childNodes))

    return "".join(texts)
