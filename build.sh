source ~/.bashrc

# python -m lark_action dina/ch.lark --package dina --module parser

cd codegen && python -m lark_action MsgPack.lark --module MsgPackParser
cd ..

python codegen/MsgPackGen.py

# we don't use python parser anymore!
# python codegen/datatype_gen.py 

python codegen/binding-generator.py

tbnf belala.tbnf csharp --outdir Ava.Frontend.Generated --mod DianaScript  && antlr4 Ava.Frontend.Generated/DianaScript.g4 -package Ava.Frontend
