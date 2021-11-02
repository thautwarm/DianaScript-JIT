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
    | '__META' local__2_stmt_case1=INT_10 ':' local__4_stmt_case1=INT_10 ':' local__6_stmt_case1=INT_10 'do' local__8_stmt_case1=stmt { 
        ImmediateAST tmp__14 ; 
        ImmediateAST tmp__13 ; 
        CommonToken tmp__12 ; 
        CommonToken tmp__11 ; 
        CommonToken tmp__10 ; 
        tmp__10 = ( CommonToken ) _localctx.local__2_stmt_case1 ; 
        tmp__11 = ( CommonToken ) _localctx.local__4_stmt_case1 ; 
        tmp__12 = ( CommonToken ) _localctx.local__6_stmt_case1 ; 
        tmp__13 = ( ImmediateAST ) _localctx.local__8_stmt_case1.result ; 
        tmp__14 = (ImmediateAST) mkMeta( tmp__10.Text, tmp__11.Text, tmp__12.Text, tmp__13 ); 
        $result = tmp__14; 
      } 
    | local__1_stmt_case2=lhs_seq local__2_stmt_case2=expr { 
        ImmediateAST tmp__17 ; 
        ImmediateAST tmp__16 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__15 ; 
        tmp__15 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_stmt_case2.result ; 
        tmp__16 = ( ImmediateAST ) _localctx.local__2_stmt_case2.result ; 
        tmp__17 = (ImmediateAST) mkStoreMany( tmp__15, tmp__16 ); 
        $result = tmp__17; 
      } 
    | local__1_stmt_case3='loop' local__2_stmt_case3=block 'end' { 
        ImmediateAST tmp__22 ; 
        ImmediateAST tmp__21 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__20 ; 
        CommonToken tmp__19 ; 
        CommonToken tmp__18 ; 
        tmp__18 = ( CommonToken ) _localctx.local__1_stmt_case3 ; 
        tmp__19 = ( CommonToken ) _localctx.local__1_stmt_case3 ; 
        tmp__20 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_stmt_case3.result ; 
        tmp__21 = (ImmediateAST) mkBlock( tmp__19, tmp__20 ); 
        tmp__22 = (ImmediateAST) mkLoop( tmp__18, tmp__21 ); 
        $result = tmp__22; 
      } 
    | local__1_stmt_case4='while' local__2_stmt_case4=expr local__3_stmt_case4=gen__blockOf_do 'end' { 
        ImmediateAST tmp__26 ; 
        ImmediateAST tmp__25 ; 
        ImmediateAST tmp__24 ; 
        CommonToken tmp__23 ; 
        tmp__23 = ( CommonToken ) _localctx.local__1_stmt_case4 ; 
        tmp__24 = ( ImmediateAST ) _localctx.local__2_stmt_case4.result ; 
        tmp__25 = ( ImmediateAST ) _localctx.local__3_stmt_case4.result ; 
        tmp__26 = (ImmediateAST) mkWhile( tmp__23, tmp__24, tmp__25 ); 
        $result = tmp__26; 
      } 
    | local__1_stmt_case5='for' local__2_stmt_case5=NAME_13 'in' local__4_stmt_case5=expr local__5_stmt_case5=gen__blockOf_do 'end' { 
        ImmediateAST tmp__31 ; 
        ImmediateAST tmp__30 ; 
        ImmediateAST tmp__29 ; 
        CommonToken tmp__28 ; 
        CommonToken tmp__27 ; 
        tmp__27 = ( CommonToken ) _localctx.local__1_stmt_case5 ; 
        tmp__28 = ( CommonToken ) _localctx.local__2_stmt_case5 ; 
        tmp__29 = ( ImmediateAST ) _localctx.local__4_stmt_case5.result ; 
        tmp__30 = ( ImmediateAST ) _localctx.local__5_stmt_case5.result ; 
        tmp__31 = (ImmediateAST) mkFor( tmp__27, tmp__28.Text, tmp__29, tmp__30 ); 
        $result = tmp__31; 
      } 
    | local__1_stmt_case6='break' { 
        ImmediateAST tmp__33 ; 
        CommonToken tmp__32 ; 
        tmp__32 = ( CommonToken ) _localctx.local__1_stmt_case6 ; 
        tmp__33 = (ImmediateAST) mkBreak( tmp__32 ); 
        $result = tmp__33; 
      } 
    | local__1_stmt_case7='continue' { 
        ImmediateAST tmp__35 ; 
        CommonToken tmp__34 ; 
        tmp__34 = ( CommonToken ) _localctx.local__1_stmt_case7 ; 
        tmp__35 = (ImmediateAST) mkContinue( tmp__34 ); 
        $result = tmp__35; 
      } 
    | local__1_stmt_case8='return' local__2_stmt_case8=expr { 
        ImmediateAST tmp__38 ; 
        ImmediateAST tmp__37 ; 
        CommonToken tmp__36 ; 
        tmp__36 = ( CommonToken ) _localctx.local__1_stmt_case8 ; 
        tmp__37 = ( ImmediateAST ) _localctx.local__2_stmt_case8.result ; 
        tmp__38 = (ImmediateAST) mkReturn( tmp__36, tmp__37 ); 
        $result = tmp__38; 
      } 
    | local__1_stmt_case9='return' { 
        ImmediateAST tmp__40 ; 
        CommonToken tmp__39 ; 
        tmp__39 = ( CommonToken ) _localctx.local__1_stmt_case9 ; 
        tmp__40 = (ImmediateAST) mkReturn( tmp__39, null ); 
        $result = tmp__40; 
      } 
    | local__1_stmt_case10='var' local__2_stmt_case10=gen__seplist__L44__name { 
        ImmediateAST tmp__43 ; 
        System.Collections.Generic.List<string> tmp__42 ; 
        CommonToken tmp__41 ; 
        tmp__41 = ( CommonToken ) _localctx.local__1_stmt_case10 ; 
        tmp__42 = ( System.Collections.Generic.List<string> ) _localctx.local__2_stmt_case10.result ; 
        tmp__43 = (ImmediateAST) mkDecl( tmp__41, tmp__42 ); 
        $result = tmp__43; 
      } 
    | local__1_stmt_case11=ibin { 
        ImmediateAST tmp__44 ; 
        tmp__44 = ( ImmediateAST ) _localctx.local__1_stmt_case11.result ; 
        $result = tmp__44; 
      } 
    | local__1_stmt_case12=expr { 
        ImmediateAST tmp__46 ; 
        ImmediateAST tmp__45 ; 
        tmp__45 = ( ImmediateAST ) _localctx.local__1_stmt_case12.result ; 
        tmp__46 = (ImmediateAST) mkExprStmt( tmp__45 ); 
        $result = tmp__46; 
      } 
; 
newline returns [CommonToken result] :
      local__1_newline_case0=NEWLINE_17 { 
        CommonToken tmp__47 ; 
        tmp__47 = ( CommonToken ) _localctx.local__1_newline_case0 ; 
        $result = tmp__47; 
      } 
    | newline local__2_newline_case1=NEWLINE_17 { 
        CommonToken tmp__48 ; 
        tmp__48 = ( CommonToken ) _localctx.local__2_newline_case1 ; 
        $result = tmp__48; 
      } 
; 
atom returns [ImmediateAST result] :
      local__1_atom_case0=atom local__2_atom_case0='.' '[' local__4_atom_case0=expr ']' { 
        ImmediateAST tmp__52 ; 
        ImmediateAST tmp__51 ; 
        ImmediateAST tmp__50 ; 
        CommonToken tmp__49 ; 
        tmp__49 = ( CommonToken ) _localctx.local__2_atom_case0 ; 
        tmp__50 = ( ImmediateAST ) _localctx.local__1_atom_case0.result ; 
        tmp__51 = ( ImmediateAST ) _localctx.local__4_atom_case0.result ; 
        tmp__52 = (ImmediateAST) mkOGet( tmp__49, tmp__50, tmp__51 ); 
        $result = tmp__52; 
      } 
    | local__1_atom_case1=atom local__2_atom_case1='.' local__3_atom_case1=NAME_13 { 
        ImmediateAST tmp__59 ; 
        ImmediateAST tmp__58 ; 
        DObj tmp__57 ; 
        CommonToken tmp__56 ; 
        CommonToken tmp__55 ; 
        ImmediateAST tmp__54 ; 
        CommonToken tmp__53 ; 
        tmp__53 = ( CommonToken ) _localctx.local__2_atom_case1 ; 
        tmp__54 = ( ImmediateAST ) _localctx.local__1_atom_case1.result ; 
        tmp__55 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__56 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__57 = (DObj) mkstr( tmp__56.Text ); 
        tmp__58 = (ImmediateAST) mkVal( tmp__55, tmp__57 ); 
        tmp__59 = (ImmediateAST) mkOGet( tmp__53, tmp__54, tmp__58 ); 
        $result = tmp__59; 
      } 
    | local__1_atom_case2=atom local__2_atom_case2='(' local__3_atom_case2=gen__closelist__L44__expr ')' { 
        ImmediateAST tmp__63 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__62 ; 
        ImmediateAST tmp__61 ; 
        CommonToken tmp__60 ; 
        tmp__60 = ( CommonToken ) _localctx.local__2_atom_case2 ; 
        tmp__61 = ( ImmediateAST ) _localctx.local__1_atom_case2.result ; 
        tmp__62 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__3_atom_case2.result ; 
        tmp__63 = (ImmediateAST) mkApp( tmp__60, tmp__61, tmp__62 ); 
        $result = tmp__63; 
      } 
    | local__1_atom_case3='[' local__2_atom_case3=gen__closelist__L44__expr ']' { 
        ImmediateAST tmp__66 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__65 ; 
        CommonToken tmp__64 ; 
        tmp__64 = ( CommonToken ) _localctx.local__1_atom_case3 ; 
        tmp__65 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case3.result ; 
        tmp__66 = (ImmediateAST) mkList( tmp__64, tmp__65 ); 
        $result = tmp__66; 
      } 
    | local__1_atom_case4='(' local__2_atom_case4=gen__closelist__L44__expr local__3_atom_case4=trailer ')' { 
        ImmediateAST tmp__70 ; 
        bool tmp__69 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__68 ; 
        CommonToken tmp__67 ; 
        tmp__67 = ( CommonToken ) _localctx.local__1_atom_case4 ; 
        tmp__68 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case4.result ; 
        tmp__69 = ( bool ) _localctx.local__3_atom_case4.result ; 
        tmp__70 = (ImmediateAST) mkTuple( tmp__67, tmp__68, tmp__69 ); 
        $result = tmp__70; 
      } 
    | local__1_atom_case5='{|' local__2_atom_case5=gen__closelist__L44__pair trailer '|}' { 
        ImmediateAST tmp__73 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__72 ; 
        CommonToken tmp__71 ; 
        tmp__71 = ( CommonToken ) _localctx.local__1_atom_case5 ; 
        tmp__72 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case5.result ; 
        tmp__73 = (ImmediateAST) mkStrDict( tmp__71, tmp__72 ); 
        $result = tmp__73; 
      } 
    | local__1_atom_case6='{' local__2_atom_case6=gen__closelist__L44__pair trailer '}' { 
        ImmediateAST tmp__76 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__75 ; 
        CommonToken tmp__74 ; 
        tmp__74 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__75 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case6.result ; 
        tmp__76 = (ImmediateAST) mkDict( tmp__74, tmp__75 ); 
        $result = tmp__76; 
      } 
    | local__1_atom_case7=STR_4 { 
        ImmediateAST tmp__81 ; 
        DObj tmp__80 ; 
        string tmp__79 ; 
        CommonToken tmp__78 ; 
        CommonToken tmp__77 ; 
        tmp__77 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__78 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__79 = (string) unesc( tmp__78.Text ); 
        tmp__80 = (DObj) mkstr( tmp__79 ); 
        tmp__81 = (ImmediateAST) mkVal( tmp__77, tmp__80 ); 
        $result = tmp__81; 
      } 
    | local__1_atom_case8=INT_10 { 
        ImmediateAST tmp__86 ; 
        DObj tmp__85 ; 
        int tmp__84 ; 
        CommonToken tmp__83 ; 
        CommonToken tmp__82 ; 
        tmp__82 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__83 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__84 = 0 ; 
        tmp__85 = (DObj) mkint( tmp__83.Text, tmp__84 ); 
        tmp__86 = (ImmediateAST) mkVal( tmp__82, tmp__85 ); 
        $result = tmp__86; 
      } 
    | local__1_atom_case9=HEX_7 { 
        ImmediateAST tmp__91 ; 
        DObj tmp__90 ; 
        int tmp__89 ; 
        CommonToken tmp__88 ; 
        CommonToken tmp__87 ; 
        tmp__87 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__88 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__89 = 16 ; 
        tmp__90 = (DObj) mkint( tmp__88.Text, tmp__89 ); 
        tmp__91 = (ImmediateAST) mkVal( tmp__87, tmp__90 ); 
        $result = tmp__91; 
      } 
    | local__1_atom_case10=OCT_8 { 
        ImmediateAST tmp__96 ; 
        DObj tmp__95 ; 
        int tmp__94 ; 
        CommonToken tmp__93 ; 
        CommonToken tmp__92 ; 
        tmp__92 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__93 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__94 = 8 ; 
        tmp__95 = (DObj) mkint( tmp__93.Text, tmp__94 ); 
        tmp__96 = (ImmediateAST) mkVal( tmp__92, tmp__95 ); 
        $result = tmp__96; 
      } 
    | local__1_atom_case11=BIN_9 { 
        ImmediateAST tmp__101 ; 
        DObj tmp__100 ; 
        int tmp__99 ; 
        CommonToken tmp__98 ; 
        CommonToken tmp__97 ; 
        tmp__97 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__98 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__99 = 2 ; 
        tmp__100 = (DObj) mkint( tmp__98.Text, tmp__99 ); 
        tmp__101 = (ImmediateAST) mkVal( tmp__97, tmp__100 ); 
        $result = tmp__101; 
      } 
    | local__1_atom_case12=FLOAT_11 { 
        ImmediateAST tmp__105 ; 
        DObj tmp__104 ; 
        CommonToken tmp__103 ; 
        CommonToken tmp__102 ; 
        tmp__102 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__103 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__104 = (DObj) mkfloat( tmp__103.Text ); 
        tmp__105 = (ImmediateAST) mkVal( tmp__102, tmp__104 ); 
        $result = tmp__105; 
      } 
    | local__1_atom_case13='None' { 
        ImmediateAST tmp__108 ; 
        DObj tmp__107 ; 
        CommonToken tmp__106 ; 
        tmp__106 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__107 = (DObj) mknone(  ); 
        tmp__108 = (ImmediateAST) mkVal( tmp__106, tmp__107 ); 
        $result = tmp__108; 
      } 
    | local__1_atom_case14=NAME_13 { 
        ImmediateAST tmp__111 ; 
        CommonToken tmp__110 ; 
        CommonToken tmp__109 ; 
        tmp__109 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__110 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__111 = (ImmediateAST) mkVar( tmp__109, tmp__110.Text ); 
        $result = tmp__111; 
      } 
    | local__1_atom_case15='-' local__2_atom_case15=atom { 
        ImmediateAST tmp__114 ; 
        ImmediateAST tmp__113 ; 
        CommonToken tmp__112 ; 
        tmp__112 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__113 = ( ImmediateAST ) _localctx.local__2_atom_case15.result ; 
        tmp__114 = (ImmediateAST) mkNeg( tmp__112, tmp__113 ); 
        $result = tmp__114; 
      } 
    | local__1_atom_case16='~' local__2_atom_case16=atom { 
        ImmediateAST tmp__117 ; 
        ImmediateAST tmp__116 ; 
        CommonToken tmp__115 ; 
        tmp__115 = ( CommonToken ) _localctx.local__1_atom_case16 ; 
        tmp__116 = ( ImmediateAST ) _localctx.local__2_atom_case16.result ; 
        tmp__117 = (ImmediateAST) mkInv( tmp__115, tmp__116 ); 
        $result = tmp__117; 
      } 
    | local__1_atom_case17='if' local__2_atom_case17=expr local__3_atom_case17=then local__4_atom_case17=block 'end' { 
        ImmediateAST tmp__123 ; 
        ImmediateAST tmp__122 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__121 ; 
        CommonToken tmp__120 ; 
        ImmediateAST tmp__119 ; 
        CommonToken tmp__118 ; 
        tmp__118 = ( CommonToken ) _localctx.local__1_atom_case17 ; 
        tmp__119 = ( ImmediateAST ) _localctx.local__2_atom_case17.result ; 
        tmp__120 = ( CommonToken ) _localctx.local__3_atom_case17.result ; 
        tmp__121 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case17.result ; 
        tmp__122 = (ImmediateAST) mkBlock( tmp__120, tmp__121 ); 
        tmp__123 = (ImmediateAST) mkIfThen( tmp__118, tmp__119, tmp__122 ); 
        $result = tmp__123; 
      } 
    | local__1_atom_case18='if' local__2_atom_case18=expr local__3_atom_case18=then local__4_atom_case18=block local__5_atom_case18=gen__nullable_gen__list_gen__snd_elif__elifBlock local__6_atom_case18=gen__optional_gen__blockOf_else 'end' { 
        ImmediateAST tmp__135 ; 
        ImmediateAST tmp__134 ; 
        CommonToken tmp__133 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__131 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__132 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__129 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__130 ; 
        ImmediateAST tmp__128 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__127 ; 
        CommonToken tmp__126 ; 
        ImmediateAST tmp__125 ; 
        (ImmediateAST, ImmediateAST) elif__124 ; 
        tmp__125 = ( ImmediateAST ) _localctx.local__2_atom_case18.result ; 
        tmp__126 = ( CommonToken ) _localctx.local__3_atom_case18.result ; 
        tmp__127 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case18.result ; 
        tmp__128 = (ImmediateAST) mkBlock( tmp__126, tmp__127 ); 
        elif__124 = ( tmp__125 , tmp__128 ); 
        tmp__130 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        elifs__129 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__130, elif__124 ); 
        tmp__132 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__5_atom_case18.result ; 
        elifs__131 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) extend<(ImmediateAST, ImmediateAST)>( elifs__129, tmp__132 ); 
        tmp__133 = ( CommonToken ) _localctx.local__1_atom_case18 ; 
        tmp__134 = ( ImmediateAST ) _localctx.local__6_atom_case18.result ; 
        tmp__135 = (ImmediateAST) mkNestedIf( tmp__133, elifs__129, tmp__134 ); 
        $result = tmp__135; 
      } 
    | local__1_atom_case19='fun' local__2_atom_case19=name '(' local__4_atom_case19=gen__nullable_gen__seplist__L44__name ')' local__6_atom_case19=block 'end' { 
        ImmediateAST tmp__140 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__139 ; 
        System.Collections.Generic.List<string> tmp__138 ; 
        string tmp__137 ; 
        CommonToken tmp__136 ; 
        tmp__136 = ( CommonToken ) _localctx.local__1_atom_case19 ; 
        tmp__137 = ( string ) _localctx.local__2_atom_case19.result ; 
        tmp__138 = ( System.Collections.Generic.List<string> ) _localctx.local__4_atom_case19.result ; 
        tmp__139 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__6_atom_case19.result ; 
        tmp__140 = (ImmediateAST) mkFunc( tmp__136, tmp__137, tmp__138, tmp__139 ); 
        $result = tmp__140; 
      } 
    | local__1_atom_case20='fun' '(' local__3_atom_case20=gen__nullable_gen__seplist__L44__name ')' local__5_atom_case20=block 'end' { 
        ImmediateAST tmp__145 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__144 ; 
        System.Collections.Generic.List<string> tmp__143 ; 
        string tmp__142 ; 
        CommonToken tmp__141 ; 
        tmp__141 = ( CommonToken ) _localctx.local__1_atom_case20 ; 
        tmp__142 = "" ; 
        tmp__143 = ( System.Collections.Generic.List<string> ) _localctx.local__3_atom_case20.result ; 
        tmp__144 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__5_atom_case20.result ; 
        tmp__145 = (ImmediateAST) mkFunc( tmp__141, tmp__142, tmp__143, tmp__144 ); 
        $result = tmp__145; 
      } 
    | local__1_atom_case21='(' local__2_atom_case21=gen__nullable_gen__seplist__L44__name ')' '->' local__5_atom_case21=gen__line_wrap_expr { 
        ImmediateAST tmp__151 ; 
        ImmediateAST tmp__150 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__149 ; 
        System.Collections.Generic.List<string> tmp__148 ; 
        string tmp__147 ; 
        CommonToken tmp__146 ; 
        tmp__146 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__147 = "" ; 
        tmp__148 = ( System.Collections.Generic.List<string> ) _localctx.local__2_atom_case21.result ; 
        tmp__150 = ( ImmediateAST ) _localctx.local__5_atom_case21.result ; 
        tmp__149 = new System.Collections.Generic.List<ImmediateAST> { tmp__150 }; 
        tmp__151 = (ImmediateAST) mkFunc( tmp__146, tmp__147, tmp__148, tmp__149 ); 
        $result = tmp__151; 
      } 
    | local__1_atom_case22=NAME_13 '->' local__3_atom_case22=gen__line_wrap_expr { 
        ImmediateAST tmp__158 ; 
        ImmediateAST tmp__157 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__156 ; 
        CommonToken tmp__155 ; 
        System.Collections.Generic.List<string> tmp__154 ; 
        string tmp__153 ; 
        CommonToken tmp__152 ; 
        tmp__152 = ( CommonToken ) _localctx.local__1_atom_case22 ; 
        tmp__153 = "" ; 
        tmp__155 = ( CommonToken ) _localctx.local__1_atom_case22 ; 
        tmp__154 = new System.Collections.Generic.List<string> { tmp__155.Text }; 
        tmp__157 = ( ImmediateAST ) _localctx.local__3_atom_case22.result ; 
        tmp__156 = new System.Collections.Generic.List<ImmediateAST> { tmp__157 }; 
        tmp__158 = (ImmediateAST) mkFunc( tmp__152, tmp__153, tmp__154, tmp__156 ); 
        $result = tmp__158; 
      } 
; 
gen__line_wrap_expr returns [ImmediateAST result] :
      gen__optional_newline local__2_gen__line_wrap_expr_case0=expr gen__optional_newline { 
        ImmediateAST tmp__159 ; 
        tmp__159 = ( ImmediateAST ) _localctx.local__2_gen__line_wrap_expr_case0.result ; 
        $result = tmp__159; 
      } 
; 
gen__optional_newline returns [CommonToken result] :
      local__1_gen__optional_newline_case0=newline { 
        CommonToken tmp__160 ; 
        tmp__160 = ( CommonToken ) _localctx.local__1_gen__optional_newline_case0.result ; 
        $result = tmp__160; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__nullable_gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__nullable_gen__seplist__L44__name_case0=gen__seplist__L44__name { 
        System.Collections.Generic.List<string> tmp__161 ; 
        tmp__161 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__nullable_gen__seplist__L44__name_case0.result ; 
        $result = tmp__161; 
      } 
    | { 
        System.Collections.Generic.List<string> tmp__162 ; 
        tmp__162 = (System.Collections.Generic.List<string>) empty<string>(  ); 
        $result = tmp__162; 
      } 
; 
gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__seplist__L44__name_case0=name { 
        string tmp__164 ; 
        System.Collections.Generic.List<string> tmp__163 ; 
        tmp__164 = ( string ) _localctx.local__1_gen__seplist__L44__name_case0.result ; 
        tmp__163 = new System.Collections.Generic.List<string> { tmp__164 }; 
        $result = tmp__163; 
      } 
    | local__1_gen__seplist__L44__name_case1=gen__seplist__L44__name ',' local__3_gen__seplist__L44__name_case1=name { 
        System.Collections.Generic.List<string> tmp__167 ; 
        string tmp__166 ; 
        System.Collections.Generic.List<string> tmp__165 ; 
        tmp__165 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__seplist__L44__name_case1.result ; 
        tmp__166 = ( string ) _localctx.local__3_gen__seplist__L44__name_case1.result ; 
        tmp__167 = (System.Collections.Generic.List<string>) append<string>( tmp__165, tmp__166 ); 
        $result = tmp__167; 
      } 
; 
gen__optional_gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__optional_gen__blockOf_else_case0=gen__blockOf_else { 
        ImmediateAST tmp__168 ; 
        tmp__168 = ( ImmediateAST ) _localctx.local__1_gen__optional_gen__blockOf_else_case0.result ; 
        $result = tmp__168; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__blockOf_else_case0='else' local__2_gen__blockOf_else_case0=block { 
        ImmediateAST tmp__171 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__170 ; 
        CommonToken tmp__169 ; 
        tmp__169 = ( CommonToken ) _localctx.local__1_gen__blockOf_else_case0 ; 
        tmp__170 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_else_case0.result ; 
        tmp__171 = (ImmediateAST) mkBlock( tmp__169, tmp__170 ); 
        $result = tmp__171; 
      } 
; 
gen__nullable_gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0=gen__list_gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__172 ; 
        tmp__172 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__172; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__173 ; 
        tmp__173 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__173; 
      } 
; 
gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__list_gen__snd_elif__elifBlock_case0=gen__snd_elif__elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__175 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__174 ; 
        tmp__175 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        tmp__174 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__175 }; 
        $result = tmp__174; 
      } 
    | local__1_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock local__2_gen__list_gen__snd_elif__elifBlock_case1=gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__178 ; 
        (ImmediateAST, ImmediateAST) tmp__177 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__176 ; 
        tmp__176 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__177 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__178 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__176, tmp__177 ); 
        $result = tmp__178; 
      } 
; 
gen__snd_elif__elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      'elif' local__2_gen__snd_elif__elifBlock_case0=elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__179 ; 
        tmp__179 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__179; 
      } 
; 
gen__closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      gen__optional_newline local__2_gen__closelist__L44__pair_case0=gen___closelist__L44__pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__180 ; 
        tmp__180 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_gen__closelist__L44__pair_case0.result ; 
        $result = tmp__180; 
      } 
; 
gen___closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen___closelist__L44__pair_case0=gen___closelist__L44__pair newline { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__181 ; 
        tmp__181 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case0.result ; 
        $result = tmp__181; 
      } 
    | local__1_gen___closelist__L44__pair_case1=gen___closelist__L44__pair ',' newline local__4_gen___closelist__L44__pair_case1=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__184 ; 
        (ImmediateAST, ImmediateAST) tmp__183 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__182 ; 
        tmp__182 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case1.result ; 
        tmp__183 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__4_gen___closelist__L44__pair_case1.result ; 
        tmp__184 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__182, tmp__183 ); 
        $result = tmp__184; 
      } 
    | local__1_gen___closelist__L44__pair_case2=gen___closelist__L44__pair ',' local__3_gen___closelist__L44__pair_case2=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__187 ; 
        (ImmediateAST, ImmediateAST) tmp__186 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__185 ; 
        tmp__185 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case2.result ; 
        tmp__186 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__3_gen___closelist__L44__pair_case2.result ; 
        tmp__187 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__185, tmp__186 ); 
        $result = tmp__187; 
      } 
    | local__1_gen___closelist__L44__pair_case3=pair { 
        (ImmediateAST, ImmediateAST) tmp__189 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__188 ; 
        tmp__189 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen___closelist__L44__pair_case3.result ; 
        tmp__188 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__189 }; 
        $result = tmp__188; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__190 ; 
        tmp__190 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { }; 
        $result = tmp__190; 
      } 
; 
gen__closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_gen__closelist__L44__expr_case0=gen___closelist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__191 ; 
        tmp__191 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__closelist__L44__expr_case0.result ; 
        $result = tmp__191; 
      } 
; 
gen___closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen___closelist__L44__expr_case0=gen___closelist__L44__expr newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__192 ; 
        tmp__192 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case0.result ; 
        $result = tmp__192; 
      } 
    | local__1_gen___closelist__L44__expr_case1=gen___closelist__L44__expr ',' newline local__4_gen___closelist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__195 ; 
        ImmediateAST tmp__194 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__193 ; 
        tmp__193 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case1.result ; 
        tmp__194 = ( ImmediateAST ) _localctx.local__4_gen___closelist__L44__expr_case1.result ; 
        tmp__195 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__193, tmp__194 ); 
        $result = tmp__195; 
      } 
    | local__1_gen___closelist__L44__expr_case2=gen___closelist__L44__expr ',' local__3_gen___closelist__L44__expr_case2=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__198 ; 
        ImmediateAST tmp__197 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__196 ; 
        tmp__196 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case2.result ; 
        tmp__197 = ( ImmediateAST ) _localctx.local__3_gen___closelist__L44__expr_case2.result ; 
        tmp__198 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__196, tmp__197 ); 
        $result = tmp__198; 
      } 
    | local__1_gen___closelist__L44__expr_case3=expr { 
        ImmediateAST tmp__200 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__199 ; 
        tmp__200 = ( ImmediateAST ) _localctx.local__1_gen___closelist__L44__expr_case3.result ; 
        tmp__199 = new System.Collections.Generic.List<ImmediateAST> { tmp__200 }; 
        $result = tmp__199; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__201 ; 
        tmp__201 = new System.Collections.Generic.List<ImmediateAST> { }; 
        $result = tmp__201; 
      } 
; 
pair returns [(ImmediateAST, ImmediateAST) result] :
      local__1_pair_case0=expr gen__line_wrap__L58 local__3_pair_case0=expr { 
        ImmediateAST tmp__204 ; 
        ImmediateAST tmp__203 ; 
        (ImmediateAST, ImmediateAST) tmp__202 ; 
        tmp__203 = ( ImmediateAST ) _localctx.local__1_pair_case0.result ; 
        tmp__204 = ( ImmediateAST ) _localctx.local__3_pair_case0.result ; 
        tmp__202 = ( tmp__203 , tmp__204 ); 
        $result = tmp__202; 
      } 
; 
gen__line_wrap__L58 returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap__L58_case0=':' gen__optional_newline { 
        CommonToken tmp__205 ; 
        tmp__205 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L58_case0 ; 
        $result = tmp__205; 
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
        ImmediateAST tmp__207 ; 
        System.Collections.Generic.List<object> tmp__206 ; 
        tmp__206 = ( System.Collections.Generic.List<object> ) _localctx.local__1_bin_case0.result ; 
        tmp__207 = (ImmediateAST) resolve_binop( tmp__206 ); 
        $result = tmp__207; 
      } 
; 
binseq returns [System.Collections.Generic.List<object> result] :
      local__1_binseq_case0=atom { 
        System.Collections.Generic.List<object> tmp__211 ; 
        object tmp__210 ; 
        ImmediateAST tmp__209 ; 
        System.Collections.Generic.List<object> tmp__208 ; 
        tmp__208 = (System.Collections.Generic.List<object>) empty<object>(  ); 
        tmp__209 = ( ImmediateAST ) _localctx.local__1_binseq_case0.result ; 
        tmp__210 = (object) to_obj<ImmediateAST>( tmp__209 ); 
        tmp__211 = (System.Collections.Generic.List<object>) append<object>( tmp__208, tmp__210 ); 
        $result = tmp__211; 
      } 
    | local__1_binseq_case1=binseq local__2_binseq_case1=binop local__3_binseq_case1=atom { 
        object tmp__217 ; 
        ImmediateAST tmp__216 ; 
        System.Collections.Generic.List<object> tmp__215 ; 
        System.Collections.Generic.List<object> block__212 ; 
        object tmp__214 ; 
        System.Collections.Generic.List<object> tmp__213 ; 
        tmp__213 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__214 = ( object ) _localctx.local__2_binseq_case1.result ; 
        block__212 = (System.Collections.Generic.List<object>) append<object>( tmp__213, tmp__214 ); 
        tmp__215 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__216 = ( ImmediateAST ) _localctx.local__3_binseq_case1.result ; 
        tmp__217 = (object) to_obj<ImmediateAST>( tmp__216 ); 
        block__212 = (System.Collections.Generic.List<object>) append<object>( tmp__215, tmp__217 ); 
        $result = block__212; 
      } 
; 
ibin returns [ImmediateAST result] :
      local__1_ibin_case0=lhs local__2_ibin_case0=ibinop local__3_ibin_case0='=' local__4_ibin_case0=expr { 
        ImmediateAST tmp__222 ; 
        ImmediateAST tmp__221 ; 
        string tmp__220 ; 
        ImmediateAST tmp__219 ; 
        CommonToken tmp__218 ; 
        tmp__218 = ( CommonToken ) _localctx.local__3_ibin_case0 ; 
        tmp__219 = ( ImmediateAST ) _localctx.local__1_ibin_case0.result ; 
        tmp__220 = ( string ) _localctx.local__2_ibin_case0.result ; 
        tmp__221 = ( ImmediateAST ) _localctx.local__4_ibin_case0.result ; 
        tmp__222 = (ImmediateAST) mkIBin( tmp__218, tmp__219, tmp__220, tmp__221 ); 
        $result = tmp__222; 
      } 
; 
ibinop returns [string result] :
      local__1_ibinop_case0=SINGLE_BINOP_2 { 
        CommonToken tmp__223 ; 
        tmp__223 = ( CommonToken ) _localctx.local__1_ibinop_case0 ; 
        $result = tmp__223.Text; 
      } 
    | '-' { 
        string tmp__224 ; 
        tmp__224 = "-" ; 
        $result = tmp__224; 
      } 
; 
binop returns [object result] :
      local__1_binop_case0=SINGLE_BINOP_2 { 
        object tmp__227 ; 
        CommonToken tmp__226 ; 
        CommonToken tmp__225 ; 
        tmp__225 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__226 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__227 = (object) mkop( tmp__225, tmp__226.Text ); 
        $result = tmp__227; 
      } 
    | local__1_binop_case1='not' 'in' { 
        object tmp__230 ; 
        string tmp__229 ; 
        CommonToken tmp__228 ; 
        tmp__228 = ( CommonToken ) _localctx.local__1_binop_case1 ; 
        tmp__229 = "notin" ; 
        tmp__230 = (object) mkop( tmp__228, tmp__229 ); 
        $result = tmp__230; 
      } 
    | local__1_binop_case2='in' { 
        object tmp__233 ; 
        string tmp__232 ; 
        CommonToken tmp__231 ; 
        tmp__231 = ( CommonToken ) _localctx.local__1_binop_case2 ; 
        tmp__232 = "in" ; 
        tmp__233 = (object) mkop( tmp__231, tmp__232 ); 
        $result = tmp__233; 
      } 
    | local__1_binop_case3='-' { 
        object tmp__236 ; 
        string tmp__235 ; 
        CommonToken tmp__234 ; 
        tmp__234 = ( CommonToken ) _localctx.local__1_binop_case3 ; 
        tmp__235 = "-" ; 
        tmp__236 = (object) mkop( tmp__234, tmp__235 ); 
        $result = tmp__236; 
      } 
; 
not returns [ImmediateAST result] :
      local__1_not_case0='not' local__2_not_case0=not { 
        ImmediateAST tmp__239 ; 
        ImmediateAST tmp__238 ; 
        CommonToken tmp__237 ; 
        tmp__237 = ( CommonToken ) _localctx.local__1_not_case0 ; 
        tmp__238 = ( ImmediateAST ) _localctx.local__2_not_case0.result ; 
        tmp__239 = (ImmediateAST) mkNot( tmp__237, tmp__238 ); 
        $result = tmp__239; 
      } 
    | local__1_not_case1=bin { 
        ImmediateAST tmp__240 ; 
        tmp__240 = ( ImmediateAST ) _localctx.local__1_not_case1.result ; 
        $result = tmp__240; 
      } 
; 
and_expr returns [ImmediateAST result] :
      local__1_and_expr_case0=and_expr local__2_and_expr_case0='and' local__3_and_expr_case0=not { 
        ImmediateAST tmp__244 ; 
        ImmediateAST tmp__243 ; 
        ImmediateAST tmp__242 ; 
        CommonToken tmp__241 ; 
        tmp__241 = ( CommonToken ) _localctx.local__2_and_expr_case0 ; 
        tmp__242 = ( ImmediateAST ) _localctx.local__1_and_expr_case0.result ; 
        tmp__243 = ( ImmediateAST ) _localctx.local__3_and_expr_case0.result ; 
        tmp__244 = (ImmediateAST) mkAnd( tmp__241, tmp__242, tmp__243 ); 
        $result = tmp__244; 
      } 
    | local__1_and_expr_case1=not { 
        ImmediateAST tmp__245 ; 
        tmp__245 = ( ImmediateAST ) _localctx.local__1_and_expr_case1.result ; 
        $result = tmp__245; 
      } 
; 
or_expr returns [ImmediateAST result] :
      local__1_or_expr_case0=or_expr local__2_or_expr_case0='or' local__3_or_expr_case0=and_expr { 
        ImmediateAST tmp__249 ; 
        ImmediateAST tmp__248 ; 
        ImmediateAST tmp__247 ; 
        CommonToken tmp__246 ; 
        tmp__246 = ( CommonToken ) _localctx.local__2_or_expr_case0 ; 
        tmp__247 = ( ImmediateAST ) _localctx.local__1_or_expr_case0.result ; 
        tmp__248 = ( ImmediateAST ) _localctx.local__3_or_expr_case0.result ; 
        tmp__249 = (ImmediateAST) mkAnd( tmp__246, tmp__247, tmp__248 ); 
        $result = tmp__249; 
      } 
    | local__1_or_expr_case1=and_expr { 
        ImmediateAST tmp__250 ; 
        tmp__250 = ( ImmediateAST ) _localctx.local__1_or_expr_case1.result ; 
        $result = tmp__250; 
      } 
; 
block returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_block_case0=gen__filter_stmt__gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__251 ; 
        tmp__251 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_block_case0.result ; 
        $result = tmp__251; 
      } 
; 
gen__filter_stmt__gen__or___L59__newline returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__filter_stmt__gen__or___L59__newline_case0=gen__filter_stmt__gen__or___L59__newline local__2_gen__filter_stmt__gen__or___L59__newline_case0=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__254 ; 
        ImmediateAST tmp__253 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__252 ; 
        tmp__252 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case0.result ; 
        tmp__253 = ( ImmediateAST ) _localctx.local__2_gen__filter_stmt__gen__or___L59__newline_case0.result ; 
        tmp__254 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__252, tmp__253 ); 
        $result = tmp__254; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__newline_case1=gen__filter_stmt__gen__or___L59__newline gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__255 ; 
        tmp__255 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case1.result ; 
        $result = tmp__255; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__newline_case2=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__258 ; 
        ImmediateAST tmp__257 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__256 ; 
        tmp__256 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__257 = ( ImmediateAST ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case2.result ; 
        tmp__258 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__256, tmp__257 ); 
        $result = tmp__258; 
      } 
    | gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__259 ; 
        tmp__259 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__259; 
      } 
; 
gen__or___L59__newline returns [int result] :
      ';' { 
        int tmp__260 ; 
        tmp__260 = 0 ; 
        $result = tmp__260; 
      } 
    | newline { 
        int tmp__261 ; 
        tmp__261 = 0 ; 
        $result = tmp__261; 
      } 
; 
lhs returns [ImmediateAST result] :
      local__1_lhs_case0=NAME_13 { 
        ImmediateAST tmp__264 ; 
        CommonToken tmp__263 ; 
        CommonToken tmp__262 ; 
        tmp__262 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__263 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__264 = (ImmediateAST) mkVar( tmp__262, tmp__263.Text ); 
        $result = tmp__264; 
      } 
    | local__1_lhs_case1=atom local__2_lhs_case1='.' '[' local__4_lhs_case1=expr ']' { 
        ImmediateAST tmp__268 ; 
        ImmediateAST tmp__267 ; 
        ImmediateAST tmp__266 ; 
        CommonToken tmp__265 ; 
        tmp__265 = ( CommonToken ) _localctx.local__2_lhs_case1 ; 
        tmp__266 = ( ImmediateAST ) _localctx.local__1_lhs_case1.result ; 
        tmp__267 = ( ImmediateAST ) _localctx.local__4_lhs_case1.result ; 
        tmp__268 = (ImmediateAST) mkOGet( tmp__265, tmp__266, tmp__267 ); 
        $result = tmp__268; 
      } 
    | local__1_lhs_case2=atom local__2_lhs_case2='.' local__3_lhs_case2=NAME_13 { 
        ImmediateAST tmp__275 ; 
        ImmediateAST tmp__274 ; 
        DObj tmp__273 ; 
        CommonToken tmp__272 ; 
        CommonToken tmp__271 ; 
        ImmediateAST tmp__270 ; 
        CommonToken tmp__269 ; 
        tmp__269 = ( CommonToken ) _localctx.local__2_lhs_case2 ; 
        tmp__270 = ( ImmediateAST ) _localctx.local__1_lhs_case2.result ; 
        tmp__271 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__272 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__273 = (DObj) mkstr( tmp__272.Text ); 
        tmp__274 = (ImmediateAST) mkVal( tmp__271, tmp__273 ); 
        tmp__275 = (ImmediateAST) mkOGet( tmp__269, tmp__270, tmp__274 ); 
        $result = tmp__275; 
      } 
; 
do returns [CommonToken result] :
      gen__optional_newline local__2_do_case0='do' { 
        CommonToken tmp__276 ; 
        tmp__276 = ( CommonToken ) _localctx.local__2_do_case0 ; 
        $result = tmp__276; 
      } 
; 
then returns [CommonToken result] :
      gen__optional_newline local__2_then_case0='then' { 
        CommonToken tmp__277 ; 
        tmp__277 = ( CommonToken ) _localctx.local__2_then_case0 ; 
        $result = tmp__277; 
      } 
; 
gen__blockOf_do returns [ImmediateAST result] :
      local__1_gen__blockOf_do_case0=do local__2_gen__blockOf_do_case0=block { 
        ImmediateAST tmp__280 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__279 ; 
        CommonToken tmp__278 ; 
        tmp__278 = ( CommonToken ) _localctx.local__1_gen__blockOf_do_case0.result ; 
        tmp__279 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_do_case0.result ; 
        tmp__280 = (ImmediateAST) mkBlock( tmp__278, tmp__279 ); 
        $result = tmp__280; 
      } 
; 
name returns [string result] :
      local__1_name_case0=NAME_13 { 
        CommonToken tmp__281 ; 
        tmp__281 = ( CommonToken ) _localctx.local__1_name_case0 ; 
        $result = tmp__281.Text; 
      } 
; 
elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      local__1_elifBlock_case0=expr local__2_elifBlock_case0=gen__blockOf_then { 
        ImmediateAST tmp__284 ; 
        ImmediateAST tmp__283 ; 
        (ImmediateAST, ImmediateAST) tmp__282 ; 
        tmp__283 = ( ImmediateAST ) _localctx.local__1_elifBlock_case0.result ; 
        tmp__284 = ( ImmediateAST ) _localctx.local__2_elifBlock_case0.result ; 
        tmp__282 = ( tmp__283 , tmp__284 ); 
        $result = tmp__282; 
      } 
; 
gen__blockOf_then returns [ImmediateAST result] :
      local__1_gen__blockOf_then_case0=then local__2_gen__blockOf_then_case0=block { 
        ImmediateAST tmp__287 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__286 ; 
        CommonToken tmp__285 ; 
        tmp__285 = ( CommonToken ) _localctx.local__1_gen__blockOf_then_case0.result ; 
        tmp__286 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_then_case0.result ; 
        tmp__287 = (ImmediateAST) mkBlock( tmp__285, tmp__286 ); 
        $result = tmp__287; 
      } 
; 
lhs_seq returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_lhs_seq_case0=lhs_seq local__2_lhs_seq_case0=lhs '=' { 
        System.Collections.Generic.List<ImmediateAST> tmp__290 ; 
        ImmediateAST tmp__289 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__288 ; 
        tmp__288 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_lhs_seq_case0.result ; 
        tmp__289 = ( ImmediateAST ) _localctx.local__2_lhs_seq_case0.result ; 
        tmp__290 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__288, tmp__289 ); 
        $result = tmp__290; 
      } 
    | local__1_lhs_seq_case1=lhs '=' { 
        ImmediateAST tmp__292 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__291 ; 
        tmp__292 = ( ImmediateAST ) _localctx.local__1_lhs_seq_case1.result ; 
        tmp__291 = new System.Collections.Generic.List<ImmediateAST> { tmp__292 }; 
        $result = tmp__291; 
      } 
; 
start returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_start_case0=gen__nullable_gen__seplist_newline__stmt gen__optional_newline EOF { 
        System.Collections.Generic.List<ImmediateAST> tmp__293 ; 
        tmp__293 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_start_case0.result ; 
        $result = tmp__293; 
      } 
; 
gen__nullable_gen__seplist_newline__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__nullable_gen__seplist_newline__stmt_case0=gen__seplist_newline__stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__294 ; 
        tmp__294 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist_newline__stmt_case0.result ; 
        $result = tmp__294; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__295 ; 
        tmp__295 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__295; 
      } 
; 
gen__seplist_newline__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_newline__stmt_case0=stmt { 
        ImmediateAST tmp__297 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__296 ; 
        tmp__297 = ( ImmediateAST ) _localctx.local__1_gen__seplist_newline__stmt_case0.result ; 
        tmp__296 = new System.Collections.Generic.List<ImmediateAST> { tmp__297 }; 
        $result = tmp__296; 
      } 
    | local__1_gen__seplist_newline__stmt_case1=gen__seplist_newline__stmt newline local__3_gen__seplist_newline__stmt_case1=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__300 ; 
        ImmediateAST tmp__299 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__298 ; 
        tmp__298 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_newline__stmt_case1.result ; 
        tmp__299 = ( ImmediateAST ) _localctx.local__3_gen__seplist_newline__stmt_case1.result ; 
        tmp__300 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__298, tmp__299 ); 
        $result = tmp__300; 
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


