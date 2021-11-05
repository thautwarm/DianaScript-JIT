source ~/.bashrc

# python -m lark_action dina/ch.lark --package dina --module parser

cd codegen && python -m lark_action MsgPack.lark --module MsgPackParser
cd ..

python codegen/MsgPackGen.py

# we don't use python parser anymore!
# python codegen/datatype_gen.py 

python codegen/binding-generator.py

tbnf DianaScript.Extended.tbnf csharp --outdir Diana.Frontend.Generated --mod DianaScript  && antlr4 Diana.Frontend.Generated/DianaScript.g4 -package Diana.Frontend
