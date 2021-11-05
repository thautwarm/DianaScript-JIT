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
    | local__1_atom_case2=atom local__2_atom_case2='(' local__3_atom_case2=gen__closelist__L44__expr ')' { 
        ImmediateAST tmp__71 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__70 ; 
        ImmediateAST tmp__69 ; 
        CommonToken tmp__68 ; 
        tmp__68 = ( CommonToken ) _localctx.local__2_atom_case2 ; 
        tmp__69 = ( ImmediateAST ) _localctx.local__1_atom_case2.result ; 
        tmp__70 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__3_atom_case2.result ; 
        tmp__71 = (ImmediateAST) mkApp( tmp__68, tmp__69, tmp__70 ); 
        $result = tmp__71; 
      } 
    | local__1_atom_case3='[' local__2_atom_case3=gen__closelist__L44__expr ']' { 
        ImmediateAST tmp__74 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__73 ; 
        CommonToken tmp__72 ; 
        tmp__72 = ( CommonToken ) _localctx.local__1_atom_case3 ; 
        tmp__73 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case3.result ; 
        tmp__74 = (ImmediateAST) mkList( tmp__72, tmp__73 ); 
        $result = tmp__74; 
      } 
    | local__1_atom_case4='(' local__2_atom_case4=gen__closelist__L44__expr local__3_atom_case4=trailer ')' { 
        ImmediateAST tmp__78 ; 
        bool tmp__77 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__76 ; 
        CommonToken tmp__75 ; 
        tmp__75 = ( CommonToken ) _localctx.local__1_atom_case4 ; 
        tmp__76 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case4.result ; 
        tmp__77 = ( bool ) _localctx.local__3_atom_case4.result ; 
        tmp__78 = (ImmediateAST) mkTuple( tmp__75, tmp__76, tmp__77 ); 
        $result = tmp__78; 
      } 
    | local__1_atom_case5='{' local__2_atom_case5=gen__closelist__L44__pair trailer '}' { 
        ImmediateAST tmp__81 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__80 ; 
        CommonToken tmp__79 ; 
        tmp__79 = ( CommonToken ) _localctx.local__1_atom_case5 ; 
        tmp__80 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case5.result ; 
        tmp__81 = (ImmediateAST) mkDict( tmp__79, tmp__80 ); 
        $result = tmp__81; 
      } 
    | local__1_atom_case6='{' local__2_atom_case6=gen__closelist__L44__expr '}' { 
        ImmediateAST tmp__84 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__83 ; 
        CommonToken tmp__82 ; 
        tmp__82 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__83 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case6.result ; 
        tmp__84 = (ImmediateAST) mkSet( tmp__82, tmp__83 ); 
        $result = tmp__84; 
      } 
    | local__1_atom_case7=STR_4 { 
        ImmediateAST tmp__89 ; 
        DObj tmp__88 ; 
        string tmp__87 ; 
        CommonToken tmp__86 ; 
        CommonToken tmp__85 ; 
        tmp__85 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__86 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__87 = (string) unesc( tmp__86.Text ); 
        tmp__88 = (DObj) mkstr( tmp__87 ); 
        tmp__89 = (ImmediateAST) mkVal( tmp__85, tmp__88 ); 
        $result = tmp__89; 
      } 
    | local__1_atom_case8=INT_10 { 
        ImmediateAST tmp__94 ; 
        DObj tmp__93 ; 
        int tmp__92 ; 
        CommonToken tmp__91 ; 
        CommonToken tmp__90 ; 
        tmp__90 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__91 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__92 = 0 ; 
        tmp__93 = (DObj) mkint( tmp__91.Text, tmp__92 ); 
        tmp__94 = (ImmediateAST) mkVal( tmp__90, tmp__93 ); 
        $result = tmp__94; 
      } 
    | local__1_atom_case9=HEX_7 { 
        ImmediateAST tmp__99 ; 
        DObj tmp__98 ; 
        int tmp__97 ; 
        CommonToken tmp__96 ; 
        CommonToken tmp__95 ; 
        tmp__95 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__96 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__97 = 16 ; 
        tmp__98 = (DObj) mkint( tmp__96.Text, tmp__97 ); 
        tmp__99 = (ImmediateAST) mkVal( tmp__95, tmp__98 ); 
        $result = tmp__99; 
      } 
    | local__1_atom_case10=OCT_8 { 
        ImmediateAST tmp__104 ; 
        DObj tmp__103 ; 
        int tmp__102 ; 
        CommonToken tmp__101 ; 
        CommonToken tmp__100 ; 
        tmp__100 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__101 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__102 = 8 ; 
        tmp__103 = (DObj) mkint( tmp__101.Text, tmp__102 ); 
        tmp__104 = (ImmediateAST) mkVal( tmp__100, tmp__103 ); 
        $result = tmp__104; 
      } 
    | local__1_atom_case11=BIN_9 { 
        ImmediateAST tmp__109 ; 
        DObj tmp__108 ; 
        int tmp__107 ; 
        CommonToken tmp__106 ; 
        CommonToken tmp__105 ; 
        tmp__105 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__106 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__107 = 2 ; 
        tmp__108 = (DObj) mkint( tmp__106.Text, tmp__107 ); 
        tmp__109 = (ImmediateAST) mkVal( tmp__105, tmp__108 ); 
        $result = tmp__109; 
      } 
    | local__1_atom_case12=FLOAT_11 { 
        ImmediateAST tmp__113 ; 
        DObj tmp__112 ; 
        CommonToken tmp__111 ; 
        CommonToken tmp__110 ; 
        tmp__110 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__111 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__112 = (DObj) mkfloat( tmp__111.Text ); 
        tmp__113 = (ImmediateAST) mkVal( tmp__110, tmp__112 ); 
        $result = tmp__113; 
      } 
    | local__1_atom_case13='None' { 
        ImmediateAST tmp__116 ; 
        DObj tmp__115 ; 
        CommonToken tmp__114 ; 
        tmp__114 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__115 = (DObj) mknone(  ); 
        tmp__116 = (ImmediateAST) mkVal( tmp__114, tmp__115 ); 
        $result = tmp__116; 
      } 
    | local__1_atom_case14=NAME_13 { 
        ImmediateAST tmp__119 ; 
        CommonToken tmp__118 ; 
        CommonToken tmp__117 ; 
        tmp__117 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__118 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__119 = (ImmediateAST) mkVar( tmp__117, tmp__118.Text ); 
        $result = tmp__119; 
      } 
    | local__1_atom_case15='-' local__2_atom_case15=atom { 
        ImmediateAST tmp__122 ; 
        ImmediateAST tmp__121 ; 
        CommonToken tmp__120 ; 
        tmp__120 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__121 = ( ImmediateAST ) _localctx.local__2_atom_case15.result ; 
        tmp__122 = (ImmediateAST) mkNeg( tmp__120, tmp__121 ); 
        $result = tmp__122; 
      } 
    | local__1_atom_case16='~' local__2_atom_case16=atom { 
        ImmediateAST tmp__125 ; 
        ImmediateAST tmp__124 ; 
        CommonToken tmp__123 ; 
        tmp__123 = ( CommonToken ) _localctx.local__1_atom_case16 ; 
        tmp__124 = ( ImmediateAST ) _localctx.local__2_atom_case16.result ; 
        tmp__125 = (ImmediateAST) mkInv( tmp__123, tmp__124 ); 
        $result = tmp__125; 
      } 
    | local__1_atom_case17='if' local__2_atom_case17=expr local__3_atom_case17=then local__4_atom_case17=block 'end' { 
        ImmediateAST tmp__131 ; 
        ImmediateAST tmp__130 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__129 ; 
        CommonToken tmp__128 ; 
        ImmediateAST tmp__127 ; 
        CommonToken tmp__126 ; 
        tmp__126 = ( CommonToken ) _localctx.local__1_atom_case17 ; 
        tmp__127 = ( ImmediateAST ) _localctx.local__2_atom_case17.result ; 
        tmp__128 = ( CommonToken ) _localctx.local__3_atom_case17.result ; 
        tmp__129 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case17.result ; 
        tmp__130 = (ImmediateAST) mkBlock( tmp__128, tmp__129 ); 
        tmp__131 = (ImmediateAST) mkIfThen( tmp__126, tmp__127, tmp__130 ); 
        $result = tmp__131; 
      } 
    | local__1_atom_case18='if' local__2_atom_case18=expr local__3_atom_case18=then local__4_atom_case18=block local__5_atom_case18=gen__nullable_gen__list_gen__snd_elif__elifBlock local__6_atom_case18=gen__optional_gen__blockOf_else 'end' { 
        ImmediateAST tmp__143 ; 
        ImmediateAST tmp__142 ; 
        CommonToken tmp__141 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__139 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__140 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__137 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__138 ; 
        ImmediateAST tmp__136 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__135 ; 
        CommonToken tmp__134 ; 
        ImmediateAST tmp__133 ; 
        (ImmediateAST, ImmediateAST) elif__132 ; 
        tmp__133 = ( ImmediateAST ) _localctx.local__2_atom_case18.result ; 
        tmp__134 = ( CommonToken ) _localctx.local__3_atom_case18.result ; 
        tmp__135 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case18.result ; 
        tmp__136 = (ImmediateAST) mkBlock( tmp__134, tmp__135 ); 
        elif__132 = ( tmp__133 , tmp__136 ); 
        tmp__138 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        elifs__137 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__138, elif__132 ); 
        tmp__140 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__5_atom_case18.result ; 
        elifs__139 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) extend<(ImmediateAST, ImmediateAST)>( elifs__137, tmp__140 ); 
        tmp__141 = ( CommonToken ) _localctx.local__1_atom_case18 ; 
        tmp__142 = ( ImmediateAST ) _localctx.local__6_atom_case18.result ; 
        tmp__143 = (ImmediateAST) mkNestedIf( tmp__141, elifs__137, tmp__142 ); 
        $result = tmp__143; 
      } 
    | local__1_atom_case19='fun' local__2_atom_case19=name '(' local__4_atom_case19=gen__nullable_gen__seplist__L44__name ')' local__6_atom_case19=block 'end' { 
        ImmediateAST tmp__148 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__147 ; 
        System.Collections.Generic.List<string> tmp__146 ; 
        string tmp__145 ; 
        CommonToken tmp__144 ; 
        tmp__144 = ( CommonToken ) _localctx.local__1_atom_case19 ; 
        tmp__145 = ( string ) _localctx.local__2_atom_case19.result ; 
        tmp__146 = ( System.Collections.Generic.List<string> ) _localctx.local__4_atom_case19.result ; 
        tmp__147 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__6_atom_case19.result ; 
        tmp__148 = (ImmediateAST) mkFunc( tmp__144, tmp__145, tmp__146, tmp__147 ); 
        $result = tmp__148; 
      } 
    | local__1_atom_case20='fun' '(' local__3_atom_case20=gen__nullable_gen__seplist__L44__name ')' local__5_atom_case20=block 'end' { 
        ImmediateAST tmp__153 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__152 ; 
        System.Collections.Generic.List<string> tmp__151 ; 
        string tmp__150 ; 
        CommonToken tmp__149 ; 
        tmp__149 = ( CommonToken ) _localctx.local__1_atom_case20 ; 
        tmp__150 = "" ; 
        tmp__151 = ( System.Collections.Generic.List<string> ) _localctx.local__3_atom_case20.result ; 
        tmp__152 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__5_atom_case20.result ; 
        tmp__153 = (ImmediateAST) mkFunc( tmp__149, tmp__150, tmp__151, tmp__152 ); 
        $result = tmp__153; 
      } 
    | local__1_atom_case21='(' local__2_atom_case21=gen__nullable_gen__seplist__L44__name ')' '->' local__5_atom_case21=gen__line_wrap_expr { 
        ImmediateAST tmp__159 ; 
        ImmediateAST tmp__158 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__157 ; 
        System.Collections.Generic.List<string> tmp__156 ; 
        string tmp__155 ; 
        CommonToken tmp__154 ; 
        tmp__154 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__155 = "" ; 
        tmp__156 = ( System.Collections.Generic.List<string> ) _localctx.local__2_atom_case21.result ; 
        tmp__158 = ( ImmediateAST ) _localctx.local__5_atom_case21.result ; 
        tmp__157 = new System.Collections.Generic.List<ImmediateAST> { tmp__158 }; 
        tmp__159 = (ImmediateAST) mkFunc( tmp__154, tmp__155, tmp__156, tmp__157 ); 
        $result = tmp__159; 
      } 
    | local__1_atom_case22=NAME_13 '->' local__3_atom_case22=gen__line_wrap_expr { 
        ImmediateAST tmp__166 ; 
        ImmediateAST tmp__165 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__164 ; 
        CommonToken tmp__163 ; 
        System.Collections.Generic.List<string> tmp__162 ; 
        string tmp__161 ; 
        CommonToken tmp__160 ; 
        tmp__160 = ( CommonToken ) _localctx.local__1_atom_case22 ; 
        tmp__161 = "" ; 
        tmp__163 = ( CommonToken ) _localctx.local__1_atom_case22 ; 
        tmp__162 = new System.Collections.Generic.List<string> { tmp__163.Text }; 
        tmp__165 = ( ImmediateAST ) _localctx.local__3_atom_case22.result ; 
        tmp__164 = new System.Collections.Generic.List<ImmediateAST> { tmp__165 }; 
        tmp__166 = (ImmediateAST) mkFunc( tmp__160, tmp__161, tmp__162, tmp__164 ); 
        $result = tmp__166; 
      } 
; 
gen__line_wrap_expr returns [ImmediateAST result] :
      gen__optional_newline local__2_gen__line_wrap_expr_case0=expr gen__optional_newline { 
        ImmediateAST tmp__167 ; 
        tmp__167 = ( ImmediateAST ) _localctx.local__2_gen__line_wrap_expr_case0.result ; 
        $result = tmp__167; 
      } 
; 
gen__nullable_gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__nullable_gen__seplist__L44__name_case0=gen__seplist__L44__name { 
        System.Collections.Generic.List<string> tmp__168 ; 
        tmp__168 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__nullable_gen__seplist__L44__name_case0.result ; 
        $result = tmp__168; 
      } 
    | { 
        System.Collections.Generic.List<string> tmp__169 ; 
        tmp__169 = (System.Collections.Generic.List<string>) empty<string>(  ); 
        $result = tmp__169; 
      } 
; 
gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__seplist__L44__name_case0=name { 
        string tmp__171 ; 
        System.Collections.Generic.List<string> tmp__170 ; 
        tmp__171 = ( string ) _localctx.local__1_gen__seplist__L44__name_case0.result ; 
        tmp__170 = new System.Collections.Generic.List<string> { tmp__171 }; 
        $result = tmp__170; 
      } 
    | local__1_gen__seplist__L44__name_case1=gen__seplist__L44__name ',' local__3_gen__seplist__L44__name_case1=name { 
        System.Collections.Generic.List<string> tmp__174 ; 
        string tmp__173 ; 
        System.Collections.Generic.List<string> tmp__172 ; 
        tmp__172 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__seplist__L44__name_case1.result ; 
        tmp__173 = ( string ) _localctx.local__3_gen__seplist__L44__name_case1.result ; 
        tmp__174 = (System.Collections.Generic.List<string>) append<string>( tmp__172, tmp__173 ); 
        $result = tmp__174; 
      } 
; 
gen__optional_gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__optional_gen__blockOf_else_case0=gen__blockOf_else { 
        ImmediateAST tmp__175 ; 
        tmp__175 = ( ImmediateAST ) _localctx.local__1_gen__optional_gen__blockOf_else_case0.result ; 
        $result = tmp__175; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__blockOf_else_case0='else' local__2_gen__blockOf_else_case0=block { 
        ImmediateAST tmp__178 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__177 ; 
        CommonToken tmp__176 ; 
        tmp__176 = ( CommonToken ) _localctx.local__1_gen__blockOf_else_case0 ; 
        tmp__177 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_else_case0.result ; 
        tmp__178 = (ImmediateAST) mkBlock( tmp__176, tmp__177 ); 
        $result = tmp__178; 
      } 
; 
gen__nullable_gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0=gen__list_gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__179 ; 
        tmp__179 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__179; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__180 ; 
        tmp__180 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__180; 
      } 
; 
gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__list_gen__snd_elif__elifBlock_case0=gen__snd_elif__elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__182 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__181 ; 
        tmp__182 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        tmp__181 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__182 }; 
        $result = tmp__181; 
      } 
    | local__1_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock local__2_gen__list_gen__snd_elif__elifBlock_case1=gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__185 ; 
        (ImmediateAST, ImmediateAST) tmp__184 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__183 ; 
        tmp__183 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__184 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__185 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__183, tmp__184 ); 
        $result = tmp__185; 
      } 
; 
gen__snd_elif__elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      'elif' local__2_gen__snd_elif__elifBlock_case0=elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__186 ; 
        tmp__186 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__186; 
      } 
; 
gen__closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      gen__optional_newline local__2_gen__closelist__L44__pair_case0=gen___closelist__L44__pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__187 ; 
        tmp__187 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_gen__closelist__L44__pair_case0.result ; 
        $result = tmp__187; 
      } 
; 
gen___closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen___closelist__L44__pair_case0=gen___closelist__L44__pair newline { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__188 ; 
        tmp__188 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case0.result ; 
        $result = tmp__188; 
      } 
    | local__1_gen___closelist__L44__pair_case1=gen___closelist__L44__pair ',' newline local__4_gen___closelist__L44__pair_case1=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__191 ; 
        (ImmediateAST, ImmediateAST) tmp__190 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__189 ; 
        tmp__189 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case1.result ; 
        tmp__190 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__4_gen___closelist__L44__pair_case1.result ; 
        tmp__191 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__189, tmp__190 ); 
        $result = tmp__191; 
      } 
    | local__1_gen___closelist__L44__pair_case2=gen___closelist__L44__pair ',' local__3_gen___closelist__L44__pair_case2=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__194 ; 
        (ImmediateAST, ImmediateAST) tmp__193 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__192 ; 
        tmp__192 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case2.result ; 
        tmp__193 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__3_gen___closelist__L44__pair_case2.result ; 
        tmp__194 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__192, tmp__193 ); 
        $result = tmp__194; 
      } 
    | local__1_gen___closelist__L44__pair_case3=pair { 
        (ImmediateAST, ImmediateAST) tmp__196 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__195 ; 
        tmp__196 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen___closelist__L44__pair_case3.result ; 
        tmp__195 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__196 }; 
        $result = tmp__195; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__197 ; 
        tmp__197 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { }; 
        $result = tmp__197; 
      } 
; 
gen__closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_gen__closelist__L44__expr_case0=gen___closelist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__198 ; 
        tmp__198 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__closelist__L44__expr_case0.result ; 
        $result = tmp__198; 
      } 
; 
gen___closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen___closelist__L44__expr_case0=gen___closelist__L44__expr newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__199 ; 
        tmp__199 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case0.result ; 
        $result = tmp__199; 
      } 
    | local__1_gen___closelist__L44__expr_case1=gen___closelist__L44__expr ',' newline local__4_gen___closelist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__202 ; 
        ImmediateAST tmp__201 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__200 ; 
        tmp__200 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case1.result ; 
        tmp__201 = ( ImmediateAST ) _localctx.local__4_gen___closelist__L44__expr_case1.result ; 
        tmp__202 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__200, tmp__201 ); 
        $result = tmp__202; 
      } 
    | local__1_gen___closelist__L44__expr_case2=gen___closelist__L44__expr ',' local__3_gen___closelist__L44__expr_case2=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__205 ; 
        ImmediateAST tmp__204 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__203 ; 
        tmp__203 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case2.result ; 
        tmp__204 = ( ImmediateAST ) _localctx.local__3_gen___closelist__L44__expr_case2.result ; 
        tmp__205 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__203, tmp__204 ); 
        $result = tmp__205; 
      } 
    | local__1_gen___closelist__L44__expr_case3=expr { 
        ImmediateAST tmp__207 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__206 ; 
        tmp__207 = ( ImmediateAST ) _localctx.local__1_gen___closelist__L44__expr_case3.result ; 
        tmp__206 = new System.Collections.Generic.List<ImmediateAST> { tmp__207 }; 
        $result = tmp__206; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__208 ; 
        tmp__208 = new System.Collections.Generic.List<ImmediateAST> { }; 
        $result = tmp__208; 
      } 
; 
pair returns [(ImmediateAST, ImmediateAST) result] :
      local__1_pair_case0=expr gen__line_wrap__L58 local__3_pair_case0=expr { 
        ImmediateAST tmp__211 ; 
        ImmediateAST tmp__210 ; 
        (ImmediateAST, ImmediateAST) tmp__209 ; 
        tmp__210 = ( ImmediateAST ) _localctx.local__1_pair_case0.result ; 
        tmp__211 = ( ImmediateAST ) _localctx.local__3_pair_case0.result ; 
        tmp__209 = ( tmp__210 , tmp__211 ); 
        $result = tmp__209; 
      } 
; 
gen__line_wrap__L58 returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap__L58_case0=':' gen__optional_newline { 
        CommonToken tmp__212 ; 
        tmp__212 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L58_case0 ; 
        $result = tmp__212; 
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
        ImmediateAST tmp__214 ; 
        System.Collections.Generic.List<object> tmp__213 ; 
        tmp__213 = ( System.Collections.Generic.List<object> ) _localctx.local__1_bin_case0.result ; 
        tmp__214 = (ImmediateAST) resolve_binop( tmp__213 ); 
        $result = tmp__214; 
      } 
; 
binseq returns [System.Collections.Generic.List<object> result] :
      local__1_binseq_case0=atom { 
        System.Collections.Generic.List<object> tmp__218 ; 
        object tmp__217 ; 
        ImmediateAST tmp__216 ; 
        System.Collections.Generic.List<object> tmp__215 ; 
        tmp__215 = (System.Collections.Generic.List<object>) empty<object>(  ); 
        tmp__216 = ( ImmediateAST ) _localctx.local__1_binseq_case0.result ; 
        tmp__217 = (object) to_obj<ImmediateAST>( tmp__216 ); 
        tmp__218 = (System.Collections.Generic.List<object>) append<object>( tmp__215, tmp__217 ); 
        $result = tmp__218; 
      } 
    | local__1_binseq_case1=binseq local__2_binseq_case1=binop local__3_binseq_case1=atom { 
        object tmp__224 ; 
        ImmediateAST tmp__223 ; 
        System.Collections.Generic.List<object> tmp__222 ; 
        System.Collections.Generic.List<object> block__219 ; 
        object tmp__221 ; 
        System.Collections.Generic.List<object> tmp__220 ; 
        tmp__220 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__221 = ( object ) _localctx.local__2_binseq_case1.result ; 
        block__219 = (System.Collections.Generic.List<object>) append<object>( tmp__220, tmp__221 ); 
        tmp__222 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__223 = ( ImmediateAST ) _localctx.local__3_binseq_case1.result ; 
        tmp__224 = (object) to_obj<ImmediateAST>( tmp__223 ); 
        block__219 = (System.Collections.Generic.List<object>) append<object>( tmp__222, tmp__224 ); 
        $result = block__219; 
      } 
; 
ibinop returns [string result] :
      local__1_ibinop_case0=SINGLE_BINOP_2 { 
        CommonToken tmp__225 ; 
        tmp__225 = ( CommonToken ) _localctx.local__1_ibinop_case0 ; 
        $result = tmp__225.Text; 
      } 
    | '-' { 
        string tmp__226 ; 
        tmp__226 = "-" ; 
        $result = tmp__226; 
      } 
; 
binop returns [object result] :
      local__1_binop_case0=SINGLE_BINOP_2 { 
        object tmp__229 ; 
        CommonToken tmp__228 ; 
        CommonToken tmp__227 ; 
        tmp__227 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__228 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__229 = (object) mkop( tmp__227, tmp__228.Text ); 
        $result = tmp__229; 
      } 
    | local__1_binop_case1='not' 'in' { 
        object tmp__232 ; 
        string tmp__231 ; 
        CommonToken tmp__230 ; 
        tmp__230 = ( CommonToken ) _localctx.local__1_binop_case1 ; 
        tmp__231 = "notin" ; 
        tmp__232 = (object) mkop( tmp__230, tmp__231 ); 
        $result = tmp__232; 
      } 
    | local__1_binop_case2='in' { 
        object tmp__235 ; 
        string tmp__234 ; 
        CommonToken tmp__233 ; 
        tmp__233 = ( CommonToken ) _localctx.local__1_binop_case2 ; 
        tmp__234 = "in" ; 
        tmp__235 = (object) mkop( tmp__233, tmp__234 ); 
        $result = tmp__235; 
      } 
    | local__1_binop_case3='-' { 
        object tmp__238 ; 
        string tmp__237 ; 
        CommonToken tmp__236 ; 
        tmp__236 = ( CommonToken ) _localctx.local__1_binop_case3 ; 
        tmp__237 = "-" ; 
        tmp__238 = (object) mkop( tmp__236, tmp__237 ); 
        $result = tmp__238; 
      } 
; 
not returns [ImmediateAST result] :
      local__1_not_case0='not' local__2_not_case0=not { 
        ImmediateAST tmp__241 ; 
        ImmediateAST tmp__240 ; 
        CommonToken tmp__239 ; 
        tmp__239 = ( CommonToken ) _localctx.local__1_not_case0 ; 
        tmp__240 = ( ImmediateAST ) _localctx.local__2_not_case0.result ; 
        tmp__241 = (ImmediateAST) mkNot( tmp__239, tmp__240 ); 
        $result = tmp__241; 
      } 
    | local__1_not_case1=bin { 
        ImmediateAST tmp__242 ; 
        tmp__242 = ( ImmediateAST ) _localctx.local__1_not_case1.result ; 
        $result = tmp__242; 
      } 
; 
and_expr returns [ImmediateAST result] :
      local__1_and_expr_case0=and_expr local__2_and_expr_case0='and' local__3_and_expr_case0=not { 
        ImmediateAST tmp__246 ; 
        ImmediateAST tmp__245 ; 
        ImmediateAST tmp__244 ; 
        CommonToken tmp__243 ; 
        tmp__243 = ( CommonToken ) _localctx.local__2_and_expr_case0 ; 
        tmp__244 = ( ImmediateAST ) _localctx.local__1_and_expr_case0.result ; 
        tmp__245 = ( ImmediateAST ) _localctx.local__3_and_expr_case0.result ; 
        tmp__246 = (ImmediateAST) mkAnd( tmp__243, tmp__244, tmp__245 ); 
        $result = tmp__246; 
      } 
    | local__1_and_expr_case1=not { 
        ImmediateAST tmp__247 ; 
        tmp__247 = ( ImmediateAST ) _localctx.local__1_and_expr_case1.result ; 
        $result = tmp__247; 
      } 
; 
or_expr returns [ImmediateAST result] :
      local__1_or_expr_case0=or_expr local__2_or_expr_case0='or' local__3_or_expr_case0=and_expr { 
        ImmediateAST tmp__251 ; 
        ImmediateAST tmp__250 ; 
        ImmediateAST tmp__249 ; 
        CommonToken tmp__248 ; 
        tmp__248 = ( CommonToken ) _localctx.local__2_or_expr_case0 ; 
        tmp__249 = ( ImmediateAST ) _localctx.local__1_or_expr_case0.result ; 
        tmp__250 = ( ImmediateAST ) _localctx.local__3_or_expr_case0.result ; 
        tmp__251 = (ImmediateAST) mkOr( tmp__248, tmp__249, tmp__250 ); 
        $result = tmp__251; 
      } 
    | local__1_or_expr_case1=and_expr { 
        ImmediateAST tmp__252 ; 
        tmp__252 = ( ImmediateAST ) _localctx.local__1_or_expr_case1.result ; 
        $result = tmp__252; 
      } 
; 
block returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_block_case0=gen__filter_stmt__gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__253 ; 
        tmp__253 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_block_case0.result ; 
        $result = tmp__253; 
      } 
; 
gen__filter_stmt__gen__or___L59__newline returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__filter_stmt__gen__or___L59__newline_case0=gen__filter_stmt__gen__or___L59__newline local__2_gen__filter_stmt__gen__or___L59__newline_case0=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__256 ; 
        ImmediateAST tmp__255 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__254 ; 
        tmp__254 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case0.result ; 
        tmp__255 = ( ImmediateAST ) _localctx.local__2_gen__filter_stmt__gen__or___L59__newline_case0.result ; 
        tmp__256 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__254, tmp__255 ); 
        $result = tmp__256; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__newline_case1=gen__filter_stmt__gen__or___L59__newline gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__257 ; 
        tmp__257 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case1.result ; 
        $result = tmp__257; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__newline_case2=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__260 ; 
        ImmediateAST tmp__259 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__258 ; 
        tmp__258 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__259 = ( ImmediateAST ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case2.result ; 
        tmp__260 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__258, tmp__259 ); 
        $result = tmp__260; 
      } 
    | gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__261 ; 
        tmp__261 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__261; 
      } 
; 
gen__or___L59__newline returns [int result] :
      ';' { 
        int tmp__262 ; 
        tmp__262 = 0 ; 
        $result = tmp__262; 
      } 
    | newline { 
        int tmp__263 ; 
        tmp__263 = 0 ; 
        $result = tmp__263; 
      } 
; 
lhs returns [ImmediateAST result] :
      local__1_lhs_case0=NAME_13 { 
        ImmediateAST tmp__266 ; 
        CommonToken tmp__265 ; 
        CommonToken tmp__264 ; 
        tmp__264 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__265 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__266 = (ImmediateAST) mkVar( tmp__264, tmp__265.Text ); 
        $result = tmp__266; 
      } 
    | local__1_lhs_case1=atom local__2_lhs_case1='.' '[' local__4_lhs_case1=expr ']' { 
        ImmediateAST tmp__270 ; 
        ImmediateAST tmp__269 ; 
        ImmediateAST tmp__268 ; 
        CommonToken tmp__267 ; 
        tmp__267 = ( CommonToken ) _localctx.local__2_lhs_case1 ; 
        tmp__268 = ( ImmediateAST ) _localctx.local__1_lhs_case1.result ; 
        tmp__269 = ( ImmediateAST ) _localctx.local__4_lhs_case1.result ; 
        tmp__270 = (ImmediateAST) mkOGet( tmp__267, tmp__268, tmp__269 ); 
        $result = tmp__270; 
      } 
    | local__1_lhs_case2=atom local__2_lhs_case2='.' local__3_lhs_case2=NAME_13 { 
        ImmediateAST tmp__277 ; 
        ImmediateAST tmp__276 ; 
        DObj tmp__275 ; 
        CommonToken tmp__274 ; 
        CommonToken tmp__273 ; 
        ImmediateAST tmp__272 ; 
        CommonToken tmp__271 ; 
        tmp__271 = ( CommonToken ) _localctx.local__2_lhs_case2 ; 
        tmp__272 = ( ImmediateAST ) _localctx.local__1_lhs_case2.result ; 
        tmp__273 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__274 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__275 = (DObj) mkstr( tmp__274.Text ); 
        tmp__276 = (ImmediateAST) mkVal( tmp__273, tmp__275 ); 
        tmp__277 = (ImmediateAST) mkOGet( tmp__271, tmp__272, tmp__276 ); 
        $result = tmp__277; 
      } 
; 
do returns [CommonToken result] :
      gen__optional_newline local__2_do_case0='do' { 
        CommonToken tmp__278 ; 
        tmp__278 = ( CommonToken ) _localctx.local__2_do_case0 ; 
        $result = tmp__278; 
      } 
; 
then returns [CommonToken result] :
      gen__optional_newline local__2_then_case0='then' { 
        CommonToken tmp__279 ; 
        tmp__279 = ( CommonToken ) _localctx.local__2_then_case0 ; 
        $result = tmp__279; 
      } 
; 
gen__blockOf_do returns [ImmediateAST result] :
      local__1_gen__blockOf_do_case0=do local__2_gen__blockOf_do_case0=block { 
        ImmediateAST tmp__282 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__281 ; 
        CommonToken tmp__280 ; 
        tmp__280 = ( CommonToken ) _localctx.local__1_gen__blockOf_do_case0.result ; 
        tmp__281 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_do_case0.result ; 
        tmp__282 = (ImmediateAST) mkBlock( tmp__280, tmp__281 ); 
        $result = tmp__282; 
      } 
; 
name returns [string result] :
      local__1_name_case0=NAME_13 { 
        CommonToken tmp__283 ; 
        tmp__283 = ( CommonToken ) _localctx.local__1_name_case0 ; 
        $result = tmp__283.Text; 
      } 
; 
elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      local__1_elifBlock_case0=expr local__2_elifBlock_case0=gen__blockOf_then { 
        ImmediateAST tmp__286 ; 
        ImmediateAST tmp__285 ; 
        (ImmediateAST, ImmediateAST) tmp__284 ; 
        tmp__285 = ( ImmediateAST ) _localctx.local__1_elifBlock_case0.result ; 
        tmp__286 = ( ImmediateAST ) _localctx.local__2_elifBlock_case0.result ; 
        tmp__284 = ( tmp__285 , tmp__286 ); 
        $result = tmp__284; 
      } 
; 
gen__blockOf_then returns [ImmediateAST result] :
      local__1_gen__blockOf_then_case0=then local__2_gen__blockOf_then_case0=block { 
        ImmediateAST tmp__289 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__288 ; 
        CommonToken tmp__287 ; 
        tmp__287 = ( CommonToken ) _localctx.local__1_gen__blockOf_then_case0.result ; 
        tmp__288 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_then_case0.result ; 
        tmp__289 = (ImmediateAST) mkBlock( tmp__287, tmp__288 ); 
        $result = tmp__289; 
      } 
; 
lhs_seq returns [System.Collections.Generic.List<(ImmediateAST, string)> result] :
      local__1_lhs_seq_case0=lhs_seq local__2_lhs_seq_case0=lhs local__3_lhs_seq_case0=gen__optional_ibinop '=' { 
        System.Collections.Generic.List<(ImmediateAST, string)> tmp__294 ; 
        string tmp__293 ; 
        ImmediateAST tmp__292 ; 
        (ImmediateAST, string) tmp__291 ; 
        System.Collections.Generic.List<(ImmediateAST, string)> tmp__290 ; 
        tmp__290 = ( System.Collections.Generic.List<(ImmediateAST, string)> ) _localctx.local__1_lhs_seq_case0.result ; 
        tmp__292 = ( ImmediateAST ) _localctx.local__2_lhs_seq_case0.result ; 
        tmp__293 = ( string ) _localctx.local__3_lhs_seq_case0.result ; 
        tmp__291 = ( tmp__292 , tmp__293 ); 
        tmp__294 = (System.Collections.Generic.List<(ImmediateAST, string)>) append<(ImmediateAST, string)>( tmp__290, tmp__291 ); 
        $result = tmp__294; 
      } 
    | local__1_lhs_seq_case1=lhs local__2_lhs_seq_case1=gen__optional_ibinop '=' { 
        string tmp__298 ; 
        ImmediateAST tmp__297 ; 
        (ImmediateAST, string) tmp__296 ; 
        System.Collections.Generic.List<(ImmediateAST, string)> tmp__295 ; 
        tmp__297 = ( ImmediateAST ) _localctx.local__1_lhs_seq_case1.result ; 
        tmp__298 = ( string ) _localctx.local__2_lhs_seq_case1.result ; 
        tmp__296 = ( tmp__297 , tmp__298 ); 
        tmp__295 = new System.Collections.Generic.List<(ImmediateAST, string)> { tmp__296 }; 
        $result = tmp__295; 
      } 
; 
gen__optional_ibinop returns [string result] :
      local__1_gen__optional_ibinop_case0=ibinop { 
        string tmp__299 ; 
        tmp__299 = ( string ) _localctx.local__1_gen__optional_ibinop_case0.result ; 
        $result = tmp__299; 
      } 
    | { 
        $result = null; 
      } 
; 
start returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_start_case0=gen__nullable_gen__seplist_newline__stmt gen__optional_newline EOF { 
        System.Collections.Generic.List<ImmediateAST> tmp__300 ; 
        tmp__300 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_start_case0.result ; 
        $result = tmp__300; 
      } 
; 
gen__nullable_gen__seplist_newline__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__nullable_gen__seplist_newline__stmt_case0=gen__seplist_newline__stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__301 ; 
        tmp__301 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist_newline__stmt_case0.result ; 
        $result = tmp__301; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__302 ; 
        tmp__302 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__302; 
      } 
; 
gen__seplist_newline__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_newline__stmt_case0=stmt { 
        ImmediateAST tmp__304 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__303 ; 
        tmp__304 = ( ImmediateAST ) _localctx.local__1_gen__seplist_newline__stmt_case0.result ; 
        tmp__303 = new System.Collections.Generic.List<ImmediateAST> { tmp__304 }; 
        $result = tmp__303; 
      } 
    | local__1_gen__seplist_newline__stmt_case1=gen__seplist_newline__stmt newline local__3_gen__seplist_newline__stmt_case1=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__307 ; 
        ImmediateAST tmp__306 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__305 ; 
        tmp__305 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_newline__stmt_case1.result ; 
        tmp__306 = ( ImmediateAST ) _localctx.local__3_gen__seplist_newline__stmt_case1.result ; 
        tmp__307 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__305, tmp__306 ); 
        $result = tmp__307; 
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


