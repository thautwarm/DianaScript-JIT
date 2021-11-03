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
    | local__1_stmt_case3=lhs_seq local__2_stmt_case3=expr { 
        ImmediateAST tmp__21 ; 
        ImmediateAST tmp__20 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__19 ; 
        tmp__19 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_stmt_case3.result ; 
        tmp__20 = ( ImmediateAST ) _localctx.local__2_stmt_case3.result ; 
        tmp__21 = (ImmediateAST) mkStoreMany( tmp__19, tmp__20 ); 
        $result = tmp__21; 
      } 
    | local__1_stmt_case4='loop' local__2_stmt_case4=block 'end' { 
        ImmediateAST tmp__26 ; 
        ImmediateAST tmp__25 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__24 ; 
        CommonToken tmp__23 ; 
        CommonToken tmp__22 ; 
        tmp__22 = ( CommonToken ) _localctx.local__1_stmt_case4 ; 
        tmp__23 = ( CommonToken ) _localctx.local__1_stmt_case4 ; 
        tmp__24 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_stmt_case4.result ; 
        tmp__25 = (ImmediateAST) mkBlock( tmp__23, tmp__24 ); 
        tmp__26 = (ImmediateAST) mkLoop( tmp__22, tmp__25 ); 
        $result = tmp__26; 
      } 
    | local__1_stmt_case5='while' local__2_stmt_case5=expr local__3_stmt_case5=gen__blockOf_do 'end' { 
        ImmediateAST tmp__30 ; 
        ImmediateAST tmp__29 ; 
        ImmediateAST tmp__28 ; 
        CommonToken tmp__27 ; 
        tmp__27 = ( CommonToken ) _localctx.local__1_stmt_case5 ; 
        tmp__28 = ( ImmediateAST ) _localctx.local__2_stmt_case5.result ; 
        tmp__29 = ( ImmediateAST ) _localctx.local__3_stmt_case5.result ; 
        tmp__30 = (ImmediateAST) mkWhile( tmp__27, tmp__28, tmp__29 ); 
        $result = tmp__30; 
      } 
    | local__1_stmt_case6='for' local__2_stmt_case6=NAME_13 'in' local__4_stmt_case6=expr local__5_stmt_case6=gen__blockOf_do 'end' { 
        ImmediateAST tmp__35 ; 
        ImmediateAST tmp__34 ; 
        ImmediateAST tmp__33 ; 
        CommonToken tmp__32 ; 
        CommonToken tmp__31 ; 
        tmp__31 = ( CommonToken ) _localctx.local__1_stmt_case6 ; 
        tmp__32 = ( CommonToken ) _localctx.local__2_stmt_case6 ; 
        tmp__33 = ( ImmediateAST ) _localctx.local__4_stmt_case6.result ; 
        tmp__34 = ( ImmediateAST ) _localctx.local__5_stmt_case6.result ; 
        tmp__35 = (ImmediateAST) mkFor( tmp__31, tmp__32.Text, tmp__33, tmp__34 ); 
        $result = tmp__35; 
      } 
    | local__1_stmt_case7='break' { 
        ImmediateAST tmp__37 ; 
        CommonToken tmp__36 ; 
        tmp__36 = ( CommonToken ) _localctx.local__1_stmt_case7 ; 
        tmp__37 = (ImmediateAST) mkBreak( tmp__36 ); 
        $result = tmp__37; 
      } 
    | local__1_stmt_case8='continue' { 
        ImmediateAST tmp__39 ; 
        CommonToken tmp__38 ; 
        tmp__38 = ( CommonToken ) _localctx.local__1_stmt_case8 ; 
        tmp__39 = (ImmediateAST) mkContinue( tmp__38 ); 
        $result = tmp__39; 
      } 
    | local__1_stmt_case9='return' local__2_stmt_case9=expr { 
        ImmediateAST tmp__42 ; 
        ImmediateAST tmp__41 ; 
        CommonToken tmp__40 ; 
        tmp__40 = ( CommonToken ) _localctx.local__1_stmt_case9 ; 
        tmp__41 = ( ImmediateAST ) _localctx.local__2_stmt_case9.result ; 
        tmp__42 = (ImmediateAST) mkReturn( tmp__40, tmp__41 ); 
        $result = tmp__42; 
      } 
    | local__1_stmt_case10='return' { 
        ImmediateAST tmp__44 ; 
        CommonToken tmp__43 ; 
        tmp__43 = ( CommonToken ) _localctx.local__1_stmt_case10 ; 
        tmp__44 = (ImmediateAST) mkReturn( tmp__43, null ); 
        $result = tmp__44; 
      } 
    | local__1_stmt_case11='var' local__2_stmt_case11=gen__seplist__L44__name { 
        ImmediateAST tmp__47 ; 
        System.Collections.Generic.List<string> tmp__46 ; 
        CommonToken tmp__45 ; 
        tmp__45 = ( CommonToken ) _localctx.local__1_stmt_case11 ; 
        tmp__46 = ( System.Collections.Generic.List<string> ) _localctx.local__2_stmt_case11.result ; 
        tmp__47 = (ImmediateAST) mkDecl( tmp__45, tmp__46 ); 
        $result = tmp__47; 
      } 
    | local__1_stmt_case12=ibin { 
        ImmediateAST tmp__48 ; 
        tmp__48 = ( ImmediateAST ) _localctx.local__1_stmt_case12.result ; 
        $result = tmp__48; 
      } 
    | local__1_stmt_case13=expr { 
        ImmediateAST tmp__49 ; 
        tmp__49 = ( ImmediateAST ) _localctx.local__1_stmt_case13.result ; 
        $result = tmp__49; 
      } 
; 
newline returns [CommonToken result] :
      local__1_newline_case0=NEWLINE_17 { 
        CommonToken tmp__50 ; 
        tmp__50 = ( CommonToken ) _localctx.local__1_newline_case0 ; 
        $result = tmp__50; 
      } 
    | newline local__2_newline_case1=NEWLINE_17 { 
        CommonToken tmp__51 ; 
        tmp__51 = ( CommonToken ) _localctx.local__2_newline_case1 ; 
        $result = tmp__51; 
      } 
; 
atom returns [ImmediateAST result] :
      local__1_atom_case0=atom local__2_atom_case0='.' '[' local__4_atom_case0=expr ']' { 
        ImmediateAST tmp__55 ; 
        ImmediateAST tmp__54 ; 
        ImmediateAST tmp__53 ; 
        CommonToken tmp__52 ; 
        tmp__52 = ( CommonToken ) _localctx.local__2_atom_case0 ; 
        tmp__53 = ( ImmediateAST ) _localctx.local__1_atom_case0.result ; 
        tmp__54 = ( ImmediateAST ) _localctx.local__4_atom_case0.result ; 
        tmp__55 = (ImmediateAST) mkOGet( tmp__52, tmp__53, tmp__54 ); 
        $result = tmp__55; 
      } 
    | local__1_atom_case1=atom local__2_atom_case1='.' local__3_atom_case1=NAME_13 { 
        ImmediateAST tmp__62 ; 
        ImmediateAST tmp__61 ; 
        DObj tmp__60 ; 
        CommonToken tmp__59 ; 
        CommonToken tmp__58 ; 
        ImmediateAST tmp__57 ; 
        CommonToken tmp__56 ; 
        tmp__56 = ( CommonToken ) _localctx.local__2_atom_case1 ; 
        tmp__57 = ( ImmediateAST ) _localctx.local__1_atom_case1.result ; 
        tmp__58 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__59 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__60 = (DObj) mkstr( tmp__59.Text ); 
        tmp__61 = (ImmediateAST) mkVal( tmp__58, tmp__60 ); 
        tmp__62 = (ImmediateAST) mkOGet( tmp__56, tmp__57, tmp__61 ); 
        $result = tmp__62; 
      } 
    | local__1_atom_case2=atom local__2_atom_case2='(' local__3_atom_case2=gen__closelist__L44__expr ')' { 
        ImmediateAST tmp__66 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__65 ; 
        ImmediateAST tmp__64 ; 
        CommonToken tmp__63 ; 
        tmp__63 = ( CommonToken ) _localctx.local__2_atom_case2 ; 
        tmp__64 = ( ImmediateAST ) _localctx.local__1_atom_case2.result ; 
        tmp__65 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__3_atom_case2.result ; 
        tmp__66 = (ImmediateAST) mkApp( tmp__63, tmp__64, tmp__65 ); 
        $result = tmp__66; 
      } 
    | local__1_atom_case3='[' local__2_atom_case3=gen__closelist__L44__expr ']' { 
        ImmediateAST tmp__69 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__68 ; 
        CommonToken tmp__67 ; 
        tmp__67 = ( CommonToken ) _localctx.local__1_atom_case3 ; 
        tmp__68 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case3.result ; 
        tmp__69 = (ImmediateAST) mkList( tmp__67, tmp__68 ); 
        $result = tmp__69; 
      } 
    | local__1_atom_case4='(' local__2_atom_case4=gen__closelist__L44__expr local__3_atom_case4=trailer ')' { 
        ImmediateAST tmp__73 ; 
        bool tmp__72 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__71 ; 
        CommonToken tmp__70 ; 
        tmp__70 = ( CommonToken ) _localctx.local__1_atom_case4 ; 
        tmp__71 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case4.result ; 
        tmp__72 = ( bool ) _localctx.local__3_atom_case4.result ; 
        tmp__73 = (ImmediateAST) mkTuple( tmp__70, tmp__71, tmp__72 ); 
        $result = tmp__73; 
      } 
    | local__1_atom_case5='{|' local__2_atom_case5=gen__closelist__L44__pair trailer '|}' { 
        ImmediateAST tmp__76 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__75 ; 
        CommonToken tmp__74 ; 
        tmp__74 = ( CommonToken ) _localctx.local__1_atom_case5 ; 
        tmp__75 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case5.result ; 
        tmp__76 = (ImmediateAST) mkStrDict( tmp__74, tmp__75 ); 
        $result = tmp__76; 
      } 
    | local__1_atom_case6='{' local__2_atom_case6=gen__closelist__L44__pair trailer '}' { 
        ImmediateAST tmp__79 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__78 ; 
        CommonToken tmp__77 ; 
        tmp__77 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__78 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case6.result ; 
        tmp__79 = (ImmediateAST) mkDict( tmp__77, tmp__78 ); 
        $result = tmp__79; 
      } 
    | local__1_atom_case7='{' local__2_atom_case7=gen__closelist__L44__expr '}' { 
        ImmediateAST tmp__82 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__81 ; 
        CommonToken tmp__80 ; 
        tmp__80 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__81 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case7.result ; 
        tmp__82 = (ImmediateAST) mkSet( tmp__80, tmp__81 ); 
        $result = tmp__82; 
      } 
    | local__1_atom_case8=STR_4 { 
        ImmediateAST tmp__87 ; 
        DObj tmp__86 ; 
        string tmp__85 ; 
        CommonToken tmp__84 ; 
        CommonToken tmp__83 ; 
        tmp__83 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__84 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__85 = (string) unesc( tmp__84.Text ); 
        tmp__86 = (DObj) mkstr( tmp__85 ); 
        tmp__87 = (ImmediateAST) mkVal( tmp__83, tmp__86 ); 
        $result = tmp__87; 
      } 
    | local__1_atom_case9=INT_10 { 
        ImmediateAST tmp__92 ; 
        DObj tmp__91 ; 
        int tmp__90 ; 
        CommonToken tmp__89 ; 
        CommonToken tmp__88 ; 
        tmp__88 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__89 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__90 = 0 ; 
        tmp__91 = (DObj) mkint( tmp__89.Text, tmp__90 ); 
        tmp__92 = (ImmediateAST) mkVal( tmp__88, tmp__91 ); 
        $result = tmp__92; 
      } 
    | local__1_atom_case10=HEX_7 { 
        ImmediateAST tmp__97 ; 
        DObj tmp__96 ; 
        int tmp__95 ; 
        CommonToken tmp__94 ; 
        CommonToken tmp__93 ; 
        tmp__93 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__94 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__95 = 16 ; 
        tmp__96 = (DObj) mkint( tmp__94.Text, tmp__95 ); 
        tmp__97 = (ImmediateAST) mkVal( tmp__93, tmp__96 ); 
        $result = tmp__97; 
      } 
    | local__1_atom_case11=OCT_8 { 
        ImmediateAST tmp__102 ; 
        DObj tmp__101 ; 
        int tmp__100 ; 
        CommonToken tmp__99 ; 
        CommonToken tmp__98 ; 
        tmp__98 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__99 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__100 = 8 ; 
        tmp__101 = (DObj) mkint( tmp__99.Text, tmp__100 ); 
        tmp__102 = (ImmediateAST) mkVal( tmp__98, tmp__101 ); 
        $result = tmp__102; 
      } 
    | local__1_atom_case12=BIN_9 { 
        ImmediateAST tmp__107 ; 
        DObj tmp__106 ; 
        int tmp__105 ; 
        CommonToken tmp__104 ; 
        CommonToken tmp__103 ; 
        tmp__103 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__104 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__105 = 2 ; 
        tmp__106 = (DObj) mkint( tmp__104.Text, tmp__105 ); 
        tmp__107 = (ImmediateAST) mkVal( tmp__103, tmp__106 ); 
        $result = tmp__107; 
      } 
    | local__1_atom_case13=FLOAT_11 { 
        ImmediateAST tmp__111 ; 
        DObj tmp__110 ; 
        CommonToken tmp__109 ; 
        CommonToken tmp__108 ; 
        tmp__108 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__109 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__110 = (DObj) mkfloat( tmp__109.Text ); 
        tmp__111 = (ImmediateAST) mkVal( tmp__108, tmp__110 ); 
        $result = tmp__111; 
      } 
    | local__1_atom_case14='None' { 
        ImmediateAST tmp__114 ; 
        DObj tmp__113 ; 
        CommonToken tmp__112 ; 
        tmp__112 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__113 = (DObj) mknone(  ); 
        tmp__114 = (ImmediateAST) mkVal( tmp__112, tmp__113 ); 
        $result = tmp__114; 
      } 
    | local__1_atom_case15=NAME_13 { 
        ImmediateAST tmp__117 ; 
        CommonToken tmp__116 ; 
        CommonToken tmp__115 ; 
        tmp__115 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__116 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__117 = (ImmediateAST) mkVar( tmp__115, tmp__116.Text ); 
        $result = tmp__117; 
      } 
    | local__1_atom_case16='-' local__2_atom_case16=atom { 
        ImmediateAST tmp__120 ; 
        ImmediateAST tmp__119 ; 
        CommonToken tmp__118 ; 
        tmp__118 = ( CommonToken ) _localctx.local__1_atom_case16 ; 
        tmp__119 = ( ImmediateAST ) _localctx.local__2_atom_case16.result ; 
        tmp__120 = (ImmediateAST) mkNeg( tmp__118, tmp__119 ); 
        $result = tmp__120; 
      } 
    | local__1_atom_case17='~' local__2_atom_case17=atom { 
        ImmediateAST tmp__123 ; 
        ImmediateAST tmp__122 ; 
        CommonToken tmp__121 ; 
        tmp__121 = ( CommonToken ) _localctx.local__1_atom_case17 ; 
        tmp__122 = ( ImmediateAST ) _localctx.local__2_atom_case17.result ; 
        tmp__123 = (ImmediateAST) mkInv( tmp__121, tmp__122 ); 
        $result = tmp__123; 
      } 
    | local__1_atom_case18='if' local__2_atom_case18=expr local__3_atom_case18=then local__4_atom_case18=block 'end' { 
        ImmediateAST tmp__129 ; 
        ImmediateAST tmp__128 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__127 ; 
        CommonToken tmp__126 ; 
        ImmediateAST tmp__125 ; 
        CommonToken tmp__124 ; 
        tmp__124 = ( CommonToken ) _localctx.local__1_atom_case18 ; 
        tmp__125 = ( ImmediateAST ) _localctx.local__2_atom_case18.result ; 
        tmp__126 = ( CommonToken ) _localctx.local__3_atom_case18.result ; 
        tmp__127 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case18.result ; 
        tmp__128 = (ImmediateAST) mkBlock( tmp__126, tmp__127 ); 
        tmp__129 = (ImmediateAST) mkIfThen( tmp__124, tmp__125, tmp__128 ); 
        $result = tmp__129; 
      } 
    | local__1_atom_case19='if' local__2_atom_case19=expr local__3_atom_case19=then local__4_atom_case19=block local__5_atom_case19=gen__nullable_gen__list_gen__snd_elif__elifBlock local__6_atom_case19=gen__optional_gen__blockOf_else 'end' { 
        ImmediateAST tmp__141 ; 
        ImmediateAST tmp__140 ; 
        CommonToken tmp__139 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__137 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__138 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__135 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__136 ; 
        ImmediateAST tmp__134 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__133 ; 
        CommonToken tmp__132 ; 
        ImmediateAST tmp__131 ; 
        (ImmediateAST, ImmediateAST) elif__130 ; 
        tmp__131 = ( ImmediateAST ) _localctx.local__2_atom_case19.result ; 
        tmp__132 = ( CommonToken ) _localctx.local__3_atom_case19.result ; 
        tmp__133 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case19.result ; 
        tmp__134 = (ImmediateAST) mkBlock( tmp__132, tmp__133 ); 
        elif__130 = ( tmp__131 , tmp__134 ); 
        tmp__136 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        elifs__135 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__136, elif__130 ); 
        tmp__138 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__5_atom_case19.result ; 
        elifs__137 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) extend<(ImmediateAST, ImmediateAST)>( elifs__135, tmp__138 ); 
        tmp__139 = ( CommonToken ) _localctx.local__1_atom_case19 ; 
        tmp__140 = ( ImmediateAST ) _localctx.local__6_atom_case19.result ; 
        tmp__141 = (ImmediateAST) mkNestedIf( tmp__139, elifs__135, tmp__140 ); 
        $result = tmp__141; 
      } 
    | local__1_atom_case20='fun' local__2_atom_case20=name '(' local__4_atom_case20=gen__nullable_gen__seplist__L44__name ')' local__6_atom_case20=block 'end' { 
        ImmediateAST tmp__146 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__145 ; 
        System.Collections.Generic.List<string> tmp__144 ; 
        string tmp__143 ; 
        CommonToken tmp__142 ; 
        tmp__142 = ( CommonToken ) _localctx.local__1_atom_case20 ; 
        tmp__143 = ( string ) _localctx.local__2_atom_case20.result ; 
        tmp__144 = ( System.Collections.Generic.List<string> ) _localctx.local__4_atom_case20.result ; 
        tmp__145 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__6_atom_case20.result ; 
        tmp__146 = (ImmediateAST) mkFunc( tmp__142, tmp__143, tmp__144, tmp__145 ); 
        $result = tmp__146; 
      } 
    | local__1_atom_case21='fun' '(' local__3_atom_case21=gen__nullable_gen__seplist__L44__name ')' local__5_atom_case21=block 'end' { 
        ImmediateAST tmp__151 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__150 ; 
        System.Collections.Generic.List<string> tmp__149 ; 
        string tmp__148 ; 
        CommonToken tmp__147 ; 
        tmp__147 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__148 = "" ; 
        tmp__149 = ( System.Collections.Generic.List<string> ) _localctx.local__3_atom_case21.result ; 
        tmp__150 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__5_atom_case21.result ; 
        tmp__151 = (ImmediateAST) mkFunc( tmp__147, tmp__148, tmp__149, tmp__150 ); 
        $result = tmp__151; 
      } 
    | local__1_atom_case22='(' local__2_atom_case22=gen__nullable_gen__seplist__L44__name ')' '->' local__5_atom_case22=gen__line_wrap_expr { 
        ImmediateAST tmp__157 ; 
        ImmediateAST tmp__156 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__155 ; 
        System.Collections.Generic.List<string> tmp__154 ; 
        string tmp__153 ; 
        CommonToken tmp__152 ; 
        tmp__152 = ( CommonToken ) _localctx.local__1_atom_case22 ; 
        tmp__153 = "" ; 
        tmp__154 = ( System.Collections.Generic.List<string> ) _localctx.local__2_atom_case22.result ; 
        tmp__156 = ( ImmediateAST ) _localctx.local__5_atom_case22.result ; 
        tmp__155 = new System.Collections.Generic.List<ImmediateAST> { tmp__156 }; 
        tmp__157 = (ImmediateAST) mkFunc( tmp__152, tmp__153, tmp__154, tmp__155 ); 
        $result = tmp__157; 
      } 
    | local__1_atom_case23=NAME_13 '->' local__3_atom_case23=gen__line_wrap_expr { 
        ImmediateAST tmp__164 ; 
        ImmediateAST tmp__163 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__162 ; 
        CommonToken tmp__161 ; 
        System.Collections.Generic.List<string> tmp__160 ; 
        string tmp__159 ; 
        CommonToken tmp__158 ; 
        tmp__158 = ( CommonToken ) _localctx.local__1_atom_case23 ; 
        tmp__159 = "" ; 
        tmp__161 = ( CommonToken ) _localctx.local__1_atom_case23 ; 
        tmp__160 = new System.Collections.Generic.List<string> { tmp__161.Text }; 
        tmp__163 = ( ImmediateAST ) _localctx.local__3_atom_case23.result ; 
        tmp__162 = new System.Collections.Generic.List<ImmediateAST> { tmp__163 }; 
        tmp__164 = (ImmediateAST) mkFunc( tmp__158, tmp__159, tmp__160, tmp__162 ); 
        $result = tmp__164; 
      } 
; 
gen__line_wrap_expr returns [ImmediateAST result] :
      gen__optional_newline local__2_gen__line_wrap_expr_case0=expr gen__optional_newline { 
        ImmediateAST tmp__165 ; 
        tmp__165 = ( ImmediateAST ) _localctx.local__2_gen__line_wrap_expr_case0.result ; 
        $result = tmp__165; 
      } 
; 
gen__optional_newline returns [CommonToken result] :
      local__1_gen__optional_newline_case0=newline { 
        CommonToken tmp__166 ; 
        tmp__166 = ( CommonToken ) _localctx.local__1_gen__optional_newline_case0.result ; 
        $result = tmp__166; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__nullable_gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__nullable_gen__seplist__L44__name_case0=gen__seplist__L44__name { 
        System.Collections.Generic.List<string> tmp__167 ; 
        tmp__167 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__nullable_gen__seplist__L44__name_case0.result ; 
        $result = tmp__167; 
      } 
    | { 
        System.Collections.Generic.List<string> tmp__168 ; 
        tmp__168 = (System.Collections.Generic.List<string>) empty<string>(  ); 
        $result = tmp__168; 
      } 
; 
gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__seplist__L44__name_case0=name { 
        string tmp__170 ; 
        System.Collections.Generic.List<string> tmp__169 ; 
        tmp__170 = ( string ) _localctx.local__1_gen__seplist__L44__name_case0.result ; 
        tmp__169 = new System.Collections.Generic.List<string> { tmp__170 }; 
        $result = tmp__169; 
      } 
    | local__1_gen__seplist__L44__name_case1=gen__seplist__L44__name ',' local__3_gen__seplist__L44__name_case1=name { 
        System.Collections.Generic.List<string> tmp__173 ; 
        string tmp__172 ; 
        System.Collections.Generic.List<string> tmp__171 ; 
        tmp__171 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__seplist__L44__name_case1.result ; 
        tmp__172 = ( string ) _localctx.local__3_gen__seplist__L44__name_case1.result ; 
        tmp__173 = (System.Collections.Generic.List<string>) append<string>( tmp__171, tmp__172 ); 
        $result = tmp__173; 
      } 
; 
gen__optional_gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__optional_gen__blockOf_else_case0=gen__blockOf_else { 
        ImmediateAST tmp__174 ; 
        tmp__174 = ( ImmediateAST ) _localctx.local__1_gen__optional_gen__blockOf_else_case0.result ; 
        $result = tmp__174; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__blockOf_else_case0='else' local__2_gen__blockOf_else_case0=block { 
        ImmediateAST tmp__177 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__176 ; 
        CommonToken tmp__175 ; 
        tmp__175 = ( CommonToken ) _localctx.local__1_gen__blockOf_else_case0 ; 
        tmp__176 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_else_case0.result ; 
        tmp__177 = (ImmediateAST) mkBlock( tmp__175, tmp__176 ); 
        $result = tmp__177; 
      } 
; 
gen__nullable_gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0=gen__list_gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__178 ; 
        tmp__178 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__178; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__179 ; 
        tmp__179 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__179; 
      } 
; 
gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__list_gen__snd_elif__elifBlock_case0=gen__snd_elif__elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__181 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__180 ; 
        tmp__181 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        tmp__180 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__181 }; 
        $result = tmp__180; 
      } 
    | local__1_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock local__2_gen__list_gen__snd_elif__elifBlock_case1=gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__184 ; 
        (ImmediateAST, ImmediateAST) tmp__183 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__182 ; 
        tmp__182 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__183 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__184 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__182, tmp__183 ); 
        $result = tmp__184; 
      } 
; 
gen__snd_elif__elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      'elif' local__2_gen__snd_elif__elifBlock_case0=elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__185 ; 
        tmp__185 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__185; 
      } 
; 
gen__closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      gen__optional_newline local__2_gen__closelist__L44__pair_case0=gen___closelist__L44__pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__186 ; 
        tmp__186 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_gen__closelist__L44__pair_case0.result ; 
        $result = tmp__186; 
      } 
; 
gen___closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen___closelist__L44__pair_case0=gen___closelist__L44__pair newline { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__187 ; 
        tmp__187 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case0.result ; 
        $result = tmp__187; 
      } 
    | local__1_gen___closelist__L44__pair_case1=gen___closelist__L44__pair ',' newline local__4_gen___closelist__L44__pair_case1=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__190 ; 
        (ImmediateAST, ImmediateAST) tmp__189 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__188 ; 
        tmp__188 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case1.result ; 
        tmp__189 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__4_gen___closelist__L44__pair_case1.result ; 
        tmp__190 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__188, tmp__189 ); 
        $result = tmp__190; 
      } 
    | local__1_gen___closelist__L44__pair_case2=gen___closelist__L44__pair ',' local__3_gen___closelist__L44__pair_case2=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__193 ; 
        (ImmediateAST, ImmediateAST) tmp__192 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__191 ; 
        tmp__191 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case2.result ; 
        tmp__192 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__3_gen___closelist__L44__pair_case2.result ; 
        tmp__193 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__191, tmp__192 ); 
        $result = tmp__193; 
      } 
    | local__1_gen___closelist__L44__pair_case3=pair { 
        (ImmediateAST, ImmediateAST) tmp__195 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__194 ; 
        tmp__195 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen___closelist__L44__pair_case3.result ; 
        tmp__194 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__195 }; 
        $result = tmp__194; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__196 ; 
        tmp__196 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { }; 
        $result = tmp__196; 
      } 
; 
gen__closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_gen__closelist__L44__expr_case0=gen___closelist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__197 ; 
        tmp__197 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__closelist__L44__expr_case0.result ; 
        $result = tmp__197; 
      } 
; 
gen___closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen___closelist__L44__expr_case0=gen___closelist__L44__expr newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__198 ; 
        tmp__198 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case0.result ; 
        $result = tmp__198; 
      } 
    | local__1_gen___closelist__L44__expr_case1=gen___closelist__L44__expr ',' newline local__4_gen___closelist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__201 ; 
        ImmediateAST tmp__200 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__199 ; 
        tmp__199 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case1.result ; 
        tmp__200 = ( ImmediateAST ) _localctx.local__4_gen___closelist__L44__expr_case1.result ; 
        tmp__201 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__199, tmp__200 ); 
        $result = tmp__201; 
      } 
    | local__1_gen___closelist__L44__expr_case2=gen___closelist__L44__expr ',' local__3_gen___closelist__L44__expr_case2=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__204 ; 
        ImmediateAST tmp__203 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__202 ; 
        tmp__202 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case2.result ; 
        tmp__203 = ( ImmediateAST ) _localctx.local__3_gen___closelist__L44__expr_case2.result ; 
        tmp__204 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__202, tmp__203 ); 
        $result = tmp__204; 
      } 
    | local__1_gen___closelist__L44__expr_case3=expr { 
        ImmediateAST tmp__206 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__205 ; 
        tmp__206 = ( ImmediateAST ) _localctx.local__1_gen___closelist__L44__expr_case3.result ; 
        tmp__205 = new System.Collections.Generic.List<ImmediateAST> { tmp__206 }; 
        $result = tmp__205; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__207 ; 
        tmp__207 = new System.Collections.Generic.List<ImmediateAST> { }; 
        $result = tmp__207; 
      } 
; 
pair returns [(ImmediateAST, ImmediateAST) result] :
      local__1_pair_case0=expr gen__line_wrap__L58 local__3_pair_case0=expr { 
        ImmediateAST tmp__210 ; 
        ImmediateAST tmp__209 ; 
        (ImmediateAST, ImmediateAST) tmp__208 ; 
        tmp__209 = ( ImmediateAST ) _localctx.local__1_pair_case0.result ; 
        tmp__210 = ( ImmediateAST ) _localctx.local__3_pair_case0.result ; 
        tmp__208 = ( tmp__209 , tmp__210 ); 
        $result = tmp__208; 
      } 
; 
gen__line_wrap__L58 returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap__L58_case0=':' gen__optional_newline { 
        CommonToken tmp__211 ; 
        tmp__211 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L58_case0 ; 
        $result = tmp__211; 
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
        ImmediateAST tmp__213 ; 
        System.Collections.Generic.List<object> tmp__212 ; 
        tmp__212 = ( System.Collections.Generic.List<object> ) _localctx.local__1_bin_case0.result ; 
        tmp__213 = (ImmediateAST) resolve_binop( tmp__212 ); 
        $result = tmp__213; 
      } 
; 
binseq returns [System.Collections.Generic.List<object> result] :
      local__1_binseq_case0=atom { 
        System.Collections.Generic.List<object> tmp__217 ; 
        object tmp__216 ; 
        ImmediateAST tmp__215 ; 
        System.Collections.Generic.List<object> tmp__214 ; 
        tmp__214 = (System.Collections.Generic.List<object>) empty<object>(  ); 
        tmp__215 = ( ImmediateAST ) _localctx.local__1_binseq_case0.result ; 
        tmp__216 = (object) to_obj<ImmediateAST>( tmp__215 ); 
        tmp__217 = (System.Collections.Generic.List<object>) append<object>( tmp__214, tmp__216 ); 
        $result = tmp__217; 
      } 
    | local__1_binseq_case1=binseq local__2_binseq_case1=binop local__3_binseq_case1=atom { 
        object tmp__223 ; 
        ImmediateAST tmp__222 ; 
        System.Collections.Generic.List<object> tmp__221 ; 
        System.Collections.Generic.List<object> block__218 ; 
        object tmp__220 ; 
        System.Collections.Generic.List<object> tmp__219 ; 
        tmp__219 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__220 = ( object ) _localctx.local__2_binseq_case1.result ; 
        block__218 = (System.Collections.Generic.List<object>) append<object>( tmp__219, tmp__220 ); 
        tmp__221 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__222 = ( ImmediateAST ) _localctx.local__3_binseq_case1.result ; 
        tmp__223 = (object) to_obj<ImmediateAST>( tmp__222 ); 
        block__218 = (System.Collections.Generic.List<object>) append<object>( tmp__221, tmp__223 ); 
        $result = block__218; 
      } 
; 
ibin returns [ImmediateAST result] :
      local__1_ibin_case0=lhs local__2_ibin_case0=ibinop local__3_ibin_case0='=' local__4_ibin_case0=expr { 
        ImmediateAST tmp__228 ; 
        ImmediateAST tmp__227 ; 
        string tmp__226 ; 
        ImmediateAST tmp__225 ; 
        CommonToken tmp__224 ; 
        tmp__224 = ( CommonToken ) _localctx.local__3_ibin_case0 ; 
        tmp__225 = ( ImmediateAST ) _localctx.local__1_ibin_case0.result ; 
        tmp__226 = ( string ) _localctx.local__2_ibin_case0.result ; 
        tmp__227 = ( ImmediateAST ) _localctx.local__4_ibin_case0.result ; 
        tmp__228 = (ImmediateAST) mkIBin( tmp__224, tmp__225, tmp__226, tmp__227 ); 
        $result = tmp__228; 
      } 
; 
ibinop returns [string result] :
      local__1_ibinop_case0=SINGLE_BINOP_2 { 
        CommonToken tmp__229 ; 
        tmp__229 = ( CommonToken ) _localctx.local__1_ibinop_case0 ; 
        $result = tmp__229.Text; 
      } 
    | '-' { 
        string tmp__230 ; 
        tmp__230 = "-" ; 
        $result = tmp__230; 
      } 
; 
binop returns [object result] :
      local__1_binop_case0=SINGLE_BINOP_2 { 
        object tmp__233 ; 
        CommonToken tmp__232 ; 
        CommonToken tmp__231 ; 
        tmp__231 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__232 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__233 = (object) mkop( tmp__231, tmp__232.Text ); 
        $result = tmp__233; 
      } 
    | local__1_binop_case1='not' 'in' { 
        object tmp__236 ; 
        string tmp__235 ; 
        CommonToken tmp__234 ; 
        tmp__234 = ( CommonToken ) _localctx.local__1_binop_case1 ; 
        tmp__235 = "notin" ; 
        tmp__236 = (object) mkop( tmp__234, tmp__235 ); 
        $result = tmp__236; 
      } 
    | local__1_binop_case2='in' { 
        object tmp__239 ; 
        string tmp__238 ; 
        CommonToken tmp__237 ; 
        tmp__237 = ( CommonToken ) _localctx.local__1_binop_case2 ; 
        tmp__238 = "in" ; 
        tmp__239 = (object) mkop( tmp__237, tmp__238 ); 
        $result = tmp__239; 
      } 
    | local__1_binop_case3='-' { 
        object tmp__242 ; 
        string tmp__241 ; 
        CommonToken tmp__240 ; 
        tmp__240 = ( CommonToken ) _localctx.local__1_binop_case3 ; 
        tmp__241 = "-" ; 
        tmp__242 = (object) mkop( tmp__240, tmp__241 ); 
        $result = tmp__242; 
      } 
; 
not returns [ImmediateAST result] :
      local__1_not_case0='not' local__2_not_case0=not { 
        ImmediateAST tmp__245 ; 
        ImmediateAST tmp__244 ; 
        CommonToken tmp__243 ; 
        tmp__243 = ( CommonToken ) _localctx.local__1_not_case0 ; 
        tmp__244 = ( ImmediateAST ) _localctx.local__2_not_case0.result ; 
        tmp__245 = (ImmediateAST) mkNot( tmp__243, tmp__244 ); 
        $result = tmp__245; 
      } 
    | local__1_not_case1=bin { 
        ImmediateAST tmp__246 ; 
        tmp__246 = ( ImmediateAST ) _localctx.local__1_not_case1.result ; 
        $result = tmp__246; 
      } 
; 
and_expr returns [ImmediateAST result] :
      local__1_and_expr_case0=and_expr local__2_and_expr_case0='and' local__3_and_expr_case0=not { 
        ImmediateAST tmp__250 ; 
        ImmediateAST tmp__249 ; 
        ImmediateAST tmp__248 ; 
        CommonToken tmp__247 ; 
        tmp__247 = ( CommonToken ) _localctx.local__2_and_expr_case0 ; 
        tmp__248 = ( ImmediateAST ) _localctx.local__1_and_expr_case0.result ; 
        tmp__249 = ( ImmediateAST ) _localctx.local__3_and_expr_case0.result ; 
        tmp__250 = (ImmediateAST) mkAnd( tmp__247, tmp__248, tmp__249 ); 
        $result = tmp__250; 
      } 
    | local__1_and_expr_case1=not { 
        ImmediateAST tmp__251 ; 
        tmp__251 = ( ImmediateAST ) _localctx.local__1_and_expr_case1.result ; 
        $result = tmp__251; 
      } 
; 
or_expr returns [ImmediateAST result] :
      local__1_or_expr_case0=or_expr local__2_or_expr_case0='or' local__3_or_expr_case0=and_expr { 
        ImmediateAST tmp__255 ; 
        ImmediateAST tmp__254 ; 
        ImmediateAST tmp__253 ; 
        CommonToken tmp__252 ; 
        tmp__252 = ( CommonToken ) _localctx.local__2_or_expr_case0 ; 
        tmp__253 = ( ImmediateAST ) _localctx.local__1_or_expr_case0.result ; 
        tmp__254 = ( ImmediateAST ) _localctx.local__3_or_expr_case0.result ; 
        tmp__255 = (ImmediateAST) mkAnd( tmp__252, tmp__253, tmp__254 ); 
        $result = tmp__255; 
      } 
    | local__1_or_expr_case1=and_expr { 
        ImmediateAST tmp__256 ; 
        tmp__256 = ( ImmediateAST ) _localctx.local__1_or_expr_case1.result ; 
        $result = tmp__256; 
      } 
; 
block returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_block_case0=gen__filter_stmt__gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__257 ; 
        tmp__257 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_block_case0.result ; 
        $result = tmp__257; 
      } 
; 
gen__filter_stmt__gen__or___L59__newline returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__filter_stmt__gen__or___L59__newline_case0=gen__filter_stmt__gen__or___L59__newline local__2_gen__filter_stmt__gen__or___L59__newline_case0=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__260 ; 
        ImmediateAST tmp__259 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__258 ; 
        tmp__258 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case0.result ; 
        tmp__259 = ( ImmediateAST ) _localctx.local__2_gen__filter_stmt__gen__or___L59__newline_case0.result ; 
        tmp__260 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__258, tmp__259 ); 
        $result = tmp__260; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__newline_case1=gen__filter_stmt__gen__or___L59__newline gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__261 ; 
        tmp__261 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case1.result ; 
        $result = tmp__261; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__newline_case2=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__264 ; 
        ImmediateAST tmp__263 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__262 ; 
        tmp__262 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__263 = ( ImmediateAST ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case2.result ; 
        tmp__264 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__262, tmp__263 ); 
        $result = tmp__264; 
      } 
    | gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__265 ; 
        tmp__265 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__265; 
      } 
; 
gen__or___L59__newline returns [int result] :
      ';' { 
        int tmp__266 ; 
        tmp__266 = 0 ; 
        $result = tmp__266; 
      } 
    | newline { 
        int tmp__267 ; 
        tmp__267 = 0 ; 
        $result = tmp__267; 
      } 
; 
lhs returns [ImmediateAST result] :
      local__1_lhs_case0=NAME_13 { 
        ImmediateAST tmp__270 ; 
        CommonToken tmp__269 ; 
        CommonToken tmp__268 ; 
        tmp__268 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__269 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__270 = (ImmediateAST) mkVar( tmp__268, tmp__269.Text ); 
        $result = tmp__270; 
      } 
    | local__1_lhs_case1=atom local__2_lhs_case1='.' '[' local__4_lhs_case1=expr ']' { 
        ImmediateAST tmp__274 ; 
        ImmediateAST tmp__273 ; 
        ImmediateAST tmp__272 ; 
        CommonToken tmp__271 ; 
        tmp__271 = ( CommonToken ) _localctx.local__2_lhs_case1 ; 
        tmp__272 = ( ImmediateAST ) _localctx.local__1_lhs_case1.result ; 
        tmp__273 = ( ImmediateAST ) _localctx.local__4_lhs_case1.result ; 
        tmp__274 = (ImmediateAST) mkOGet( tmp__271, tmp__272, tmp__273 ); 
        $result = tmp__274; 
      } 
    | local__1_lhs_case2=atom local__2_lhs_case2='.' local__3_lhs_case2=NAME_13 { 
        ImmediateAST tmp__281 ; 
        ImmediateAST tmp__280 ; 
        DObj tmp__279 ; 
        CommonToken tmp__278 ; 
        CommonToken tmp__277 ; 
        ImmediateAST tmp__276 ; 
        CommonToken tmp__275 ; 
        tmp__275 = ( CommonToken ) _localctx.local__2_lhs_case2 ; 
        tmp__276 = ( ImmediateAST ) _localctx.local__1_lhs_case2.result ; 
        tmp__277 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__278 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__279 = (DObj) mkstr( tmp__278.Text ); 
        tmp__280 = (ImmediateAST) mkVal( tmp__277, tmp__279 ); 
        tmp__281 = (ImmediateAST) mkOGet( tmp__275, tmp__276, tmp__280 ); 
        $result = tmp__281; 
      } 
; 
do returns [CommonToken result] :
      gen__optional_newline local__2_do_case0='do' { 
        CommonToken tmp__282 ; 
        tmp__282 = ( CommonToken ) _localctx.local__2_do_case0 ; 
        $result = tmp__282; 
      } 
; 
then returns [CommonToken result] :
      gen__optional_newline local__2_then_case0='then' { 
        CommonToken tmp__283 ; 
        tmp__283 = ( CommonToken ) _localctx.local__2_then_case0 ; 
        $result = tmp__283; 
      } 
; 
gen__blockOf_do returns [ImmediateAST result] :
      local__1_gen__blockOf_do_case0=do local__2_gen__blockOf_do_case0=block { 
        ImmediateAST tmp__286 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__285 ; 
        CommonToken tmp__284 ; 
        tmp__284 = ( CommonToken ) _localctx.local__1_gen__blockOf_do_case0.result ; 
        tmp__285 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_do_case0.result ; 
        tmp__286 = (ImmediateAST) mkBlock( tmp__284, tmp__285 ); 
        $result = tmp__286; 
      } 
; 
name returns [string result] :
      local__1_name_case0=NAME_13 { 
        CommonToken tmp__287 ; 
        tmp__287 = ( CommonToken ) _localctx.local__1_name_case0 ; 
        $result = tmp__287.Text; 
      } 
; 
elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      local__1_elifBlock_case0=expr local__2_elifBlock_case0=gen__blockOf_then { 
        ImmediateAST tmp__290 ; 
        ImmediateAST tmp__289 ; 
        (ImmediateAST, ImmediateAST) tmp__288 ; 
        tmp__289 = ( ImmediateAST ) _localctx.local__1_elifBlock_case0.result ; 
        tmp__290 = ( ImmediateAST ) _localctx.local__2_elifBlock_case0.result ; 
        tmp__288 = ( tmp__289 , tmp__290 ); 
        $result = tmp__288; 
      } 
; 
gen__blockOf_then returns [ImmediateAST result] :
      local__1_gen__blockOf_then_case0=then local__2_gen__blockOf_then_case0=block { 
        ImmediateAST tmp__293 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__292 ; 
        CommonToken tmp__291 ; 
        tmp__291 = ( CommonToken ) _localctx.local__1_gen__blockOf_then_case0.result ; 
        tmp__292 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_then_case0.result ; 
        tmp__293 = (ImmediateAST) mkBlock( tmp__291, tmp__292 ); 
        $result = tmp__293; 
      } 
; 
lhs_seq returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_lhs_seq_case0=lhs_seq local__2_lhs_seq_case0=lhs '=' { 
        System.Collections.Generic.List<ImmediateAST> tmp__296 ; 
        ImmediateAST tmp__295 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__294 ; 
        tmp__294 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_lhs_seq_case0.result ; 
        tmp__295 = ( ImmediateAST ) _localctx.local__2_lhs_seq_case0.result ; 
        tmp__296 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__294, tmp__295 ); 
        $result = tmp__296; 
      } 
    | local__1_lhs_seq_case1=lhs '=' { 
        ImmediateAST tmp__298 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__297 ; 
        tmp__298 = ( ImmediateAST ) _localctx.local__1_lhs_seq_case1.result ; 
        tmp__297 = new System.Collections.Generic.List<ImmediateAST> { tmp__298 }; 
        $result = tmp__297; 
      } 
; 
start returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_start_case0=gen__nullable_gen__seplist_newline__stmt gen__optional_newline EOF { 
        System.Collections.Generic.List<ImmediateAST> tmp__299 ; 
        tmp__299 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_start_case0.result ; 
        $result = tmp__299; 
      } 
; 
gen__nullable_gen__seplist_newline__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__nullable_gen__seplist_newline__stmt_case0=gen__seplist_newline__stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__300 ; 
        tmp__300 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist_newline__stmt_case0.result ; 
        $result = tmp__300; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__301 ; 
        tmp__301 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__301; 
      } 
; 
gen__seplist_newline__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_newline__stmt_case0=stmt { 
        ImmediateAST tmp__303 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__302 ; 
        tmp__303 = ( ImmediateAST ) _localctx.local__1_gen__seplist_newline__stmt_case0.result ; 
        tmp__302 = new System.Collections.Generic.List<ImmediateAST> { tmp__303 }; 
        $result = tmp__302; 
      } 
    | local__1_gen__seplist_newline__stmt_case1=gen__seplist_newline__stmt newline local__3_gen__seplist_newline__stmt_case1=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__306 ; 
        ImmediateAST tmp__305 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__304 ; 
        tmp__304 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_newline__stmt_case1.result ; 
        tmp__305 = ( ImmediateAST ) _localctx.local__3_gen__seplist_newline__stmt_case1.result ; 
        tmp__306 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__304, tmp__305 ); 
        $result = tmp__306; 
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


