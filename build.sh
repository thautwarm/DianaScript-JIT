python -m lark_action dina/ch.lark --package dina --module parser
cd codegen && python -m lark_action MsgPack.lark --module MsgPackParser
cd ..
python codegen/MsgPackGen.py
python codegen/datatype_gen.py