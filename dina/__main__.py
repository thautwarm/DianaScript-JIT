from dina.cg import codegen
from dina.parser import parser
from dina.logger import logger
from wisepy2 import wise

def call_main(filename: str, out: str="a.ran", loglevel: str="", showast:bool=False, showbytes:bool=False):
    if loglevel:
        logger.setLevel(loglevel)
    with open(filename, encoding='utf-8') as f:
        seq = parser.parse(f.read())
    if showast:
        import prettyprinter
        prettyprinter.install_extras(["dataclasses"])
        prettyprinter.pprint(seq)
    
    barr = codegen(filename, seq)
    if showbytes:
        print(list(barr))
    with open(out, 'wb') as f:
        f.write(barr)

if __name__ == '__main__':
    wise(call_main)()
