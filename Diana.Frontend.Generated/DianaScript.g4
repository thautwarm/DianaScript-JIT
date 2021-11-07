grammar DianaScript;
options { language = CSharp; }
expr returns [ImmediateAST result] :
      '__META' local__2_expr_case0=INT_10 ':' local__4_expr_case0=INT_10 ':' local__6_expr_case0=INT_10 'in' local__8_expr_case0=expr { 
        ImmediateAST tmp__5 ; 
        ImmediateAST tmp__4 ; 
        CommonToken tmp__3 ; 
        CommonToken tmp__2 ; 
        CommonToken tmp__1 ; 
        tmp__1 = ( CommonToken ) _localctx.local__2_expr_case0 ; 
        tmp__2 = ( CommonToken ) _localctx.local__4_expr_case0 ; 
        tmp__3 = ( CommonToken ) _localctx.local__6_expr_case0 ; 
        tmp__4 = ( ImmediateAST ) _localctx.local__8_expr_case0.result ; 
        tmp__5 = (ImmediateAST) mkMeta( tmp__1.Text, tmp__2.Text, tmp__3.Text, tmp__4 ); 
        $result = tmp__5; 
      } 
    | local__1_expr_case1=or_expr { 
        ImmediateAST tmp__6 ; 
        tmp__6 = ( ImmediateAST ) _localctx.local__1_expr_case1.result ; 
        $result = tmp__6; 
      } 
; 
stmt returns [ImmediateAST result] :
      local__1_stmt_case0='raise' local__2_stmt_case0=expr { 
        ImmediateAST tmp__9 ; 
        ImmediateAST tmp__8 ; 
        CommonToken tmp__7 ; 
        tmp__7 = ( CommonToken ) _localctx.local__1_stmt_case0 ; 
        tmp__8 = ( ImmediateAST ) _localctx.local__2_stmt_case0.result ; 
        tmp__9 = (ImmediateAST) mkRaise( tmp__7, tmp__8 ); 
        $result = tmp__9; 
      } 
    | local__1_stmt_case1='__SETMETA' local__2_stmt_case1=INT_10 local__3_stmt_case1=STR_4 { 
        ImmediateAST tmp__13 ; 
        CommonToken tmp__12 ; 
        CommonToken tmp__11 ; 
        CommonToken tmp__10 ; 
        tmp__10 = ( CommonToken ) _localctx.local__1_stmt_case1 ; 
        tmp__11 = ( CommonToken ) _localctx.local__2_stmt_case1 ; 
        tmp__12 = ( CommonToken ) _localctx.local__3_stmt_case1 ; 
        tmp__13 = (ImmediateAST) mkSetMeta( tmp__10, tmp__11.Text, tmp__12.Text ); 
        $result = tmp__13; 
      } 
    | '__META' local__2_stmt_case2=INT_10 ':' local__4_stmt_case2=INT_10 ':' local__6_stmt_case2=INT_10 'do' local__8_stmt_case2=stmt { 
        ImmediateAST tmp__18 ; 
        ImmediateAST tmp__17 ; 
        CommonToken tmp__16 ; 
        CommonToken tmp__15 ; 
        CommonToken tmp__14 ; 
        tmp__14 = ( CommonToken ) _localctx.local__2_stmt_case2 ; 
        tmp__15 = ( CommonToken ) _localctx.local__4_stmt_case2 ; 
        tmp__16 = ( CommonToken ) _localctx.local__6_stmt_case2 ; 
        tmp__17 = ( ImmediateAST ) _localctx.local__8_stmt_case2.result ; 
        tmp__18 = (ImmediateAST) mkMeta( tmp__14.Text, tmp__15.Text, tmp__16.Text, tmp__17 ); 
        $result = tmp__18; 
      } 
    | local__1_stmt_case3=gen__line_wrap_begin local__2_stmt_case3=block gen__line_wrap_end { 
        ImmediateAST tmp__21 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__20 ; 
        CommonToken tmp__19 ; 
        tmp__19 = ( CommonToken ) _localctx.local__1_stmt_case3.result ; 
        tmp__20 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_stmt_case3.result ; 
        tmp__21 = (ImmediateAST) mkBlock( tmp__19, tmp__20 ); 
        $result = tmp__21; 
      } 
    | local__1_stmt_case4=lhs_seq local__2_stmt_case4=expr { 
        ImmediateAST tmp__24 ; 
        ImmediateAST tmp__23 ; 
        System.Collections.Generic.List<(ImmediateAST, string)> tmp__22 ; 
        tmp__22 = ( System.Collections.Generic.List<(ImmediateAST, string)> ) _localctx.local__1_stmt_case4.result ; 
        tmp__23 = ( ImmediateAST ) _localctx.local__2_stmt_case4.result ; 
        tmp__24 = (ImmediateAST) mkStoreMany( tmp__22, tmp__23 ); 
        $result = tmp__24; 
      } 
    | local__1_stmt_case5='loop' local__2_stmt_case5=block 'end' { 
        ImmediateAST tmp__29 ; 
        ImmediateAST tmp__28 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__27 ; 
        CommonToken tmp__26 ; 
        CommonToken tmp__25 ; 
        tmp__25 = ( CommonToken ) _localctx.local__1_stmt_case5 ; 
        tmp__26 = ( CommonToken ) _localctx.local__1_stmt_case5 ; 
        tmp__27 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_stmt_case5.result ; 
        tmp__28 = (ImmediateAST) mkBlock( tmp__26, tmp__27 ); 
        tmp__29 = (ImmediateAST) mkLoop( tmp__25, tmp__28 ); 
        $result = tmp__29; 
      } 
    | local__1_stmt_case6='while' local__2_stmt_case6=expr local__3_stmt_case6=gen__blockOf_do 'end' { 
        ImmediateAST tmp__33 ; 
        ImmediateAST tmp__32 ; 
        ImmediateAST tmp__31 ; 
        CommonToken tmp__30 ; 
        tmp__30 = ( CommonToken ) _localctx.local__1_stmt_case6 ; 
        tmp__31 = ( ImmediateAST ) _localctx.local__2_stmt_case6.result ; 
        tmp__32 = ( ImmediateAST ) _localctx.local__3_stmt_case6.result ; 
        tmp__33 = (ImmediateAST) mkWhile( tmp__30, tmp__31, tmp__32 ); 
        $result = tmp__33; 
      } 
    | local__1_stmt_case7='for' local__2_stmt_case7=NAME_13 'in' local__4_stmt_case7=expr local__5_stmt_case7=gen__blockOf_do 'end' { 
        ImmediateAST tmp__38 ; 
        ImmediateAST tmp__37 ; 
        ImmediateAST tmp__36 ; 
        CommonToken tmp__35 ; 
        CommonToken tmp__34 ; 
        tmp__34 = ( CommonToken ) _localctx.local__1_stmt_case7 ; 
        tmp__35 = ( CommonToken ) _localctx.local__2_stmt_case7 ; 
        tmp__36 = ( ImmediateAST ) _localctx.local__4_stmt_case7.result ; 
        tmp__37 = ( ImmediateAST ) _localctx.local__5_stmt_case7.result ; 
        tmp__38 = (ImmediateAST) mkFor( tmp__34, tmp__35.Text, tmp__36, tmp__37 ); 
        $result = tmp__38; 
      } 
    | local__1_stmt_case8='break' { 
        ImmediateAST tmp__40 ; 
        CommonToken tmp__39 ; 
        tmp__39 = ( CommonToken ) _localctx.local__1_stmt_case8 ; 
        tmp__40 = (ImmediateAST) mkBreak( tmp__39 ); 
        $result = tmp__40; 
      } 
    | local__1_stmt_case9='continue' { 
        ImmediateAST tmp__42 ; 
        CommonToken tmp__41 ; 
        tmp__41 = ( CommonToken ) _localctx.local__1_stmt_case9 ; 
        tmp__42 = (ImmediateAST) mkContinue( tmp__41 ); 
        $result = tmp__42; 
      } 
    | local__1_stmt_case10='return' local__2_stmt_case10=expr { 
        ImmediateAST tmp__45 ; 
        ImmediateAST tmp__44 ; 
        CommonToken tmp__43 ; 
        tmp__43 = ( CommonToken ) _localctx.local__1_stmt_case10 ; 
        tmp__44 = ( ImmediateAST ) _localctx.local__2_stmt_case10.result ; 
        tmp__45 = (ImmediateAST) mkReturn( tmp__43, tmp__44 ); 
        $result = tmp__45; 
      } 
    | local__1_stmt_case11='return' { 
        ImmediateAST tmp__47 ; 
        CommonToken tmp__46 ; 
        tmp__46 = ( CommonToken ) _localctx.local__1_stmt_case11 ; 
        tmp__47 = (ImmediateAST) mkReturn( tmp__46, null ); 
        $result = tmp__47; 
      } 
    | local__1_stmt_case12='var' local__2_stmt_case12=gen__seplist__L44__name { 
        ImmediateAST tmp__50 ; 
        System.Collections.Generic.List<string> tmp__49 ; 
        CommonToken tmp__48 ; 
        tmp__48 = ( CommonToken ) _localctx.local__1_stmt_case12 ; 
        tmp__49 = ( System.Collections.Generic.List<string> ) _localctx.local__2_stmt_case12.result ; 
        tmp__50 = (ImmediateAST) mkDecl( tmp__48, tmp__49 ); 
        $result = tmp__50; 
      } 
    | local__1_stmt_case13=expr { 
        ImmediateAST tmp__51 ; 
        tmp__51 = ( ImmediateAST ) _localctx.local__1_stmt_case13.result ; 
        $result = tmp__51; 
      } 
; 
gen__line_wrap_end returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap_end_case0='end' gen__optional_newline { 
        CommonToken tmp__52 ; 
        tmp__52 = ( CommonToken ) _localctx.local__2_gen__line_wrap_end_case0 ; 
        $result = tmp__52; 
      } 
; 
gen__optional_newline returns [CommonToken result] :
      local__1_gen__optional_newline_case0=newline { 
        CommonToken tmp__53 ; 
        tmp__53 = ( CommonToken ) _localctx.local__1_gen__optional_newline_case0.result ; 
        $result = tmp__53; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__line_wrap_begin returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap_begin_case0='begin' gen__optional_newline { 
        CommonToken tmp__54 ; 
        tmp__54 = ( CommonToken ) _localctx.local__2_gen__line_wrap_begin_case0 ; 
        $result = tmp__54; 
      } 
; 
newline returns [CommonToken result] :
      local__1_newline_case0=NEWLINE_17 { 
        CommonToken tmp__55 ; 
        tmp__55 = ( CommonToken ) _localctx.local__1_newline_case0 ; 
        $result = tmp__55; 
      } 
    | newline local__2_newline_case1=NEWLINE_17 { 
        CommonToken tmp__56 ; 
        tmp__56 = ( CommonToken ) _localctx.local__2_newline_case1 ; 
        $result = tmp__56; 
      } 
; 
atom returns [ImmediateAST result] :
      local__1_atom_case0=atom local__2_atom_case0='.' '[' local__4_atom_case0=expr ']' { 
        ImmediateAST tmp__60 ; 
        ImmediateAST tmp__59 ; 
        ImmediateAST tmp__58 ; 
        CommonToken tmp__57 ; 
        tmp__57 = ( CommonToken ) _localctx.local__2_atom_case0 ; 
        tmp__58 = ( ImmediateAST ) _localctx.local__1_atom_case0.result ; 
        tmp__59 = ( ImmediateAST ) _localctx.local__4_atom_case0.result ; 
        tmp__60 = (ImmediateAST) mkOGet( tmp__57, tmp__58, tmp__59 ); 
        $result = tmp__60; 
      } 
    | local__1_atom_case1=atom local__2_atom_case1='.' local__3_atom_case1=NAME_13 { 
        ImmediateAST tmp__67 ; 
        ImmediateAST tmp__66 ; 
        DObj tmp__65 ; 
        CommonToken tmp__64 ; 
        CommonToken tmp__63 ; 
        ImmediateAST tmp__62 ; 
        CommonToken tmp__61 ; 
        tmp__61 = ( CommonToken ) _localctx.local__2_atom_case1 ; 
        tmp__62 = ( ImmediateAST ) _localctx.local__1_atom_case1.result ; 
        tmp__63 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__64 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__65 = (DObj) mkstr( tmp__64.Text ); 
        tmp__66 = (ImmediateAST) mkVal( tmp__63, tmp__65 ); 
        tmp__67 = (ImmediateAST) mkOGet( tmp__61, tmp__62, tmp__66 ); 
        $result = tmp__67; 
      } 
    | ':' local__2_atom_case2=NAME_13 { 
        ImmediateAST tmp__70 ; 
        CommonToken tmp__69 ; 
        CommonToken tmp__68 ; 
        tmp__68 = ( CommonToken ) _localctx.local__2_atom_case2 ; 
        tmp__69 = ( CommonToken ) _localctx.local__2_atom_case2 ; 
        tmp__70 = (ImmediateAST) mkSymbol( tmp__68, tmp__69.Text ); 
        $result = tmp__70; 
      } 
    | ':' local__2_atom_case3=STR_4 { 
        ImmediateAST tmp__74 ; 
        string tmp__73 ; 
        CommonToken tmp__72 ; 
        CommonToken tmp__71 ; 
        tmp__71 = ( CommonToken ) _localctx.local__2_atom_case3 ; 
        tmp__72 = ( CommonToken ) _localctx.local__2_atom_case3 ; 
        tmp__73 = (string) unesc( tmp__72.Text ); 
        tmp__74 = (ImmediateAST) mkSymbol( tmp__71, tmp__73 ); 
        $result = tmp__74; 
      } 
    | local__1_atom_case4=atom local__2_atom_case4='(' local__3_atom_case4=gen__closelist__L44__expr ')' { 
        ImmediateAST tmp__78 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__77 ; 
        ImmediateAST tmp__76 ; 
        CommonToken tmp__75 ; 
        tmp__75 = ( CommonToken ) _localctx.local__2_atom_case4 ; 
        tmp__76 = ( ImmediateAST ) _localctx.local__1_atom_case4.result ; 
        tmp__77 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__3_atom_case4.result ; 
        tmp__78 = (ImmediateAST) mkApp( tmp__75, tmp__76, tmp__77 ); 
        $result = tmp__78; 
      } 
    | local__1_atom_case5='[' local__2_atom_case5=gen__closelist__L44__expr ']' { 
        ImmediateAST tmp__81 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__80 ; 
        CommonToken tmp__79 ; 
        tmp__79 = ( CommonToken ) _localctx.local__1_atom_case5 ; 
        tmp__80 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case5.result ; 
        tmp__81 = (ImmediateAST) mkList( tmp__79, tmp__80 ); 
        $result = tmp__81; 
      } 
    | local__1_atom_case6='(' local__2_atom_case6=gen__closelist__L44__expr local__3_atom_case6=trailer ')' { 
        ImmediateAST tmp__85 ; 
        bool tmp__84 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__83 ; 
        CommonToken tmp__82 ; 
        tmp__82 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__83 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case6.result ; 
        tmp__84 = ( bool ) _localctx.local__3_atom_case6.result ; 
        tmp__85 = (ImmediateAST) mkTuple( tmp__82, tmp__83, tmp__84 ); 
        $result = tmp__85; 
      } 
    | local__1_atom_case7='{' local__2_atom_case7=gen__closelist__L44__pair trailer '}' { 
        ImmediateAST tmp__88 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__87 ; 
        CommonToken tmp__86 ; 
        tmp__86 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__87 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case7.result ; 
        tmp__88 = (ImmediateAST) mkDict( tmp__86, tmp__87 ); 
        $result = tmp__88; 
      } 
    | local__1_atom_case8='{' local__2_atom_case8=gen__closelist__L44__expr '}' { 
        ImmediateAST tmp__91 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__90 ; 
        CommonToken tmp__89 ; 
        tmp__89 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__90 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case8.result ; 
        tmp__91 = (ImmediateAST) mkSet( tmp__89, tmp__90 ); 
        $result = tmp__91; 
      } 
    | local__1_atom_case9=STR_4 { 
        ImmediateAST tmp__96 ; 
        DObj tmp__95 ; 
        string tmp__94 ; 
        CommonToken tmp__93 ; 
        CommonToken tmp__92 ; 
        tmp__92 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__93 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__94 = (string) unesc( tmp__93.Text ); 
        tmp__95 = (DObj) mkstr( tmp__94 ); 
        tmp__96 = (ImmediateAST) mkVal( tmp__92, tmp__95 ); 
        $result = tmp__96; 
      } 
    | local__1_atom_case10=INT_10 { 
        ImmediateAST tmp__101 ; 
        DObj tmp__100 ; 
        int tmp__99 ; 
        CommonToken tmp__98 ; 
        CommonToken tmp__97 ; 
        tmp__97 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__98 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__99 = 0 ; 
        tmp__100 = (DObj) mkint( tmp__98.Text, tmp__99 ); 
        tmp__101 = (ImmediateAST) mkVal( tmp__97, tmp__100 ); 
        $result = tmp__101; 
      } 
    | local__1_atom_case11=HEX_7 { 
        ImmediateAST tmp__106 ; 
        DObj tmp__105 ; 
        int tmp__104 ; 
        CommonToken tmp__103 ; 
        CommonToken tmp__102 ; 
        tmp__102 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__103 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__104 = 16 ; 
        tmp__105 = (DObj) mkint( tmp__103.Text, tmp__104 ); 
        tmp__106 = (ImmediateAST) mkVal( tmp__102, tmp__105 ); 
        $result = tmp__106; 
      } 
    | local__1_atom_case12=OCT_8 { 
        ImmediateAST tmp__111 ; 
        DObj tmp__110 ; 
        int tmp__109 ; 
        CommonToken tmp__108 ; 
        CommonToken tmp__107 ; 
        tmp__107 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__108 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__109 = 8 ; 
        tmp__110 = (DObj) mkint( tmp__108.Text, tmp__109 ); 
        tmp__111 = (ImmediateAST) mkVal( tmp__107, tmp__110 ); 
        $result = tmp__111; 
      } 
    | local__1_atom_case13=BIN_9 { 
        ImmediateAST tmp__116 ; 
        DObj tmp__115 ; 
        int tmp__114 ; 
        CommonToken tmp__113 ; 
        CommonToken tmp__112 ; 
        tmp__112 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__113 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__114 = 2 ; 
        tmp__115 = (DObj) mkint( tmp__113.Text, tmp__114 ); 
        tmp__116 = (ImmediateAST) mkVal( tmp__112, tmp__115 ); 
        $result = tmp__116; 
      } 
    | local__1_atom_case14=FLOAT_11 { 
        ImmediateAST tmp__120 ; 
        DObj tmp__119 ; 
        CommonToken tmp__118 ; 
        CommonToken tmp__117 ; 
        tmp__117 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__118 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__119 = (DObj) mkfloat( tmp__118.Text ); 
        tmp__120 = (ImmediateAST) mkVal( tmp__117, tmp__119 ); 
        $result = tmp__120; 
      } 
    | local__1_atom_case15='None' { 
        ImmediateAST tmp__123 ; 
        DObj tmp__122 ; 
        CommonToken tmp__121 ; 
        tmp__121 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__122 = (DObj) mknone(  ); 
        tmp__123 = (ImmediateAST) mkVal( tmp__121, tmp__122 ); 
        $result = tmp__123; 
      } 
    | local__1_atom_case16=NAME_13 { 
        ImmediateAST tmp__126 ; 
        CommonToken tmp__125 ; 
        CommonToken tmp__124 ; 
        tmp__124 = ( CommonToken ) _localctx.local__1_atom_case16 ; 
        tmp__125 = ( CommonToken ) _localctx.local__1_atom_case16 ; 
        tmp__126 = (ImmediateAST) mkVar( tmp__124, tmp__125.Text ); 
        $result = tmp__126; 
      } 
    | local__1_atom_case17='-' local__2_atom_case17=atom { 
        ImmediateAST tmp__129 ; 
        ImmediateAST tmp__128 ; 
        CommonToken tmp__127 ; 
        tmp__127 = ( CommonToken ) _localctx.local__1_atom_case17 ; 
        tmp__128 = ( ImmediateAST ) _localctx.local__2_atom_case17.result ; 
        tmp__129 = (ImmediateAST) mkNeg( tmp__127, tmp__128 ); 
        $result = tmp__129; 
      } 
    | local__1_atom_case18='~' local__2_atom_case18=atom { 
        ImmediateAST tmp__132 ; 
        ImmediateAST tmp__131 ; 
        CommonToken tmp__130 ; 
        tmp__130 = ( CommonToken ) _localctx.local__1_atom_case18 ; 
        tmp__131 = ( ImmediateAST ) _localctx.local__2_atom_case18.result ; 
        tmp__132 = (ImmediateAST) mkInv( tmp__130, tmp__131 ); 
        $result = tmp__132; 
      } 
    | local__1_atom_case19='if' local__2_atom_case19=expr local__3_atom_case19=then local__4_atom_case19=block 'end' { 
        ImmediateAST tmp__138 ; 
        ImmediateAST tmp__137 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__136 ; 
        CommonToken tmp__135 ; 
        ImmediateAST tmp__134 ; 
        CommonToken tmp__133 ; 
        tmp__133 = ( CommonToken ) _localctx.local__1_atom_case19 ; 
        tmp__134 = ( ImmediateAST ) _localctx.local__2_atom_case19.result ; 
        tmp__135 = ( CommonToken ) _localctx.local__3_atom_case19.result ; 
        tmp__136 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case19.result ; 
        tmp__137 = (ImmediateAST) mkBlock( tmp__135, tmp__136 ); 
        tmp__138 = (ImmediateAST) mkIfThen( tmp__133, tmp__134, tmp__137 ); 
        $result = tmp__138; 
      } 
    | local__1_atom_case20='if' local__2_atom_case20=expr local__3_atom_case20=then local__4_atom_case20=block local__5_atom_case20=gen__nullable_gen__list_gen__snd_elif__elifBlock local__6_atom_case20=gen__optional_gen__blockOf_else 'end' { 
        ImmediateAST tmp__150 ; 
        ImmediateAST tmp__149 ; 
        CommonToken tmp__148 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__146 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__147 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__144 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__145 ; 
        ImmediateAST tmp__143 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__142 ; 
        CommonToken tmp__141 ; 
        ImmediateAST tmp__140 ; 
        (ImmediateAST, ImmediateAST) elif__139 ; 
        tmp__140 = ( ImmediateAST ) _localctx.local__2_atom_case20.result ; 
        tmp__141 = ( CommonToken ) _localctx.local__3_atom_case20.result ; 
        tmp__142 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case20.result ; 
        tmp__143 = (ImmediateAST) mkBlock( tmp__141, tmp__142 ); 
        elif__139 = ( tmp__140 , tmp__143 ); 
        tmp__145 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        elifs__144 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__145, elif__139 ); 
        tmp__147 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__5_atom_case20.result ; 
        elifs__146 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) extend<(ImmediateAST, ImmediateAST)>( elifs__144, tmp__147 ); 
        tmp__148 = ( CommonToken ) _localctx.local__1_atom_case20 ; 
        tmp__149 = ( ImmediateAST ) _localctx.local__6_atom_case20.result ; 
        tmp__150 = (ImmediateAST) mkNestedIf( tmp__148, elifs__144, tmp__149 ); 
        $result = tmp__150; 
      } 
    | local__1_atom_case21='fun' local__2_atom_case21=name '(' local__4_atom_case21=gen__nullable_gen__seplist__L44__name ')' local__6_atom_case21=block 'end' { 
        ImmediateAST tmp__155 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__154 ; 
        System.Collections.Generic.List<string> tmp__153 ; 
        string tmp__152 ; 
        CommonToken tmp__151 ; 
        tmp__151 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__152 = ( string ) _localctx.local__2_atom_case21.result ; 
        tmp__153 = ( System.Collections.Generic.List<string> ) _localctx.local__4_atom_case21.result ; 
        tmp__154 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__6_atom_case21.result ; 
        tmp__155 = (ImmediateAST) mkFunc( tmp__151, tmp__152, tmp__153, tmp__154 ); 
        $result = tmp__155; 
      } 
    | local__1_atom_case22='fun' '(' local__3_atom_case22=gen__nullable_gen__seplist__L44__name ')' local__5_atom_case22=block 'end' { 
        ImmediateAST tmp__160 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__159 ; 
        System.Collections.Generic.List<string> tmp__158 ; 
        string tmp__157 ; 
        CommonToken tmp__156 ; 
        tmp__156 = ( CommonToken ) _localctx.local__1_atom_case22 ; 
        tmp__157 = "" ; 
        tmp__158 = ( System.Collections.Generic.List<string> ) _localctx.local__3_atom_case22.result ; 
        tmp__159 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__5_atom_case22.result ; 
        tmp__160 = (ImmediateAST) mkFunc( tmp__156, tmp__157, tmp__158, tmp__159 ); 
        $result = tmp__160; 
      } 
    | local__1_atom_case23='(' local__2_atom_case23=gen__nullable_gen__seplist__L44__name ')' '->' local__5_atom_case23=gen__line_wrap_expr { 
        ImmediateAST tmp__166 ; 
        ImmediateAST tmp__165 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__164 ; 
        System.Collections.Generic.List<string> tmp__163 ; 
        string tmp__162 ; 
        CommonToken tmp__161 ; 
        tmp__161 = ( CommonToken ) _localctx.local__1_atom_case23 ; 
        tmp__162 = "" ; 
        tmp__163 = ( System.Collections.Generic.List<string> ) _localctx.local__2_atom_case23.result ; 
        tmp__165 = ( ImmediateAST ) _localctx.local__5_atom_case23.result ; 
        tmp__164 = new System.Collections.Generic.List<ImmediateAST> { tmp__165 }; 
        tmp__166 = (ImmediateAST) mkFunc( tmp__161, tmp__162, tmp__163, tmp__164 ); 
        $result = tmp__166; 
      } 
    | local__1_atom_case24=NAME_13 '->' local__3_atom_case24=gen__line_wrap_expr { 
        ImmediateAST tmp__173 ; 
        ImmediateAST tmp__172 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__171 ; 
        CommonToken tmp__170 ; 
        System.Collections.Generic.List<string> tmp__169 ; 
        string tmp__168 ; 
        CommonToken tmp__167 ; 
        tmp__167 = ( CommonToken ) _localctx.local__1_atom_case24 ; 
        tmp__168 = "" ; 
        tmp__170 = ( CommonToken ) _localctx.local__1_atom_case24 ; 
        tmp__169 = new System.Collections.Generic.List<string> { tmp__170.Text }; 
        tmp__172 = ( ImmediateAST ) _localctx.local__3_atom_case24.result ; 
        tmp__171 = new System.Collections.Generic.List<ImmediateAST> { tmp__172 }; 
        tmp__173 = (ImmediateAST) mkFunc( tmp__167, tmp__168, tmp__169, tmp__171 ); 
        $result = tmp__173; 
      } 
; 
gen__line_wrap_expr returns [ImmediateAST result] :
      gen__optional_newline local__2_gen__line_wrap_expr_case0=expr gen__optional_newline { 
        ImmediateAST tmp__174 ; 
        tmp__174 = ( ImmediateAST ) _localctx.local__2_gen__line_wrap_expr_case0.result ; 
        $result = tmp__174; 
      } 
; 
gen__nullable_gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__nullable_gen__seplist__L44__name_case0=gen__seplist__L44__name { 
        System.Collections.Generic.List<string> tmp__175 ; 
        tmp__175 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__nullable_gen__seplist__L44__name_case0.result ; 
        $result = tmp__175; 
      } 
    | { 
        System.Collections.Generic.List<string> tmp__176 ; 
        tmp__176 = (System.Collections.Generic.List<string>) empty<string>(  ); 
        $result = tmp__176; 
      } 
; 
gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__seplist__L44__name_case0=name { 
        string tmp__178 ; 
        System.Collections.Generic.List<string> tmp__177 ; 
        tmp__178 = ( string ) _localctx.local__1_gen__seplist__L44__name_case0.result ; 
        tmp__177 = new System.Collections.Generic.List<string> { tmp__178 }; 
        $result = tmp__177; 
      } 
    | local__1_gen__seplist__L44__name_case1=gen__seplist__L44__name ',' local__3_gen__seplist__L44__name_case1=name { 
        System.Collections.Generic.List<string> tmp__181 ; 
        string tmp__180 ; 
        System.Collections.Generic.List<string> tmp__179 ; 
        tmp__179 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__seplist__L44__name_case1.result ; 
        tmp__180 = ( string ) _localctx.local__3_gen__seplist__L44__name_case1.result ; 
        tmp__181 = (System.Collections.Generic.List<string>) append<string>( tmp__179, tmp__180 ); 
        $result = tmp__181; 
      } 
; 
gen__optional_gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__optional_gen__blockOf_else_case0=gen__blockOf_else { 
        ImmediateAST tmp__182 ; 
        tmp__182 = ( ImmediateAST ) _localctx.local__1_gen__optional_gen__blockOf_else_case0.result ; 
        $result = tmp__182; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__blockOf_else_case0='else' local__2_gen__blockOf_else_case0=block { 
        ImmediateAST tmp__185 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__184 ; 
        CommonToken tmp__183 ; 
        tmp__183 = ( CommonToken ) _localctx.local__1_gen__blockOf_else_case0 ; 
        tmp__184 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_else_case0.result ; 
        tmp__185 = (ImmediateAST) mkBlock( tmp__183, tmp__184 ); 
        $result = tmp__185; 
      } 
; 
gen__nullable_gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0=gen__list_gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__186 ; 
        tmp__186 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__186; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__187 ; 
        tmp__187 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__187; 
      } 
; 
gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__list_gen__snd_elif__elifBlock_case0=gen__snd_elif__elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__189 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__188 ; 
        tmp__189 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        tmp__188 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__189 }; 
        $result = tmp__188; 
      } 
    | local__1_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock local__2_gen__list_gen__snd_elif__elifBlock_case1=gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__192 ; 
        (ImmediateAST, ImmediateAST) tmp__191 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__190 ; 
        tmp__190 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__191 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__192 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__190, tmp__191 ); 
        $result = tmp__192; 
      } 
; 
gen__snd_elif__elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      'elif' local__2_gen__snd_elif__elifBlock_case0=elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__193 ; 
        tmp__193 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__193; 
      } 
; 
gen__closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      gen__optional_newline local__2_gen__closelist__L44__pair_case0=gen___closelist__L44__pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__194 ; 
        tmp__194 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_gen__closelist__L44__pair_case0.result ; 
        $result = tmp__194; 
      } 
; 
gen___closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen___closelist__L44__pair_case0=gen___closelist__L44__pair newline { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__195 ; 
        tmp__195 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case0.result ; 
        $result = tmp__195; 
      } 
    | local__1_gen___closelist__L44__pair_case1=gen___closelist__L44__pair ',' newline local__4_gen___closelist__L44__pair_case1=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__198 ; 
        (ImmediateAST, ImmediateAST) tmp__197 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__196 ; 
        tmp__196 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case1.result ; 
        tmp__197 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__4_gen___closelist__L44__pair_case1.result ; 
        tmp__198 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__196, tmp__197 ); 
        $result = tmp__198; 
      } 
    | local__1_gen___closelist__L44__pair_case2=gen___closelist__L44__pair ',' local__3_gen___closelist__L44__pair_case2=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__201 ; 
        (ImmediateAST, ImmediateAST) tmp__200 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__199 ; 
        tmp__199 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case2.result ; 
        tmp__200 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__3_gen___closelist__L44__pair_case2.result ; 
        tmp__201 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__199, tmp__200 ); 
        $result = tmp__201; 
      } 
    | local__1_gen___closelist__L44__pair_case3=pair { 
        (ImmediateAST, ImmediateAST) tmp__203 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__202 ; 
        tmp__203 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen___closelist__L44__pair_case3.result ; 
        tmp__202 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__203 }; 
        $result = tmp__202; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__204 ; 
        tmp__204 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { }; 
        $result = tmp__204; 
      } 
; 
gen__closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_gen__closelist__L44__expr_case0=gen___closelist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__205 ; 
        tmp__205 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__closelist__L44__expr_case0.result ; 
        $result = tmp__205; 
      } 
; 
gen___closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen___closelist__L44__expr_case0=gen___closelist__L44__expr newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__206 ; 
        tmp__206 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case0.result ; 
        $result = tmp__206; 
      } 
    | local__1_gen___closelist__L44__expr_case1=gen___closelist__L44__expr ',' newline local__4_gen___closelist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__209 ; 
        ImmediateAST tmp__208 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__207 ; 
        tmp__207 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case1.result ; 
        tmp__208 = ( ImmediateAST ) _localctx.local__4_gen___closelist__L44__expr_case1.result ; 
        tmp__209 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__207, tmp__208 ); 
        $result = tmp__209; 
      } 
    | local__1_gen___closelist__L44__expr_case2=gen___closelist__L44__expr ',' local__3_gen___closelist__L44__expr_case2=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__212 ; 
        ImmediateAST tmp__211 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__210 ; 
        tmp__210 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case2.result ; 
        tmp__211 = ( ImmediateAST ) _localctx.local__3_gen___closelist__L44__expr_case2.result ; 
        tmp__212 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__210, tmp__211 ); 
        $result = tmp__212; 
      } 
    | local__1_gen___closelist__L44__expr_case3=expr { 
        ImmediateAST tmp__214 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__213 ; 
        tmp__214 = ( ImmediateAST ) _localctx.local__1_gen___closelist__L44__expr_case3.result ; 
        tmp__213 = new System.Collections.Generic.List<ImmediateAST> { tmp__214 }; 
        $result = tmp__213; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__215 ; 
        tmp__215 = new System.Collections.Generic.List<ImmediateAST> { }; 
        $result = tmp__215; 
      } 
; 
pair returns [(ImmediateAST, ImmediateAST) result] :
      local__1_pair_case0=expr gen__line_wrap__L58 local__3_pair_case0=expr { 
        ImmediateAST tmp__218 ; 
        ImmediateAST tmp__217 ; 
        (ImmediateAST, ImmediateAST) tmp__216 ; 
        tmp__217 = ( ImmediateAST ) _localctx.local__1_pair_case0.result ; 
        tmp__218 = ( ImmediateAST ) _localctx.local__3_pair_case0.result ; 
        tmp__216 = ( tmp__217 , tmp__218 ); 
        $result = tmp__216; 
      } 
; 
gen__line_wrap__L58 returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap__L58_case0=':' gen__optional_newline { 
        CommonToken tmp__219 ; 
        tmp__219 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L58_case0 ; 
        $result = tmp__219; 
      } 
; 
trailer returns [bool result] :
      ',' { 
        $result = true; 
      } 
    | { 
        $result = false; 
      } 
; 
bin returns [ImmediateAST result] :
      local__1_bin_case0=binseq { 
        ImmediateAST tmp__221 ; 
        System.Collections.Generic.List<object> tmp__220 ; 
        tmp__220 = ( System.Collections.Generic.List<object> ) _localctx.local__1_bin_case0.result ; 
        tmp__221 = (ImmediateAST) resolve_binop( tmp__220 ); 
        $result = tmp__221; 
      } 
; 
binseq returns [System.Collections.Generic.List<object> result] :
      local__1_binseq_case0=atom { 
        System.Collections.Generic.List<object> tmp__225 ; 
        object tmp__224 ; 
        ImmediateAST tmp__223 ; 
        System.Collections.Generic.List<object> tmp__222 ; 
        tmp__222 = (System.Collections.Generic.List<object>) empty<object>(  ); 
        tmp__223 = ( ImmediateAST ) _localctx.local__1_binseq_case0.result ; 
        tmp__224 = (object) to_obj<ImmediateAST>( tmp__223 ); 
        tmp__225 = (System.Collections.Generic.List<object>) append<object>( tmp__222, tmp__224 ); 
        $result = tmp__225; 
      } 
    | local__1_binseq_case1=binseq local__2_binseq_case1=binop local__3_binseq_case1=atom { 
        object tmp__231 ; 
        ImmediateAST tmp__230 ; 
        System.Collections.Generic.List<object> tmp__229 ; 
        System.Collections.Generic.List<object> block__226 ; 
        object tmp__228 ; 
        System.Collections.Generic.List<object> tmp__227 ; 
        tmp__227 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__228 = ( object ) _localctx.local__2_binseq_case1.result ; 
        block__226 = (System.Collections.Generic.List<object>) append<object>( tmp__227, tmp__228 ); 
        tmp__229 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__230 = ( ImmediateAST ) _localctx.local__3_binseq_case1.result ; 
        tmp__231 = (object) to_obj<ImmediateAST>( tmp__230 ); 
        block__226 = (System.Collections.Generic.List<object>) append<object>( tmp__229, tmp__231 ); 
        $result = block__226; 
      } 
; 
ibinop returns [string result] :
      local__1_ibinop_case0=SINGLE_BINOP_2 { 
        CommonToken tmp__232 ; 
        tmp__232 = ( CommonToken ) _localctx.local__1_ibinop_case0 ; 
        $result = tmp__232.Text; 
      } 
    | '-' { 
        string tmp__233 ; 
        tmp__233 = "-" ; 
        $result = tmp__233; 
      } 
; 
binop returns [object result] :
      local__1_binop_case0=SINGLE_BINOP_2 { 
        object tmp__236 ; 
        CommonToken tmp__235 ; 
        CommonToken tmp__234 ; 
        tmp__234 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__235 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__236 = (object) mkop( tmp__234, tmp__235.Text ); 
        $result = tmp__236; 
      } 
    | local__1_binop_case1='not' 'in' { 
        object tmp__239 ; 
        string tmp__238 ; 
        CommonToken tmp__237 ; 
        tmp__237 = ( CommonToken ) _localctx.local__1_binop_case1 ; 
        tmp__238 = "notin" ; 
        tmp__239 = (object) mkop( tmp__237, tmp__238 ); 
        $result = tmp__239; 
      } 
    | local__1_binop_case2='in' { 
        object tmp__242 ; 
        string tmp__241 ; 
        CommonToken tmp__240 ; 
        tmp__240 = ( CommonToken ) _localctx.local__1_binop_case2 ; 
        tmp__241 = "in" ; 
        tmp__242 = (object) mkop( tmp__240, tmp__241 ); 
        $result = tmp__242; 
      } 
    | local__1_binop_case3='-' { 
        object tmp__245 ; 
        string tmp__244 ; 
        CommonToken tmp__243 ; 
        tmp__243 = ( CommonToken ) _localctx.local__1_binop_case3 ; 
        tmp__244 = "-" ; 
        tmp__245 = (object) mkop( tmp__243, tmp__244 ); 
        $result = tmp__245; 
      } 
; 
not returns [ImmediateAST result] :
      local__1_not_case0=gen__line_wrap_not local__2_not_case0=not { 
        ImmediateAST tmp__248 ; 
        ImmediateAST tmp__247 ; 
        CommonToken tmp__246 ; 
        tmp__246 = ( CommonToken ) _localctx.local__1_not_case0.result ; 
        tmp__247 = ( ImmediateAST ) _localctx.local__2_not_case0.result ; 
        tmp__248 = (ImmediateAST) mkNot( tmp__246, tmp__247 ); 
        $result = tmp__248; 
      } 
    | local__1_not_case1=bin { 
        ImmediateAST tmp__249 ; 
        tmp__249 = ( ImmediateAST ) _localctx.local__1_not_case1.result ; 
        $result = tmp__249; 
      } 
; 
gen__line_wrap_not returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap_not_case0='not' gen__optional_newline { 
        CommonToken tmp__250 ; 
        tmp__250 = ( CommonToken ) _localctx.local__2_gen__line_wrap_not_case0 ; 
        $result = tmp__250; 
      } 
; 
and_expr returns [ImmediateAST result] :
      local__1_and_expr_case0=and_expr local__2_and_expr_case0=gen__line_wrap_and local__3_and_expr_case0=not { 
        ImmediateAST tmp__254 ; 
        ImmediateAST tmp__253 ; 
        ImmediateAST tmp__252 ; 
        CommonToken tmp__251 ; 
        tmp__251 = ( CommonToken ) _localctx.local__2_and_expr_case0.result ; 
        tmp__252 = ( ImmediateAST ) _localctx.local__1_and_expr_case0.result ; 
        tmp__253 = ( ImmediateAST ) _localctx.local__3_and_expr_case0.result ; 
        tmp__254 = (ImmediateAST) mkAnd( tmp__251, tmp__252, tmp__253 ); 
        $result = tmp__254; 
      } 
    | local__1_and_expr_case1=not { 
        ImmediateAST tmp__255 ; 
        tmp__255 = ( ImmediateAST ) _localctx.local__1_and_expr_case1.result ; 
        $result = tmp__255; 
      } 
; 
gen__line_wrap_and returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap_and_case0='and' gen__optional_newline { 
        CommonToken tmp__256 ; 
        tmp__256 = ( CommonToken ) _localctx.local__2_gen__line_wrap_and_case0 ; 
        $result = tmp__256; 
      } 
; 
or_expr returns [ImmediateAST result] :
      local__1_or_expr_case0=or_expr local__2_or_expr_case0=gen__line_wrap_or local__3_or_expr_case0=and_expr { 
        ImmediateAST tmp__260 ; 
        ImmediateAST tmp__259 ; 
        ImmediateAST tmp__258 ; 
        CommonToken tmp__257 ; 
        tmp__257 = ( CommonToken ) _localctx.local__2_or_expr_case0.result ; 
        tmp__258 = ( ImmediateAST ) _localctx.local__1_or_expr_case0.result ; 
        tmp__259 = ( ImmediateAST ) _localctx.local__3_or_expr_case0.result ; 
        tmp__260 = (ImmediateAST) mkOr( tmp__257, tmp__258, tmp__259 ); 
        $result = tmp__260; 
      } 
    | local__1_or_expr_case1=and_expr { 
        ImmediateAST tmp__261 ; 
        tmp__261 = ( ImmediateAST ) _localctx.local__1_or_expr_case1.result ; 
        $result = tmp__261; 
      } 
; 
gen__line_wrap_or returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap_or_case0='or' gen__optional_newline { 
        CommonToken tmp__262 ; 
        tmp__262 = ( CommonToken ) _localctx.local__2_gen__line_wrap_or_case0 ; 
        $result = tmp__262; 
      } 
; 
block returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_block_case0=gen__filter_stmt__gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__263 ; 
        tmp__263 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_block_case0.result ; 
        $result = tmp__263; 
      } 
; 
gen__filter_stmt__gen__or___L59__newline returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__filter_stmt__gen__or___L59__newline_case0=gen__filter_stmt__gen__or___L59__newline local__2_gen__filter_stmt__gen__or___L59__newline_case0=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__266 ; 
        ImmediateAST tmp__265 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__264 ; 
        tmp__264 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case0.result ; 
        tmp__265 = ( ImmediateAST ) _localctx.local__2_gen__filter_stmt__gen__or___L59__newline_case0.result ; 
        tmp__266 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__264, tmp__265 ); 
        $result = tmp__266; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__newline_case1=gen__filter_stmt__gen__or___L59__newline gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__267 ; 
        tmp__267 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case1.result ; 
        $result = tmp__267; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__newline_case2=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__270 ; 
        ImmediateAST tmp__269 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__268 ; 
        tmp__268 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__269 = ( ImmediateAST ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case2.result ; 
        tmp__270 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__268, tmp__269 ); 
        $result = tmp__270; 
      } 
    | gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__271 ; 
        tmp__271 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__271; 
      } 
; 
gen__or___L59__newline returns [int result] :
      ';' { 
        int tmp__272 ; 
        tmp__272 = 0 ; 
        $result = tmp__272; 
      } 
    | newline { 
        int tmp__273 ; 
        tmp__273 = 0 ; 
        $result = tmp__273; 
      } 
; 
lhs returns [ImmediateAST result] :
      local__1_lhs_case0=NAME_13 { 
        ImmediateAST tmp__276 ; 
        CommonToken tmp__275 ; 
        CommonToken tmp__274 ; 
        tmp__274 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__275 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__276 = (ImmediateAST) mkVar( tmp__274, tmp__275.Text ); 
        $result = tmp__276; 
      } 
    | local__1_lhs_case1=atom local__2_lhs_case1='.' '[' local__4_lhs_case1=expr ']' { 
        ImmediateAST tmp__280 ; 
        ImmediateAST tmp__279 ; 
        ImmediateAST tmp__278 ; 
        CommonToken tmp__277 ; 
        tmp__277 = ( CommonToken ) _localctx.local__2_lhs_case1 ; 
        tmp__278 = ( ImmediateAST ) _localctx.local__1_lhs_case1.result ; 
        tmp__279 = ( ImmediateAST ) _localctx.local__4_lhs_case1.result ; 
        tmp__280 = (ImmediateAST) mkOGet( tmp__277, tmp__278, tmp__279 ); 
        $result = tmp__280; 
      } 
    | local__1_lhs_case2=atom local__2_lhs_case2='.' local__3_lhs_case2=NAME_13 { 
        ImmediateAST tmp__287 ; 
        ImmediateAST tmp__286 ; 
        DObj tmp__285 ; 
        CommonToken tmp__284 ; 
        CommonToken tmp__283 ; 
        ImmediateAST tmp__282 ; 
        CommonToken tmp__281 ; 
        tmp__281 = ( CommonToken ) _localctx.local__2_lhs_case2 ; 
        tmp__282 = ( ImmediateAST ) _localctx.local__1_lhs_case2.result ; 
        tmp__283 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__284 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__285 = (DObj) mkstr( tmp__284.Text ); 
        tmp__286 = (ImmediateAST) mkVal( tmp__283, tmp__285 ); 
        tmp__287 = (ImmediateAST) mkOGet( tmp__281, tmp__282, tmp__286 ); 
        $result = tmp__287; 
      } 
; 
do returns [CommonToken result] :
      gen__optional_newline local__2_do_case0='do' { 
        CommonToken tmp__288 ; 
        tmp__288 = ( CommonToken ) _localctx.local__2_do_case0 ; 
        $result = tmp__288; 
      } 
; 
then returns [CommonToken result] :
      gen__optional_newline local__2_then_case0='then' { 
        CommonToken tmp__289 ; 
        tmp__289 = ( CommonToken ) _localctx.local__2_then_case0 ; 
        $result = tmp__289; 
      } 
; 
gen__blockOf_do returns [ImmediateAST result] :
      local__1_gen__blockOf_do_case0=do local__2_gen__blockOf_do_case0=block { 
        ImmediateAST tmp__292 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__291 ; 
        CommonToken tmp__290 ; 
        tmp__290 = ( CommonToken ) _localctx.local__1_gen__blockOf_do_case0.result ; 
        tmp__291 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_do_case0.result ; 
        tmp__292 = (ImmediateAST) mkBlock( tmp__290, tmp__291 ); 
        $result = tmp__292; 
      } 
; 
name returns [string result] :
      local__1_name_case0=NAME_13 { 
        CommonToken tmp__293 ; 
        tmp__293 = ( CommonToken ) _localctx.local__1_name_case0 ; 
        $result = tmp__293.Text; 
      } 
; 
elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      local__1_elifBlock_case0=expr local__2_elifBlock_case0=gen__blockOf_then { 
        ImmediateAST tmp__296 ; 
        ImmediateAST tmp__295 ; 
        (ImmediateAST, ImmediateAST) tmp__294 ; 
        tmp__295 = ( ImmediateAST ) _localctx.local__1_elifBlock_case0.result ; 
        tmp__296 = ( ImmediateAST ) _localctx.local__2_elifBlock_case0.result ; 
        tmp__294 = ( tmp__295 , tmp__296 ); 
        $result = tmp__294; 
      } 
; 
gen__blockOf_then returns [ImmediateAST result] :
      local__1_gen__blockOf_then_case0=then local__2_gen__blockOf_then_case0=block { 
        ImmediateAST tmp__299 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__298 ; 
        CommonToken tmp__297 ; 
        tmp__297 = ( CommonToken ) _localctx.local__1_gen__blockOf_then_case0.result ; 
        tmp__298 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_then_case0.result ; 
        tmp__299 = (ImmediateAST) mkBlock( tmp__297, tmp__298 ); 
        $result = tmp__299; 
      } 
; 
lhs_seq returns [System.Collections.Generic.List<(ImmediateAST, string)> result] :
      local__1_lhs_seq_case0=lhs_seq local__2_lhs_seq_case0=lhs local__3_lhs_seq_case0=gen__optional_ibinop '=' { 
        System.Collections.Generic.List<(ImmediateAST, string)> tmp__304 ; 
        string tmp__303 ; 
        ImmediateAST tmp__302 ; 
        (ImmediateAST, string) tmp__301 ; 
        System.Collections.Generic.List<(ImmediateAST, string)> tmp__300 ; 
        tmp__300 = ( System.Collections.Generic.List<(ImmediateAST, string)> ) _localctx.local__1_lhs_seq_case0.result ; 
        tmp__302 = ( ImmediateAST ) _localctx.local__2_lhs_seq_case0.result ; 
        tmp__303 = ( string ) _localctx.local__3_lhs_seq_case0.result ; 
        tmp__301 = ( tmp__302 , tmp__303 ); 
        tmp__304 = (System.Collections.Generic.List<(ImmediateAST, string)>) append<(ImmediateAST, string)>( tmp__300, tmp__301 ); 
        $result = tmp__304; 
      } 
    | local__1_lhs_seq_case1=lhs local__2_lhs_seq_case1=gen__optional_ibinop '=' { 
        string tmp__308 ; 
        ImmediateAST tmp__307 ; 
        (ImmediateAST, string) tmp__306 ; 
        System.Collections.Generic.List<(ImmediateAST, string)> tmp__305 ; 
        tmp__307 = ( ImmediateAST ) _localctx.local__1_lhs_seq_case1.result ; 
        tmp__308 = ( string ) _localctx.local__2_lhs_seq_case1.result ; 
        tmp__306 = ( tmp__307 , tmp__308 ); 
        tmp__305 = new System.Collections.Generic.List<(ImmediateAST, string)> { tmp__306 }; 
        $result = tmp__305; 
      } 
; 
gen__optional_ibinop returns [string result] :
      local__1_gen__optional_ibinop_case0=ibinop { 
        string tmp__309 ; 
        tmp__309 = ( string ) _localctx.local__1_gen__optional_ibinop_case0.result ; 
        $result = tmp__309; 
      } 
    | { 
        $result = null; 
      } 
; 
start returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_start_case0=gen__nullable_gen__seplist_newline__stmt gen__optional_newline EOF { 
        System.Collections.Generic.List<ImmediateAST> tmp__310 ; 
        tmp__310 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_start_case0.result ; 
        $result = tmp__310; 
      } 
; 
gen__nullable_gen__seplist_newline__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__nullable_gen__seplist_newline__stmt_case0=gen__seplist_newline__stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__311 ; 
        tmp__311 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist_newline__stmt_case0.result ; 
        $result = tmp__311; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__312 ; 
        tmp__312 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__312; 
      } 
; 
gen__seplist_newline__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_newline__stmt_case0=stmt { 
        ImmediateAST tmp__314 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__313 ; 
        tmp__314 = ( ImmediateAST ) _localctx.local__1_gen__seplist_newline__stmt_case0.result ; 
        tmp__313 = new System.Collections.Generic.List<ImmediateAST> { tmp__314 }; 
        $result = tmp__313; 
      } 
    | local__1_gen__seplist_newline__stmt_case1=gen__seplist_newline__stmt newline local__3_gen__seplist_newline__stmt_case1=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__317 ; 
        ImmediateAST tmp__316 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__315 ; 
        tmp__315 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_newline__stmt_case1.result ; 
        tmp__316 = ( ImmediateAST ) _localctx.local__3_gen__seplist_newline__stmt_case1.result ; 
        tmp__317 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__315, tmp__316 ); 
        $result = tmp__317; 
      } 
; 


COMMENT_1 : '#' (~('\n'|'\r'))* -> skip;
SINGLE_BINOP_2 : ('<'|'>'|'>' '='|'<' '='|'=' '='|'!' '='|'+'|'*'|'*' '*'|'/'|'/' '/'|'%'|'&'|'|'|'<' '<'|'>' '>');
fragment ESCAPED_QUOTE_3 : '\\' '"';
STR_4 : '"' (ESCAPED_QUOTE_3|~'"')* '"';
fragment WS_5 : ('\r'|'\t'|'\n'|' ');
INT_10 : (DIGIT_6+|HEX_7|OCT_8|BIN_9);
HEX_7 : '0' 'x' ([\u0030-\u0039]|[\u0061-\u0066])*;
OCT_8 : '0' 'o' [\u0030-\u0037]*;
BIN_9 : '0' 'b' [\u0030-\u0031]*;
fragment DIGIT_6 : [\u0030-\u0039];
FLOAT_11 : INT_10 '.' INT_10;
fragment UCODE_12 : [\u0061-\u007A]|[\u0041-\u005A]|'_'|[\u4e00-\u9fa5]|'☆';
NAME_13 : UCODE_12 (DIGIT_6|UCODE_12)*;
WS_INLINE_14 : (' '|'\t')+ -> skip;
fragment CR_15 : '\r';
fragment LF_16 : '\n';
NEWLINE_17 : (CR_15? LF_16)+ (WS_INLINE_14|(CR_15? LF_16))*;


