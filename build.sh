source ~/.bashrc
python -m lark_action dina/ch.lark --package dina --module parser
cd codegen && python -m lark_action MsgPack.lark --module MsgPackParser
cd ..
python codegen/MsgPackGen.py
python codegen/datatype_gen.py

tbnf DianaScript.tbnf csharp --outdir Ava.Frontend.Generated --mod DianaScript  && antlr4 Ava.Frontend.Generated/DianaScript.g4 -package Ava.Frontend
