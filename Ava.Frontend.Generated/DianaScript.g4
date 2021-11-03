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
        System.Collections.Generic.List<ImmediateAST> tmp__22 ; 
        tmp__22 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_stmt_case4.result ; 
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
    | local__1_stmt_case13=ibin { 
        ImmediateAST tmp__51 ; 
        tmp__51 = ( ImmediateAST ) _localctx.local__1_stmt_case13.result ; 
        $result = tmp__51; 
      } 
    | local__1_stmt_case14=expr { 
        ImmediateAST tmp__52 ; 
        tmp__52 = ( ImmediateAST ) _localctx.local__1_stmt_case14.result ; 
        $result = tmp__52; 
      } 
; 
gen__line_wrap_end returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap_end_case0='end' gen__optional_newline { 
        CommonToken tmp__53 ; 
        tmp__53 = ( CommonToken ) _localctx.local__2_gen__line_wrap_end_case0 ; 
        $result = tmp__53; 
      } 
; 
gen__optional_newline returns [CommonToken result] :
      local__1_gen__optional_newline_case0=newline { 
        CommonToken tmp__54 ; 
        tmp__54 = ( CommonToken ) _localctx.local__1_gen__optional_newline_case0.result ; 
        $result = tmp__54; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__line_wrap_begin returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap_begin_case0='begin' gen__optional_newline { 
        CommonToken tmp__55 ; 
        tmp__55 = ( CommonToken ) _localctx.local__2_gen__line_wrap_begin_case0 ; 
        $result = tmp__55; 
      } 
; 
newline returns [CommonToken result] :
      local__1_newline_case0=NEWLINE_17 { 
        CommonToken tmp__56 ; 
        tmp__56 = ( CommonToken ) _localctx.local__1_newline_case0 ; 
        $result = tmp__56; 
      } 
    | newline local__2_newline_case1=NEWLINE_17 { 
        CommonToken tmp__57 ; 
        tmp__57 = ( CommonToken ) _localctx.local__2_newline_case1 ; 
        $result = tmp__57; 
      } 
; 
atom returns [ImmediateAST result] :
      local__1_atom_case0=atom local__2_atom_case0='.' '[' local__4_atom_case0=expr ']' { 
        ImmediateAST tmp__61 ; 
        ImmediateAST tmp__60 ; 
        ImmediateAST tmp__59 ; 
        CommonToken tmp__58 ; 
        tmp__58 = ( CommonToken ) _localctx.local__2_atom_case0 ; 
        tmp__59 = ( ImmediateAST ) _localctx.local__1_atom_case0.result ; 
        tmp__60 = ( ImmediateAST ) _localctx.local__4_atom_case0.result ; 
        tmp__61 = (ImmediateAST) mkOGet( tmp__58, tmp__59, tmp__60 ); 
        $result = tmp__61; 
      } 
    | local__1_atom_case1=atom local__2_atom_case1='.' local__3_atom_case1=NAME_13 { 
        ImmediateAST tmp__68 ; 
        ImmediateAST tmp__67 ; 
        DObj tmp__66 ; 
        CommonToken tmp__65 ; 
        CommonToken tmp__64 ; 
        ImmediateAST tmp__63 ; 
        CommonToken tmp__62 ; 
        tmp__62 = ( CommonToken ) _localctx.local__2_atom_case1 ; 
        tmp__63 = ( ImmediateAST ) _localctx.local__1_atom_case1.result ; 
        tmp__64 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__65 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__66 = (DObj) mkstr( tmp__65.Text ); 
        tmp__67 = (ImmediateAST) mkVal( tmp__64, tmp__66 ); 
        tmp__68 = (ImmediateAST) mkOGet( tmp__62, tmp__63, tmp__67 ); 
        $result = tmp__68; 
      } 
    | local__1_atom_case2=atom local__2_atom_case2='(' local__3_atom_case2=gen__closelist__L44__expr ')' { 
        ImmediateAST tmp__72 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__71 ; 
        ImmediateAST tmp__70 ; 
        CommonToken tmp__69 ; 
        tmp__69 = ( CommonToken ) _localctx.local__2_atom_case2 ; 
        tmp__70 = ( ImmediateAST ) _localctx.local__1_atom_case2.result ; 
        tmp__71 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__3_atom_case2.result ; 
        tmp__72 = (ImmediateAST) mkApp( tmp__69, tmp__70, tmp__71 ); 
        $result = tmp__72; 
      } 
    | local__1_atom_case3='[' local__2_atom_case3=gen__closelist__L44__expr ']' { 
        ImmediateAST tmp__75 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__74 ; 
        CommonToken tmp__73 ; 
        tmp__73 = ( CommonToken ) _localctx.local__1_atom_case3 ; 
        tmp__74 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case3.result ; 
        tmp__75 = (ImmediateAST) mkList( tmp__73, tmp__74 ); 
        $result = tmp__75; 
      } 
    | local__1_atom_case4='(' local__2_atom_case4=gen__closelist__L44__expr local__3_atom_case4=trailer ')' { 
        ImmediateAST tmp__79 ; 
        bool tmp__78 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__77 ; 
        CommonToken tmp__76 ; 
        tmp__76 = ( CommonToken ) _localctx.local__1_atom_case4 ; 
        tmp__77 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case4.result ; 
        tmp__78 = ( bool ) _localctx.local__3_atom_case4.result ; 
        tmp__79 = (ImmediateAST) mkTuple( tmp__76, tmp__77, tmp__78 ); 
        $result = tmp__79; 
      } 
    | local__1_atom_case5='{|' local__2_atom_case5=gen__closelist__L44__pair trailer '|}' { 
        ImmediateAST tmp__82 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__81 ; 
        CommonToken tmp__80 ; 
        tmp__80 = ( CommonToken ) _localctx.local__1_atom_case5 ; 
        tmp__81 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case5.result ; 
        tmp__82 = (ImmediateAST) mkStrDict( tmp__80, tmp__81 ); 
        $result = tmp__82; 
      } 
    | local__1_atom_case6='{' local__2_atom_case6=gen__closelist__L44__pair trailer '}' { 
        ImmediateAST tmp__85 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__84 ; 
        CommonToken tmp__83 ; 
        tmp__83 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__84 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case6.result ; 
        tmp__85 = (ImmediateAST) mkDict( tmp__83, tmp__84 ); 
        $result = tmp__85; 
      } 
    | local__1_atom_case7='{' local__2_atom_case7=gen__closelist__L44__expr '}' { 
        ImmediateAST tmp__88 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__87 ; 
        CommonToken tmp__86 ; 
        tmp__86 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__87 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case7.result ; 
        tmp__88 = (ImmediateAST) mkSet( tmp__86, tmp__87 ); 
        $result = tmp__88; 
      } 
    | local__1_atom_case8=STR_4 { 
        ImmediateAST tmp__93 ; 
        DObj tmp__92 ; 
        string tmp__91 ; 
        CommonToken tmp__90 ; 
        CommonToken tmp__89 ; 
        tmp__89 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__90 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__91 = (string) unesc( tmp__90.Text ); 
        tmp__92 = (DObj) mkstr( tmp__91 ); 
        tmp__93 = (ImmediateAST) mkVal( tmp__89, tmp__92 ); 
        $result = tmp__93; 
      } 
    | local__1_atom_case9=INT_10 { 
        ImmediateAST tmp__98 ; 
        DObj tmp__97 ; 
        int tmp__96 ; 
        CommonToken tmp__95 ; 
        CommonToken tmp__94 ; 
        tmp__94 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__95 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__96 = 0 ; 
        tmp__97 = (DObj) mkint( tmp__95.Text, tmp__96 ); 
        tmp__98 = (ImmediateAST) mkVal( tmp__94, tmp__97 ); 
        $result = tmp__98; 
      } 
    | local__1_atom_case10=HEX_7 { 
        ImmediateAST tmp__103 ; 
        DObj tmp__102 ; 
        int tmp__101 ; 
        CommonToken tmp__100 ; 
        CommonToken tmp__99 ; 
        tmp__99 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__100 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__101 = 16 ; 
        tmp__102 = (DObj) mkint( tmp__100.Text, tmp__101 ); 
        tmp__103 = (ImmediateAST) mkVal( tmp__99, tmp__102 ); 
        $result = tmp__103; 
      } 
    | local__1_atom_case11=OCT_8 { 
        ImmediateAST tmp__108 ; 
        DObj tmp__107 ; 
        int tmp__106 ; 
        CommonToken tmp__105 ; 
        CommonToken tmp__104 ; 
        tmp__104 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__105 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__106 = 8 ; 
        tmp__107 = (DObj) mkint( tmp__105.Text, tmp__106 ); 
        tmp__108 = (ImmediateAST) mkVal( tmp__104, tmp__107 ); 
        $result = tmp__108; 
      } 
    | local__1_atom_case12=BIN_9 { 
        ImmediateAST tmp__113 ; 
        DObj tmp__112 ; 
        int tmp__111 ; 
        CommonToken tmp__110 ; 
        CommonToken tmp__109 ; 
        tmp__109 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__110 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__111 = 2 ; 
        tmp__112 = (DObj) mkint( tmp__110.Text, tmp__111 ); 
        tmp__113 = (ImmediateAST) mkVal( tmp__109, tmp__112 ); 
        $result = tmp__113; 
      } 
    | local__1_atom_case13=FLOAT_11 { 
        ImmediateAST tmp__117 ; 
        DObj tmp__116 ; 
        CommonToken tmp__115 ; 
        CommonToken tmp__114 ; 
        tmp__114 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__115 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__116 = (DObj) mkfloat( tmp__115.Text ); 
        tmp__117 = (ImmediateAST) mkVal( tmp__114, tmp__116 ); 
        $result = tmp__117; 
      } 
    | local__1_atom_case14='None' { 
        ImmediateAST tmp__120 ; 
        DObj tmp__119 ; 
        CommonToken tmp__118 ; 
        tmp__118 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__119 = (DObj) mknone(  ); 
        tmp__120 = (ImmediateAST) mkVal( tmp__118, tmp__119 ); 
        $result = tmp__120; 
      } 
    | local__1_atom_case15=NAME_13 { 
        ImmediateAST tmp__123 ; 
        CommonToken tmp__122 ; 
        CommonToken tmp__121 ; 
        tmp__121 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__122 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__123 = (ImmediateAST) mkVar( tmp__121, tmp__122.Text ); 
        $result = tmp__123; 
      } 
    | local__1_atom_case16='-' local__2_atom_case16=atom { 
        ImmediateAST tmp__126 ; 
        ImmediateAST tmp__125 ; 
        CommonToken tmp__124 ; 
        tmp__124 = ( CommonToken ) _localctx.local__1_atom_case16 ; 
        tmp__125 = ( ImmediateAST ) _localctx.local__2_atom_case16.result ; 
        tmp__126 = (ImmediateAST) mkNeg( tmp__124, tmp__125 ); 
        $result = tmp__126; 
      } 
    | local__1_atom_case17='~' local__2_atom_case17=atom { 
        ImmediateAST tmp__129 ; 
        ImmediateAST tmp__128 ; 
        CommonToken tmp__127 ; 
        tmp__127 = ( CommonToken ) _localctx.local__1_atom_case17 ; 
        tmp__128 = ( ImmediateAST ) _localctx.local__2_atom_case17.result ; 
        tmp__129 = (ImmediateAST) mkInv( tmp__127, tmp__128 ); 
        $result = tmp__129; 
      } 
    | local__1_atom_case18='if' local__2_atom_case18=expr local__3_atom_case18=then local__4_atom_case18=block 'end' { 
        ImmediateAST tmp__135 ; 
        ImmediateAST tmp__134 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__133 ; 
        CommonToken tmp__132 ; 
        ImmediateAST tmp__131 ; 
        CommonToken tmp__130 ; 
        tmp__130 = ( CommonToken ) _localctx.local__1_atom_case18 ; 
        tmp__131 = ( ImmediateAST ) _localctx.local__2_atom_case18.result ; 
        tmp__132 = ( CommonToken ) _localctx.local__3_atom_case18.result ; 
        tmp__133 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case18.result ; 
        tmp__134 = (ImmediateAST) mkBlock( tmp__132, tmp__133 ); 
        tmp__135 = (ImmediateAST) mkIfThen( tmp__130, tmp__131, tmp__134 ); 
        $result = tmp__135; 
      } 
    | local__1_atom_case19='if' local__2_atom_case19=expr local__3_atom_case19=then local__4_atom_case19=block local__5_atom_case19=gen__nullable_gen__list_gen__snd_elif__elifBlock local__6_atom_case19=gen__optional_gen__blockOf_else 'end' { 
        ImmediateAST tmp__147 ; 
        ImmediateAST tmp__146 ; 
        CommonToken tmp__145 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__143 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__144 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__141 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__142 ; 
        ImmediateAST tmp__140 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__139 ; 
        CommonToken tmp__138 ; 
        ImmediateAST tmp__137 ; 
        (ImmediateAST, ImmediateAST) elif__136 ; 
        tmp__137 = ( ImmediateAST ) _localctx.local__2_atom_case19.result ; 
        tmp__138 = ( CommonToken ) _localctx.local__3_atom_case19.result ; 
        tmp__139 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case19.result ; 
        tmp__140 = (ImmediateAST) mkBlock( tmp__138, tmp__139 ); 
        elif__136 = ( tmp__137 , tmp__140 ); 
        tmp__142 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        elifs__141 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__142, elif__136 ); 
        tmp__144 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__5_atom_case19.result ; 
        elifs__143 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) extend<(ImmediateAST, ImmediateAST)>( elifs__141, tmp__144 ); 
        tmp__145 = ( CommonToken ) _localctx.local__1_atom_case19 ; 
        tmp__146 = ( ImmediateAST ) _localctx.local__6_atom_case19.result ; 
        tmp__147 = (ImmediateAST) mkNestedIf( tmp__145, elifs__141, tmp__146 ); 
        $result = tmp__147; 
      } 
    | local__1_atom_case20='fun' local__2_atom_case20=name '(' local__4_atom_case20=gen__nullable_gen__seplist__L44__name ')' local__6_atom_case20=block 'end' { 
        ImmediateAST tmp__152 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__151 ; 
        System.Collections.Generic.List<string> tmp__150 ; 
        string tmp__149 ; 
        CommonToken tmp__148 ; 
        tmp__148 = ( CommonToken ) _localctx.local__1_atom_case20 ; 
        tmp__149 = ( string ) _localctx.local__2_atom_case20.result ; 
        tmp__150 = ( System.Collections.Generic.List<string> ) _localctx.local__4_atom_case20.result ; 
        tmp__151 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__6_atom_case20.result ; 
        tmp__152 = (ImmediateAST) mkFunc( tmp__148, tmp__149, tmp__150, tmp__151 ); 
        $result = tmp__152; 
      } 
    | local__1_atom_case21='fun' '(' local__3_atom_case21=gen__nullable_gen__seplist__L44__name ')' local__5_atom_case21=block 'end' { 
        ImmediateAST tmp__157 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__156 ; 
        System.Collections.Generic.List<string> tmp__155 ; 
        string tmp__154 ; 
        CommonToken tmp__153 ; 
        tmp__153 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__154 = "" ; 
        tmp__155 = ( System.Collections.Generic.List<string> ) _localctx.local__3_atom_case21.result ; 
        tmp__156 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__5_atom_case21.result ; 
        tmp__157 = (ImmediateAST) mkFunc( tmp__153, tmp__154, tmp__155, tmp__156 ); 
        $result = tmp__157; 
      } 
    | local__1_atom_case22='(' local__2_atom_case22=gen__nullable_gen__seplist__L44__name ')' '->' local__5_atom_case22=gen__line_wrap_expr { 
        ImmediateAST tmp__163 ; 
        ImmediateAST tmp__162 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__161 ; 
        System.Collections.Generic.List<string> tmp__160 ; 
        string tmp__159 ; 
        CommonToken tmp__158 ; 
        tmp__158 = ( CommonToken ) _localctx.local__1_atom_case22 ; 
        tmp__159 = "" ; 
        tmp__160 = ( System.Collections.Generic.List<string> ) _localctx.local__2_atom_case22.result ; 
        tmp__162 = ( ImmediateAST ) _localctx.local__5_atom_case22.result ; 
        tmp__161 = new System.Collections.Generic.List<ImmediateAST> { tmp__162 }; 
        tmp__163 = (ImmediateAST) mkFunc( tmp__158, tmp__159, tmp__160, tmp__161 ); 
        $result = tmp__163; 
      } 
    | local__1_atom_case23=NAME_13 '->' local__3_atom_case23=gen__line_wrap_expr { 
        ImmediateAST tmp__170 ; 
        ImmediateAST tmp__169 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__168 ; 
        CommonToken tmp__167 ; 
        System.Collections.Generic.List<string> tmp__166 ; 
        string tmp__165 ; 
        CommonToken tmp__164 ; 
        tmp__164 = ( CommonToken ) _localctx.local__1_atom_case23 ; 
        tmp__165 = "" ; 
        tmp__167 = ( CommonToken ) _localctx.local__1_atom_case23 ; 
        tmp__166 = new System.Collections.Generic.List<string> { tmp__167.Text }; 
        tmp__169 = ( ImmediateAST ) _localctx.local__3_atom_case23.result ; 
        tmp__168 = new System.Collections.Generic.List<ImmediateAST> { tmp__169 }; 
        tmp__170 = (ImmediateAST) mkFunc( tmp__164, tmp__165, tmp__166, tmp__168 ); 
        $result = tmp__170; 
      } 
; 
gen__line_wrap_expr returns [ImmediateAST result] :
      gen__optional_newline local__2_gen__line_wrap_expr_case0=expr gen__optional_newline { 
        ImmediateAST tmp__171 ; 
        tmp__171 = ( ImmediateAST ) _localctx.local__2_gen__line_wrap_expr_case0.result ; 
        $result = tmp__171; 
      } 
; 
gen__nullable_gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__nullable_gen__seplist__L44__name_case0=gen__seplist__L44__name { 
        System.Collections.Generic.List<string> tmp__172 ; 
        tmp__172 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__nullable_gen__seplist__L44__name_case0.result ; 
        $result = tmp__172; 
      } 
    | { 
        System.Collections.Generic.List<string> tmp__173 ; 
        tmp__173 = (System.Collections.Generic.List<string>) empty<string>(  ); 
        $result = tmp__173; 
      } 
; 
gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__seplist__L44__name_case0=name { 
        string tmp__175 ; 
        System.Collections.Generic.List<string> tmp__174 ; 
        tmp__175 = ( string ) _localctx.local__1_gen__seplist__L44__name_case0.result ; 
        tmp__174 = new System.Collections.Generic.List<string> { tmp__175 }; 
        $result = tmp__174; 
      } 
    | local__1_gen__seplist__L44__name_case1=gen__seplist__L44__name ',' local__3_gen__seplist__L44__name_case1=name { 
        System.Collections.Generic.List<string> tmp__178 ; 
        string tmp__177 ; 
        System.Collections.Generic.List<string> tmp__176 ; 
        tmp__176 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__seplist__L44__name_case1.result ; 
        tmp__177 = ( string ) _localctx.local__3_gen__seplist__L44__name_case1.result ; 
        tmp__178 = (System.Collections.Generic.List<string>) append<string>( tmp__176, tmp__177 ); 
        $result = tmp__178; 
      } 
; 
gen__optional_gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__optional_gen__blockOf_else_case0=gen__blockOf_else { 
        ImmediateAST tmp__179 ; 
        tmp__179 = ( ImmediateAST ) _localctx.local__1_gen__optional_gen__blockOf_else_case0.result ; 
        $result = tmp__179; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__blockOf_else_case0='else' local__2_gen__blockOf_else_case0=block { 
        ImmediateAST tmp__182 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__181 ; 
        CommonToken tmp__180 ; 
        tmp__180 = ( CommonToken ) _localctx.local__1_gen__blockOf_else_case0 ; 
        tmp__181 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_else_case0.result ; 
        tmp__182 = (ImmediateAST) mkBlock( tmp__180, tmp__181 ); 
        $result = tmp__182; 
      } 
; 
gen__nullable_gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0=gen__list_gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__183 ; 
        tmp__183 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__183; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__184 ; 
        tmp__184 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__184; 
      } 
; 
gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__list_gen__snd_elif__elifBlock_case0=gen__snd_elif__elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__186 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__185 ; 
        tmp__186 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        tmp__185 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__186 }; 
        $result = tmp__185; 
      } 
    | local__1_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock local__2_gen__list_gen__snd_elif__elifBlock_case1=gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__189 ; 
        (ImmediateAST, ImmediateAST) tmp__188 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__187 ; 
        tmp__187 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__188 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__189 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__187, tmp__188 ); 
        $result = tmp__189; 
      } 
; 
gen__snd_elif__elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      'elif' local__2_gen__snd_elif__elifBlock_case0=elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__190 ; 
        tmp__190 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__190; 
      } 
; 
gen__closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      gen__optional_newline local__2_gen__closelist__L44__pair_case0=gen___closelist__L44__pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__191 ; 
        tmp__191 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_gen__closelist__L44__pair_case0.result ; 
        $result = tmp__191; 
      } 
; 
gen___closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen___closelist__L44__pair_case0=gen___closelist__L44__pair newline { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__192 ; 
        tmp__192 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case0.result ; 
        $result = tmp__192; 
      } 
    | local__1_gen___closelist__L44__pair_case1=gen___closelist__L44__pair ',' newline local__4_gen___closelist__L44__pair_case1=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__195 ; 
        (ImmediateAST, ImmediateAST) tmp__194 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__193 ; 
        tmp__193 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case1.result ; 
        tmp__194 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__4_gen___closelist__L44__pair_case1.result ; 
        tmp__195 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__193, tmp__194 ); 
        $result = tmp__195; 
      } 
    | local__1_gen___closelist__L44__pair_case2=gen___closelist__L44__pair ',' local__3_gen___closelist__L44__pair_case2=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__198 ; 
        (ImmediateAST, ImmediateAST) tmp__197 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__196 ; 
        tmp__196 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case2.result ; 
        tmp__197 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__3_gen___closelist__L44__pair_case2.result ; 
        tmp__198 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__196, tmp__197 ); 
        $result = tmp__198; 
      } 
    | local__1_gen___closelist__L44__pair_case3=pair { 
        (ImmediateAST, ImmediateAST) tmp__200 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__199 ; 
        tmp__200 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen___closelist__L44__pair_case3.result ; 
        tmp__199 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__200 }; 
        $result = tmp__199; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__201 ; 
        tmp__201 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { }; 
        $result = tmp__201; 
      } 
; 
gen__closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_gen__closelist__L44__expr_case0=gen___closelist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__202 ; 
        tmp__202 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__closelist__L44__expr_case0.result ; 
        $result = tmp__202; 
      } 
; 
gen___closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen___closelist__L44__expr_case0=gen___closelist__L44__expr newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__203 ; 
        tmp__203 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case0.result ; 
        $result = tmp__203; 
      } 
    | local__1_gen___closelist__L44__expr_case1=gen___closelist__L44__expr ',' newline local__4_gen___closelist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__206 ; 
        ImmediateAST tmp__205 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__204 ; 
        tmp__204 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case1.result ; 
        tmp__205 = ( ImmediateAST ) _localctx.local__4_gen___closelist__L44__expr_case1.result ; 
        tmp__206 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__204, tmp__205 ); 
        $result = tmp__206; 
      } 
    | local__1_gen___closelist__L44__expr_case2=gen___closelist__L44__expr ',' local__3_gen___closelist__L44__expr_case2=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__209 ; 
        ImmediateAST tmp__208 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__207 ; 
        tmp__207 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case2.result ; 
        tmp__208 = ( ImmediateAST ) _localctx.local__3_gen___closelist__L44__expr_case2.result ; 
        tmp__209 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__207, tmp__208 ); 
        $result = tmp__209; 
      } 
    | local__1_gen___closelist__L44__expr_case3=expr { 
        ImmediateAST tmp__211 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__210 ; 
        tmp__211 = ( ImmediateAST ) _localctx.local__1_gen___closelist__L44__expr_case3.result ; 
        tmp__210 = new System.Collections.Generic.List<ImmediateAST> { tmp__211 }; 
        $result = tmp__210; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__212 ; 
        tmp__212 = new System.Collections.Generic.List<ImmediateAST> { }; 
        $result = tmp__212; 
      } 
; 
pair returns [(ImmediateAST, ImmediateAST) result] :
      local__1_pair_case0=expr gen__line_wrap__L58 local__3_pair_case0=expr { 
        ImmediateAST tmp__215 ; 
        ImmediateAST tmp__214 ; 
        (ImmediateAST, ImmediateAST) tmp__213 ; 
        tmp__214 = ( ImmediateAST ) _localctx.local__1_pair_case0.result ; 
        tmp__215 = ( ImmediateAST ) _localctx.local__3_pair_case0.result ; 
        tmp__213 = ( tmp__214 , tmp__215 ); 
        $result = tmp__213; 
      } 
; 
gen__line_wrap__L58 returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap__L58_case0=':' gen__optional_newline { 
        CommonToken tmp__216 ; 
        tmp__216 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L58_case0 ; 
        $result = tmp__216; 
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
        ImmediateAST tmp__218 ; 
        System.Collections.Generic.List<object> tmp__217 ; 
        tmp__217 = ( System.Collections.Generic.List<object> ) _localctx.local__1_bin_case0.result ; 
        tmp__218 = (ImmediateAST) resolve_binop( tmp__217 ); 
        $result = tmp__218; 
      } 
; 
binseq returns [System.Collections.Generic.List<object> result] :
      local__1_binseq_case0=atom { 
        System.Collections.Generic.List<object> tmp__222 ; 
        object tmp__221 ; 
        ImmediateAST tmp__220 ; 
        System.Collections.Generic.List<object> tmp__219 ; 
        tmp__219 = (System.Collections.Generic.List<object>) empty<object>(  ); 
        tmp__220 = ( ImmediateAST ) _localctx.local__1_binseq_case0.result ; 
        tmp__221 = (object) to_obj<ImmediateAST>( tmp__220 ); 
        tmp__222 = (System.Collections.Generic.List<object>) append<object>( tmp__219, tmp__221 ); 
        $result = tmp__222; 
      } 
    | local__1_binseq_case1=binseq local__2_binseq_case1=binop local__3_binseq_case1=atom { 
        object tmp__228 ; 
        ImmediateAST tmp__227 ; 
        System.Collections.Generic.List<object> tmp__226 ; 
        System.Collections.Generic.List<object> block__223 ; 
        object tmp__225 ; 
        System.Collections.Generic.List<object> tmp__224 ; 
        tmp__224 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__225 = ( object ) _localctx.local__2_binseq_case1.result ; 
        block__223 = (System.Collections.Generic.List<object>) append<object>( tmp__224, tmp__225 ); 
        tmp__226 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__227 = ( ImmediateAST ) _localctx.local__3_binseq_case1.result ; 
        tmp__228 = (object) to_obj<ImmediateAST>( tmp__227 ); 
        block__223 = (System.Collections.Generic.List<object>) append<object>( tmp__226, tmp__228 ); 
        $result = block__223; 
      } 
; 
ibin returns [ImmediateAST result] :
      local__1_ibin_case0=lhs local__2_ibin_case0=ibinop local__3_ibin_case0='=' local__4_ibin_case0=expr { 
        ImmediateAST tmp__233 ; 
        ImmediateAST tmp__232 ; 
        string tmp__231 ; 
        ImmediateAST tmp__230 ; 
        CommonToken tmp__229 ; 
        tmp__229 = ( CommonToken ) _localctx.local__3_ibin_case0 ; 
        tmp__230 = ( ImmediateAST ) _localctx.local__1_ibin_case0.result ; 
        tmp__231 = ( string ) _localctx.local__2_ibin_case0.result ; 
        tmp__232 = ( ImmediateAST ) _localctx.local__4_ibin_case0.result ; 
        tmp__233 = (ImmediateAST) mkIBin( tmp__229, tmp__230, tmp__231, tmp__232 ); 
        $result = tmp__233; 
      } 
; 
ibinop returns [string result] :
      local__1_ibinop_case0=SINGLE_BINOP_2 { 
        CommonToken tmp__234 ; 
        tmp__234 = ( CommonToken ) _localctx.local__1_ibinop_case0 ; 
        $result = tmp__234.Text; 
      } 
    | '-' { 
        string tmp__235 ; 
        tmp__235 = "-" ; 
        $result = tmp__235; 
      } 
; 
binop returns [object result] :
      local__1_binop_case0=SINGLE_BINOP_2 { 
        object tmp__238 ; 
        CommonToken tmp__237 ; 
        CommonToken tmp__236 ; 
        tmp__236 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__237 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__238 = (object) mkop( tmp__236, tmp__237.Text ); 
        $result = tmp__238; 
      } 
    | local__1_binop_case1='not' 'in' { 
        object tmp__241 ; 
        string tmp__240 ; 
        CommonToken tmp__239 ; 
        tmp__239 = ( CommonToken ) _localctx.local__1_binop_case1 ; 
        tmp__240 = "notin" ; 
        tmp__241 = (object) mkop( tmp__239, tmp__240 ); 
        $result = tmp__241; 
      } 
    | local__1_binop_case2='in' { 
        object tmp__244 ; 
        string tmp__243 ; 
        CommonToken tmp__242 ; 
        tmp__242 = ( CommonToken ) _localctx.local__1_binop_case2 ; 
        tmp__243 = "in" ; 
        tmp__244 = (object) mkop( tmp__242, tmp__243 ); 
        $result = tmp__244; 
      } 
    | local__1_binop_case3='-' { 
        object tmp__247 ; 
        string tmp__246 ; 
        CommonToken tmp__245 ; 
        tmp__245 = ( CommonToken ) _localctx.local__1_binop_case3 ; 
        tmp__246 = "-" ; 
        tmp__247 = (object) mkop( tmp__245, tmp__246 ); 
        $result = tmp__247; 
      } 
; 
not returns [ImmediateAST result] :
      local__1_not_case0='not' local__2_not_case0=not { 
        ImmediateAST tmp__250 ; 
        ImmediateAST tmp__249 ; 
        CommonToken tmp__248 ; 
        tmp__248 = ( CommonToken ) _localctx.local__1_not_case0 ; 
        tmp__249 = ( ImmediateAST ) _localctx.local__2_not_case0.result ; 
        tmp__250 = (ImmediateAST) mkNot( tmp__248, tmp__249 ); 
        $result = tmp__250; 
      } 
    | local__1_not_case1=bin { 
        ImmediateAST tmp__251 ; 
        tmp__251 = ( ImmediateAST ) _localctx.local__1_not_case1.result ; 
        $result = tmp__251; 
      } 
; 
and_expr returns [ImmediateAST result] :
      local__1_and_expr_case0=and_expr local__2_and_expr_case0='and' local__3_and_expr_case0=not { 
        ImmediateAST tmp__255 ; 
        ImmediateAST tmp__254 ; 
        ImmediateAST tmp__253 ; 
        CommonToken tmp__252 ; 
        tmp__252 = ( CommonToken ) _localctx.local__2_and_expr_case0 ; 
        tmp__253 = ( ImmediateAST ) _localctx.local__1_and_expr_case0.result ; 
        tmp__254 = ( ImmediateAST ) _localctx.local__3_and_expr_case0.result ; 
        tmp__255 = (ImmediateAST) mkAnd( tmp__252, tmp__253, tmp__254 ); 
        $result = tmp__255; 
      } 
    | local__1_and_expr_case1=not { 
        ImmediateAST tmp__256 ; 
        tmp__256 = ( ImmediateAST ) _localctx.local__1_and_expr_case1.result ; 
        $result = tmp__256; 
      } 
; 
or_expr returns [ImmediateAST result] :
      local__1_or_expr_case0=or_expr local__2_or_expr_case0='or' local__3_or_expr_case0=and_expr { 
        ImmediateAST tmp__260 ; 
        ImmediateAST tmp__259 ; 
        ImmediateAST tmp__258 ; 
        CommonToken tmp__257 ; 
        tmp__257 = ( CommonToken ) _localctx.local__2_or_expr_case0 ; 
        tmp__258 = ( ImmediateAST ) _localctx.local__1_or_expr_case0.result ; 
        tmp__259 = ( ImmediateAST ) _localctx.local__3_or_expr_case0.result ; 
        tmp__260 = (ImmediateAST) mkAnd( tmp__257, tmp__258, tmp__259 ); 
        $result = tmp__260; 
      } 
    | local__1_or_expr_case1=and_expr { 
        ImmediateAST tmp__261 ; 
        tmp__261 = ( ImmediateAST ) _localctx.local__1_or_expr_case1.result ; 
        $result = tmp__261; 
      } 
; 
block returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_block_case0=gen__filter_stmt__gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__262 ; 
        tmp__262 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_block_case0.result ; 
        $result = tmp__262; 
      } 
; 
gen__filter_stmt__gen__or___L59__newline returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__filter_stmt__gen__or___L59__newline_case0=gen__filter_stmt__gen__or___L59__newline local__2_gen__filter_stmt__gen__or___L59__newline_case0=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__265 ; 
        ImmediateAST tmp__264 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__263 ; 
        tmp__263 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case0.result ; 
        tmp__264 = ( ImmediateAST ) _localctx.local__2_gen__filter_stmt__gen__or___L59__newline_case0.result ; 
        tmp__265 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__263, tmp__264 ); 
        $result = tmp__265; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__newline_case1=gen__filter_stmt__gen__or___L59__newline gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__266 ; 
        tmp__266 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case1.result ; 
        $result = tmp__266; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__newline_case2=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__269 ; 
        ImmediateAST tmp__268 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__267 ; 
        tmp__267 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__268 = ( ImmediateAST ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case2.result ; 
        tmp__269 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__267, tmp__268 ); 
        $result = tmp__269; 
      } 
    | gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__270 ; 
        tmp__270 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__270; 
      } 
; 
gen__or___L59__newline returns [int result] :
      ';' { 
        int tmp__271 ; 
        tmp__271 = 0 ; 
        $result = tmp__271; 
      } 
    | newline { 
        int tmp__272 ; 
        tmp__272 = 0 ; 
        $result = tmp__272; 
      } 
; 
lhs returns [ImmediateAST result] :
      local__1_lhs_case0=NAME_13 { 
        ImmediateAST tmp__275 ; 
        CommonToken tmp__274 ; 
        CommonToken tmp__273 ; 
        tmp__273 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__274 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__275 = (ImmediateAST) mkVar( tmp__273, tmp__274.Text ); 
        $result = tmp__275; 
      } 
    | local__1_lhs_case1=atom local__2_lhs_case1='.' '[' local__4_lhs_case1=expr ']' { 
        ImmediateAST tmp__279 ; 
        ImmediateAST tmp__278 ; 
        ImmediateAST tmp__277 ; 
        CommonToken tmp__276 ; 
        tmp__276 = ( CommonToken ) _localctx.local__2_lhs_case1 ; 
        tmp__277 = ( ImmediateAST ) _localctx.local__1_lhs_case1.result ; 
        tmp__278 = ( ImmediateAST ) _localctx.local__4_lhs_case1.result ; 
        tmp__279 = (ImmediateAST) mkOGet( tmp__276, tmp__277, tmp__278 ); 
        $result = tmp__279; 
      } 
    | local__1_lhs_case2=atom local__2_lhs_case2='.' local__3_lhs_case2=NAME_13 { 
        ImmediateAST tmp__286 ; 
        ImmediateAST tmp__285 ; 
        DObj tmp__284 ; 
        CommonToken tmp__283 ; 
        CommonToken tmp__282 ; 
        ImmediateAST tmp__281 ; 
        CommonToken tmp__280 ; 
        tmp__280 = ( CommonToken ) _localctx.local__2_lhs_case2 ; 
        tmp__281 = ( ImmediateAST ) _localctx.local__1_lhs_case2.result ; 
        tmp__282 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__283 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__284 = (DObj) mkstr( tmp__283.Text ); 
        tmp__285 = (ImmediateAST) mkVal( tmp__282, tmp__284 ); 
        tmp__286 = (ImmediateAST) mkOGet( tmp__280, tmp__281, tmp__285 ); 
        $result = tmp__286; 
      } 
; 
do returns [CommonToken result] :
      gen__optional_newline local__2_do_case0='do' { 
        CommonToken tmp__287 ; 
        tmp__287 = ( CommonToken ) _localctx.local__2_do_case0 ; 
        $result = tmp__287; 
      } 
; 
then returns [CommonToken result] :
      gen__optional_newline local__2_then_case0='then' { 
        CommonToken tmp__288 ; 
        tmp__288 = ( CommonToken ) _localctx.local__2_then_case0 ; 
        $result = tmp__288; 
      } 
; 
gen__blockOf_do returns [ImmediateAST result] :
      local__1_gen__blockOf_do_case0=do local__2_gen__blockOf_do_case0=block { 
        ImmediateAST tmp__291 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__290 ; 
        CommonToken tmp__289 ; 
        tmp__289 = ( CommonToken ) _localctx.local__1_gen__blockOf_do_case0.result ; 
        tmp__290 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_do_case0.result ; 
        tmp__291 = (ImmediateAST) mkBlock( tmp__289, tmp__290 ); 
        $result = tmp__291; 
      } 
; 
name returns [string result] :
      local__1_name_case0=NAME_13 { 
        CommonToken tmp__292 ; 
        tmp__292 = ( CommonToken ) _localctx.local__1_name_case0 ; 
        $result = tmp__292.Text; 
      } 
; 
elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      local__1_elifBlock_case0=expr local__2_elifBlock_case0=gen__blockOf_then { 
        ImmediateAST tmp__295 ; 
        ImmediateAST tmp__294 ; 
        (ImmediateAST, ImmediateAST) tmp__293 ; 
        tmp__294 = ( ImmediateAST ) _localctx.local__1_elifBlock_case0.result ; 
        tmp__295 = ( ImmediateAST ) _localctx.local__2_elifBlock_case0.result ; 
        tmp__293 = ( tmp__294 , tmp__295 ); 
        $result = tmp__293; 
      } 
; 
gen__blockOf_then returns [ImmediateAST result] :
      local__1_gen__blockOf_then_case0=then local__2_gen__blockOf_then_case0=block { 
        ImmediateAST tmp__298 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__297 ; 
        CommonToken tmp__296 ; 
        tmp__296 = ( CommonToken ) _localctx.local__1_gen__blockOf_then_case0.result ; 
        tmp__297 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_then_case0.result ; 
        tmp__298 = (ImmediateAST) mkBlock( tmp__296, tmp__297 ); 
        $result = tmp__298; 
      } 
; 
lhs_seq returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_lhs_seq_case0=lhs_seq local__2_lhs_seq_case0=lhs '=' { 
        System.Collections.Generic.List<ImmediateAST> tmp__301 ; 
        ImmediateAST tmp__300 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__299 ; 
        tmp__299 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_lhs_seq_case0.result ; 
        tmp__300 = ( ImmediateAST ) _localctx.local__2_lhs_seq_case0.result ; 
        tmp__301 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__299, tmp__300 ); 
        $result = tmp__301; 
      } 
    | local__1_lhs_seq_case1=lhs '=' { 
        ImmediateAST tmp__303 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__302 ; 
        tmp__303 = ( ImmediateAST ) _localctx.local__1_lhs_seq_case1.result ; 
        tmp__302 = new System.Collections.Generic.List<ImmediateAST> { tmp__303 }; 
        $result = tmp__302; 
      } 
; 
start returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_start_case0=gen__nullable_gen__seplist_newline__stmt gen__optional_newline EOF { 
        System.Collections.Generic.List<ImmediateAST> tmp__304 ; 
        tmp__304 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_start_case0.result ; 
        $result = tmp__304; 
      } 
; 
gen__nullable_gen__seplist_newline__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__nullable_gen__seplist_newline__stmt_case0=gen__seplist_newline__stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__305 ; 
        tmp__305 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist_newline__stmt_case0.result ; 
        $result = tmp__305; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__306 ; 
        tmp__306 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__306; 
      } 
; 
gen__seplist_newline__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_newline__stmt_case0=stmt { 
        ImmediateAST tmp__308 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__307 ; 
        tmp__308 = ( ImmediateAST ) _localctx.local__1_gen__seplist_newline__stmt_case0.result ; 
        tmp__307 = new System.Collections.Generic.List<ImmediateAST> { tmp__308 }; 
        $result = tmp__307; 
      } 
    | local__1_gen__seplist_newline__stmt_case1=gen__seplist_newline__stmt newline local__3_gen__seplist_newline__stmt_case1=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__311 ; 
        ImmediateAST tmp__310 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__309 ; 
        tmp__309 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_newline__stmt_case1.result ; 
        tmp__310 = ( ImmediateAST ) _localctx.local__3_gen__seplist_newline__stmt_case1.result ; 
        tmp__311 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__309, tmp__310 ); 
        $result = tmp__311; 
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
fragment UCODE_12 : [\u0061-\u007A]|[\u0041-\u005A]|'_'|[\u4e00-\u9fa5];
NAME_13 : UCODE_12 (DIGIT_6|UCODE_12)*;
WS_INLINE_14 : (' '|'\t')+ -> skip;
fragment CR_15 : '\r';
fragment LF_16 : '\n';
NEWLINE_17 : (CR_15? LF_16)+ (WS_INLINE_14|(CR_15? LF_16))*;


