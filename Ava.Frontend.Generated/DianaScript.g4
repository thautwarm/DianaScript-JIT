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
    | '__SETMETA' local__2_stmt_case1=INT_10 ':' local__4_stmt_case1=INT_10 ':' local__6_stmt_case1=INT_10 'do' local__8_stmt_case1=stmt { 
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
        ImmediateAST tmp__45 ; 
        tmp__45 = ( ImmediateAST ) _localctx.local__1_stmt_case12.result ; 
        $result = tmp__45; 
      } 
; 
newline returns [CommonToken result] :
      local__1_newline_case0=NEWLINE_17 { 
        CommonToken tmp__46 ; 
        tmp__46 = ( CommonToken ) _localctx.local__1_newline_case0 ; 
        $result = tmp__46; 
      } 
    | newline local__2_newline_case1=NEWLINE_17 { 
        CommonToken tmp__47 ; 
        tmp__47 = ( CommonToken ) _localctx.local__2_newline_case1 ; 
        $result = tmp__47; 
      } 
; 
atom returns [ImmediateAST result] :
      local__1_atom_case0=atom local__2_atom_case0='.' '[' local__4_atom_case0=expr ']' { 
        ImmediateAST tmp__51 ; 
        ImmediateAST tmp__50 ; 
        ImmediateAST tmp__49 ; 
        CommonToken tmp__48 ; 
        tmp__48 = ( CommonToken ) _localctx.local__2_atom_case0 ; 
        tmp__49 = ( ImmediateAST ) _localctx.local__1_atom_case0.result ; 
        tmp__50 = ( ImmediateAST ) _localctx.local__4_atom_case0.result ; 
        tmp__51 = (ImmediateAST) mkOGet( tmp__48, tmp__49, tmp__50 ); 
        $result = tmp__51; 
      } 
    | local__1_atom_case1=atom local__2_atom_case1='.' local__3_atom_case1=NAME_13 { 
        ImmediateAST tmp__58 ; 
        ImmediateAST tmp__57 ; 
        DObj tmp__56 ; 
        CommonToken tmp__55 ; 
        CommonToken tmp__54 ; 
        ImmediateAST tmp__53 ; 
        CommonToken tmp__52 ; 
        tmp__52 = ( CommonToken ) _localctx.local__2_atom_case1 ; 
        tmp__53 = ( ImmediateAST ) _localctx.local__1_atom_case1.result ; 
        tmp__54 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__55 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__56 = (DObj) mkstr( tmp__55.Text ); 
        tmp__57 = (ImmediateAST) mkVal( tmp__54, tmp__56 ); 
        tmp__58 = (ImmediateAST) mkOGet( tmp__52, tmp__53, tmp__57 ); 
        $result = tmp__58; 
      } 
    | local__1_atom_case2=atom local__2_atom_case2='(' local__3_atom_case2=gen__closelist__L44__expr ')' { 
        ImmediateAST tmp__62 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__61 ; 
        ImmediateAST tmp__60 ; 
        CommonToken tmp__59 ; 
        tmp__59 = ( CommonToken ) _localctx.local__2_atom_case2 ; 
        tmp__60 = ( ImmediateAST ) _localctx.local__1_atom_case2.result ; 
        tmp__61 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__3_atom_case2.result ; 
        tmp__62 = (ImmediateAST) mkApp( tmp__59, tmp__60, tmp__61 ); 
        $result = tmp__62; 
      } 
    | local__1_atom_case3='[' local__2_atom_case3=gen__closelist__L44__expr ']' { 
        ImmediateAST tmp__65 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__64 ; 
        CommonToken tmp__63 ; 
        tmp__63 = ( CommonToken ) _localctx.local__1_atom_case3 ; 
        tmp__64 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case3.result ; 
        tmp__65 = (ImmediateAST) mkList( tmp__63, tmp__64 ); 
        $result = tmp__65; 
      } 
    | local__1_atom_case4='(' local__2_atom_case4=gen__closelist__L44__expr local__3_atom_case4=trailer ')' { 
        ImmediateAST tmp__69 ; 
        bool tmp__68 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__67 ; 
        CommonToken tmp__66 ; 
        tmp__66 = ( CommonToken ) _localctx.local__1_atom_case4 ; 
        tmp__67 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case4.result ; 
        tmp__68 = ( bool ) _localctx.local__3_atom_case4.result ; 
        tmp__69 = (ImmediateAST) mkTuple( tmp__66, tmp__67, tmp__68 ); 
        $result = tmp__69; 
      } 
    | local__1_atom_case5='{|' local__2_atom_case5=gen__closelist__L44__pair trailer '|}' { 
        ImmediateAST tmp__72 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__71 ; 
        CommonToken tmp__70 ; 
        tmp__70 = ( CommonToken ) _localctx.local__1_atom_case5 ; 
        tmp__71 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case5.result ; 
        tmp__72 = (ImmediateAST) mkStrDict( tmp__70, tmp__71 ); 
        $result = tmp__72; 
      } 
    | local__1_atom_case6='{' local__2_atom_case6=gen__closelist__L44__pair trailer '}' { 
        ImmediateAST tmp__75 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__74 ; 
        CommonToken tmp__73 ; 
        tmp__73 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__74 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case6.result ; 
        tmp__75 = (ImmediateAST) mkDict( tmp__73, tmp__74 ); 
        $result = tmp__75; 
      } 
    | local__1_atom_case7='{' local__2_atom_case7=gen__closelist__L44__expr '}' { 
        ImmediateAST tmp__78 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__77 ; 
        CommonToken tmp__76 ; 
        tmp__76 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__77 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case7.result ; 
        tmp__78 = (ImmediateAST) mkSet( tmp__76, tmp__77 ); 
        $result = tmp__78; 
      } 
    | local__1_atom_case8=STR_4 { 
        ImmediateAST tmp__83 ; 
        DObj tmp__82 ; 
        string tmp__81 ; 
        CommonToken tmp__80 ; 
        CommonToken tmp__79 ; 
        tmp__79 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__80 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__81 = (string) unesc( tmp__80.Text ); 
        tmp__82 = (DObj) mkstr( tmp__81 ); 
        tmp__83 = (ImmediateAST) mkVal( tmp__79, tmp__82 ); 
        $result = tmp__83; 
      } 
    | local__1_atom_case9=INT_10 { 
        ImmediateAST tmp__88 ; 
        DObj tmp__87 ; 
        int tmp__86 ; 
        CommonToken tmp__85 ; 
        CommonToken tmp__84 ; 
        tmp__84 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__85 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__86 = 0 ; 
        tmp__87 = (DObj) mkint( tmp__85.Text, tmp__86 ); 
        tmp__88 = (ImmediateAST) mkVal( tmp__84, tmp__87 ); 
        $result = tmp__88; 
      } 
    | local__1_atom_case10=HEX_7 { 
        ImmediateAST tmp__93 ; 
        DObj tmp__92 ; 
        int tmp__91 ; 
        CommonToken tmp__90 ; 
        CommonToken tmp__89 ; 
        tmp__89 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__90 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__91 = 16 ; 
        tmp__92 = (DObj) mkint( tmp__90.Text, tmp__91 ); 
        tmp__93 = (ImmediateAST) mkVal( tmp__89, tmp__92 ); 
        $result = tmp__93; 
      } 
    | local__1_atom_case11=OCT_8 { 
        ImmediateAST tmp__98 ; 
        DObj tmp__97 ; 
        int tmp__96 ; 
        CommonToken tmp__95 ; 
        CommonToken tmp__94 ; 
        tmp__94 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__95 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__96 = 8 ; 
        tmp__97 = (DObj) mkint( tmp__95.Text, tmp__96 ); 
        tmp__98 = (ImmediateAST) mkVal( tmp__94, tmp__97 ); 
        $result = tmp__98; 
      } 
    | local__1_atom_case12=BIN_9 { 
        ImmediateAST tmp__103 ; 
        DObj tmp__102 ; 
        int tmp__101 ; 
        CommonToken tmp__100 ; 
        CommonToken tmp__99 ; 
        tmp__99 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__100 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__101 = 2 ; 
        tmp__102 = (DObj) mkint( tmp__100.Text, tmp__101 ); 
        tmp__103 = (ImmediateAST) mkVal( tmp__99, tmp__102 ); 
        $result = tmp__103; 
      } 
    | local__1_atom_case13=FLOAT_11 { 
        ImmediateAST tmp__107 ; 
        DObj tmp__106 ; 
        CommonToken tmp__105 ; 
        CommonToken tmp__104 ; 
        tmp__104 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__105 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__106 = (DObj) mkfloat( tmp__105.Text ); 
        tmp__107 = (ImmediateAST) mkVal( tmp__104, tmp__106 ); 
        $result = tmp__107; 
      } 
    | local__1_atom_case14='None' { 
        ImmediateAST tmp__110 ; 
        DObj tmp__109 ; 
        CommonToken tmp__108 ; 
        tmp__108 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__109 = (DObj) mknone(  ); 
        tmp__110 = (ImmediateAST) mkVal( tmp__108, tmp__109 ); 
        $result = tmp__110; 
      } 
    | local__1_atom_case15=NAME_13 { 
        ImmediateAST tmp__113 ; 
        CommonToken tmp__112 ; 
        CommonToken tmp__111 ; 
        tmp__111 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__112 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__113 = (ImmediateAST) mkVar( tmp__111, tmp__112.Text ); 
        $result = tmp__113; 
      } 
    | local__1_atom_case16='-' local__2_atom_case16=atom { 
        ImmediateAST tmp__116 ; 
        ImmediateAST tmp__115 ; 
        CommonToken tmp__114 ; 
        tmp__114 = ( CommonToken ) _localctx.local__1_atom_case16 ; 
        tmp__115 = ( ImmediateAST ) _localctx.local__2_atom_case16.result ; 
        tmp__116 = (ImmediateAST) mkNeg( tmp__114, tmp__115 ); 
        $result = tmp__116; 
      } 
    | local__1_atom_case17='~' local__2_atom_case17=atom { 
        ImmediateAST tmp__119 ; 
        ImmediateAST tmp__118 ; 
        CommonToken tmp__117 ; 
        tmp__117 = ( CommonToken ) _localctx.local__1_atom_case17 ; 
        tmp__118 = ( ImmediateAST ) _localctx.local__2_atom_case17.result ; 
        tmp__119 = (ImmediateAST) mkInv( tmp__117, tmp__118 ); 
        $result = tmp__119; 
      } 
    | local__1_atom_case18='if' local__2_atom_case18=expr local__3_atom_case18=then local__4_atom_case18=block 'end' { 
        ImmediateAST tmp__125 ; 
        ImmediateAST tmp__124 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__123 ; 
        CommonToken tmp__122 ; 
        ImmediateAST tmp__121 ; 
        CommonToken tmp__120 ; 
        tmp__120 = ( CommonToken ) _localctx.local__1_atom_case18 ; 
        tmp__121 = ( ImmediateAST ) _localctx.local__2_atom_case18.result ; 
        tmp__122 = ( CommonToken ) _localctx.local__3_atom_case18.result ; 
        tmp__123 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case18.result ; 
        tmp__124 = (ImmediateAST) mkBlock( tmp__122, tmp__123 ); 
        tmp__125 = (ImmediateAST) mkIfThen( tmp__120, tmp__121, tmp__124 ); 
        $result = tmp__125; 
      } 
    | local__1_atom_case19='if' local__2_atom_case19=expr local__3_atom_case19=then local__4_atom_case19=block local__5_atom_case19=gen__nullable_gen__list_gen__snd_elif__elifBlock local__6_atom_case19=gen__optional_gen__blockOf_else 'end' { 
        ImmediateAST tmp__137 ; 
        ImmediateAST tmp__136 ; 
        CommonToken tmp__135 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__133 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__134 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__131 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__132 ; 
        ImmediateAST tmp__130 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__129 ; 
        CommonToken tmp__128 ; 
        ImmediateAST tmp__127 ; 
        (ImmediateAST, ImmediateAST) elif__126 ; 
        tmp__127 = ( ImmediateAST ) _localctx.local__2_atom_case19.result ; 
        tmp__128 = ( CommonToken ) _localctx.local__3_atom_case19.result ; 
        tmp__129 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case19.result ; 
        tmp__130 = (ImmediateAST) mkBlock( tmp__128, tmp__129 ); 
        elif__126 = ( tmp__127 , tmp__130 ); 
        tmp__132 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        elifs__131 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__132, elif__126 ); 
        tmp__134 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__5_atom_case19.result ; 
        elifs__133 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) extend<(ImmediateAST, ImmediateAST)>( elifs__131, tmp__134 ); 
        tmp__135 = ( CommonToken ) _localctx.local__1_atom_case19 ; 
        tmp__136 = ( ImmediateAST ) _localctx.local__6_atom_case19.result ; 
        tmp__137 = (ImmediateAST) mkNestedIf( tmp__135, elifs__131, tmp__136 ); 
        $result = tmp__137; 
      } 
    | local__1_atom_case20='fun' local__2_atom_case20=name '(' local__4_atom_case20=gen__nullable_gen__seplist__L44__name ')' local__6_atom_case20=block 'end' { 
        ImmediateAST tmp__142 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__141 ; 
        System.Collections.Generic.List<string> tmp__140 ; 
        string tmp__139 ; 
        CommonToken tmp__138 ; 
        tmp__138 = ( CommonToken ) _localctx.local__1_atom_case20 ; 
        tmp__139 = ( string ) _localctx.local__2_atom_case20.result ; 
        tmp__140 = ( System.Collections.Generic.List<string> ) _localctx.local__4_atom_case20.result ; 
        tmp__141 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__6_atom_case20.result ; 
        tmp__142 = (ImmediateAST) mkFunc( tmp__138, tmp__139, tmp__140, tmp__141 ); 
        $result = tmp__142; 
      } 
    | local__1_atom_case21='fun' '(' local__3_atom_case21=gen__nullable_gen__seplist__L44__name ')' local__5_atom_case21=block 'end' { 
        ImmediateAST tmp__147 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__146 ; 
        System.Collections.Generic.List<string> tmp__145 ; 
        string tmp__144 ; 
        CommonToken tmp__143 ; 
        tmp__143 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__144 = "" ; 
        tmp__145 = ( System.Collections.Generic.List<string> ) _localctx.local__3_atom_case21.result ; 
        tmp__146 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__5_atom_case21.result ; 
        tmp__147 = (ImmediateAST) mkFunc( tmp__143, tmp__144, tmp__145, tmp__146 ); 
        $result = tmp__147; 
      } 
    | local__1_atom_case22='(' local__2_atom_case22=gen__nullable_gen__seplist__L44__name ')' '->' local__5_atom_case22=gen__line_wrap_expr { 
        ImmediateAST tmp__153 ; 
        ImmediateAST tmp__152 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__151 ; 
        System.Collections.Generic.List<string> tmp__150 ; 
        string tmp__149 ; 
        CommonToken tmp__148 ; 
        tmp__148 = ( CommonToken ) _localctx.local__1_atom_case22 ; 
        tmp__149 = "" ; 
        tmp__150 = ( System.Collections.Generic.List<string> ) _localctx.local__2_atom_case22.result ; 
        tmp__152 = ( ImmediateAST ) _localctx.local__5_atom_case22.result ; 
        tmp__151 = new System.Collections.Generic.List<ImmediateAST> { tmp__152 }; 
        tmp__153 = (ImmediateAST) mkFunc( tmp__148, tmp__149, tmp__150, tmp__151 ); 
        $result = tmp__153; 
      } 
    | local__1_atom_case23=NAME_13 '->' local__3_atom_case23=gen__line_wrap_expr { 
        ImmediateAST tmp__160 ; 
        ImmediateAST tmp__159 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__158 ; 
        CommonToken tmp__157 ; 
        System.Collections.Generic.List<string> tmp__156 ; 
        string tmp__155 ; 
        CommonToken tmp__154 ; 
        tmp__154 = ( CommonToken ) _localctx.local__1_atom_case23 ; 
        tmp__155 = "" ; 
        tmp__157 = ( CommonToken ) _localctx.local__1_atom_case23 ; 
        tmp__156 = new System.Collections.Generic.List<string> { tmp__157.Text }; 
        tmp__159 = ( ImmediateAST ) _localctx.local__3_atom_case23.result ; 
        tmp__158 = new System.Collections.Generic.List<ImmediateAST> { tmp__159 }; 
        tmp__160 = (ImmediateAST) mkFunc( tmp__154, tmp__155, tmp__156, tmp__158 ); 
        $result = tmp__160; 
      } 
; 
gen__line_wrap_expr returns [ImmediateAST result] :
      gen__optional_newline local__2_gen__line_wrap_expr_case0=expr gen__optional_newline { 
        ImmediateAST tmp__161 ; 
        tmp__161 = ( ImmediateAST ) _localctx.local__2_gen__line_wrap_expr_case0.result ; 
        $result = tmp__161; 
      } 
; 
gen__optional_newline returns [CommonToken result] :
      local__1_gen__optional_newline_case0=newline { 
        CommonToken tmp__162 ; 
        tmp__162 = ( CommonToken ) _localctx.local__1_gen__optional_newline_case0.result ; 
        $result = tmp__162; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__nullable_gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__nullable_gen__seplist__L44__name_case0=gen__seplist__L44__name { 
        System.Collections.Generic.List<string> tmp__163 ; 
        tmp__163 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__nullable_gen__seplist__L44__name_case0.result ; 
        $result = tmp__163; 
      } 
    | { 
        System.Collections.Generic.List<string> tmp__164 ; 
        tmp__164 = (System.Collections.Generic.List<string>) empty<string>(  ); 
        $result = tmp__164; 
      } 
; 
gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__seplist__L44__name_case0=name { 
        string tmp__166 ; 
        System.Collections.Generic.List<string> tmp__165 ; 
        tmp__166 = ( string ) _localctx.local__1_gen__seplist__L44__name_case0.result ; 
        tmp__165 = new System.Collections.Generic.List<string> { tmp__166 }; 
        $result = tmp__165; 
      } 
    | local__1_gen__seplist__L44__name_case1=gen__seplist__L44__name ',' local__3_gen__seplist__L44__name_case1=name { 
        System.Collections.Generic.List<string> tmp__169 ; 
        string tmp__168 ; 
        System.Collections.Generic.List<string> tmp__167 ; 
        tmp__167 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__seplist__L44__name_case1.result ; 
        tmp__168 = ( string ) _localctx.local__3_gen__seplist__L44__name_case1.result ; 
        tmp__169 = (System.Collections.Generic.List<string>) append<string>( tmp__167, tmp__168 ); 
        $result = tmp__169; 
      } 
; 
gen__optional_gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__optional_gen__blockOf_else_case0=gen__blockOf_else { 
        ImmediateAST tmp__170 ; 
        tmp__170 = ( ImmediateAST ) _localctx.local__1_gen__optional_gen__blockOf_else_case0.result ; 
        $result = tmp__170; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__blockOf_else_case0='else' local__2_gen__blockOf_else_case0=block { 
        ImmediateAST tmp__173 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__172 ; 
        CommonToken tmp__171 ; 
        tmp__171 = ( CommonToken ) _localctx.local__1_gen__blockOf_else_case0 ; 
        tmp__172 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_else_case0.result ; 
        tmp__173 = (ImmediateAST) mkBlock( tmp__171, tmp__172 ); 
        $result = tmp__173; 
      } 
; 
gen__nullable_gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0=gen__list_gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__174 ; 
        tmp__174 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__174; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__175 ; 
        tmp__175 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__175; 
      } 
; 
gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__list_gen__snd_elif__elifBlock_case0=gen__snd_elif__elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__177 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__176 ; 
        tmp__177 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        tmp__176 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__177 }; 
        $result = tmp__176; 
      } 
    | local__1_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock local__2_gen__list_gen__snd_elif__elifBlock_case1=gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__180 ; 
        (ImmediateAST, ImmediateAST) tmp__179 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__178 ; 
        tmp__178 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__179 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__180 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__178, tmp__179 ); 
        $result = tmp__180; 
      } 
; 
gen__snd_elif__elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      'elif' local__2_gen__snd_elif__elifBlock_case0=elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__181 ; 
        tmp__181 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__181; 
      } 
; 
gen__closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      gen__optional_newline local__2_gen__closelist__L44__pair_case0=gen___closelist__L44__pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__182 ; 
        tmp__182 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_gen__closelist__L44__pair_case0.result ; 
        $result = tmp__182; 
      } 
; 
gen___closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen___closelist__L44__pair_case0=gen___closelist__L44__pair newline { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__183 ; 
        tmp__183 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case0.result ; 
        $result = tmp__183; 
      } 
    | local__1_gen___closelist__L44__pair_case1=gen___closelist__L44__pair ',' newline local__4_gen___closelist__L44__pair_case1=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__186 ; 
        (ImmediateAST, ImmediateAST) tmp__185 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__184 ; 
        tmp__184 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case1.result ; 
        tmp__185 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__4_gen___closelist__L44__pair_case1.result ; 
        tmp__186 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__184, tmp__185 ); 
        $result = tmp__186; 
      } 
    | local__1_gen___closelist__L44__pair_case2=gen___closelist__L44__pair ',' local__3_gen___closelist__L44__pair_case2=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__189 ; 
        (ImmediateAST, ImmediateAST) tmp__188 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__187 ; 
        tmp__187 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case2.result ; 
        tmp__188 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__3_gen___closelist__L44__pair_case2.result ; 
        tmp__189 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__187, tmp__188 ); 
        $result = tmp__189; 
      } 
    | local__1_gen___closelist__L44__pair_case3=pair { 
        (ImmediateAST, ImmediateAST) tmp__191 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__190 ; 
        tmp__191 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen___closelist__L44__pair_case3.result ; 
        tmp__190 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__191 }; 
        $result = tmp__190; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__192 ; 
        tmp__192 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { }; 
        $result = tmp__192; 
      } 
; 
gen__closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_gen__closelist__L44__expr_case0=gen___closelist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__193 ; 
        tmp__193 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__closelist__L44__expr_case0.result ; 
        $result = tmp__193; 
      } 
; 
gen___closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen___closelist__L44__expr_case0=gen___closelist__L44__expr newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__194 ; 
        tmp__194 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case0.result ; 
        $result = tmp__194; 
      } 
    | local__1_gen___closelist__L44__expr_case1=gen___closelist__L44__expr ',' newline local__4_gen___closelist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__197 ; 
        ImmediateAST tmp__196 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__195 ; 
        tmp__195 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case1.result ; 
        tmp__196 = ( ImmediateAST ) _localctx.local__4_gen___closelist__L44__expr_case1.result ; 
        tmp__197 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__195, tmp__196 ); 
        $result = tmp__197; 
      } 
    | local__1_gen___closelist__L44__expr_case2=gen___closelist__L44__expr ',' local__3_gen___closelist__L44__expr_case2=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__200 ; 
        ImmediateAST tmp__199 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__198 ; 
        tmp__198 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case2.result ; 
        tmp__199 = ( ImmediateAST ) _localctx.local__3_gen___closelist__L44__expr_case2.result ; 
        tmp__200 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__198, tmp__199 ); 
        $result = tmp__200; 
      } 
    | local__1_gen___closelist__L44__expr_case3=expr { 
        ImmediateAST tmp__202 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__201 ; 
        tmp__202 = ( ImmediateAST ) _localctx.local__1_gen___closelist__L44__expr_case3.result ; 
        tmp__201 = new System.Collections.Generic.List<ImmediateAST> { tmp__202 }; 
        $result = tmp__201; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__203 ; 
        tmp__203 = new System.Collections.Generic.List<ImmediateAST> { }; 
        $result = tmp__203; 
      } 
; 
pair returns [(ImmediateAST, ImmediateAST) result] :
      local__1_pair_case0=expr gen__line_wrap__L58 local__3_pair_case0=expr { 
        ImmediateAST tmp__206 ; 
        ImmediateAST tmp__205 ; 
        (ImmediateAST, ImmediateAST) tmp__204 ; 
        tmp__205 = ( ImmediateAST ) _localctx.local__1_pair_case0.result ; 
        tmp__206 = ( ImmediateAST ) _localctx.local__3_pair_case0.result ; 
        tmp__204 = ( tmp__205 , tmp__206 ); 
        $result = tmp__204; 
      } 
; 
gen__line_wrap__L58 returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap__L58_case0=':' gen__optional_newline { 
        CommonToken tmp__207 ; 
        tmp__207 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L58_case0 ; 
        $result = tmp__207; 
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
        ImmediateAST tmp__209 ; 
        System.Collections.Generic.List<object> tmp__208 ; 
        tmp__208 = ( System.Collections.Generic.List<object> ) _localctx.local__1_bin_case0.result ; 
        tmp__209 = (ImmediateAST) resolve_binop( tmp__208 ); 
        $result = tmp__209; 
      } 
; 
binseq returns [System.Collections.Generic.List<object> result] :
      local__1_binseq_case0=atom { 
        System.Collections.Generic.List<object> tmp__213 ; 
        object tmp__212 ; 
        ImmediateAST tmp__211 ; 
        System.Collections.Generic.List<object> tmp__210 ; 
        tmp__210 = (System.Collections.Generic.List<object>) empty<object>(  ); 
        tmp__211 = ( ImmediateAST ) _localctx.local__1_binseq_case0.result ; 
        tmp__212 = (object) to_obj<ImmediateAST>( tmp__211 ); 
        tmp__213 = (System.Collections.Generic.List<object>) append<object>( tmp__210, tmp__212 ); 
        $result = tmp__213; 
      } 
    | local__1_binseq_case1=binseq local__2_binseq_case1=binop local__3_binseq_case1=atom { 
        object tmp__219 ; 
        ImmediateAST tmp__218 ; 
        System.Collections.Generic.List<object> tmp__217 ; 
        System.Collections.Generic.List<object> block__214 ; 
        object tmp__216 ; 
        System.Collections.Generic.List<object> tmp__215 ; 
        tmp__215 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__216 = ( object ) _localctx.local__2_binseq_case1.result ; 
        block__214 = (System.Collections.Generic.List<object>) append<object>( tmp__215, tmp__216 ); 
        tmp__217 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__218 = ( ImmediateAST ) _localctx.local__3_binseq_case1.result ; 
        tmp__219 = (object) to_obj<ImmediateAST>( tmp__218 ); 
        block__214 = (System.Collections.Generic.List<object>) append<object>( tmp__217, tmp__219 ); 
        $result = block__214; 
      } 
; 
ibin returns [ImmediateAST result] :
      local__1_ibin_case0=lhs local__2_ibin_case0=ibinop local__3_ibin_case0='=' local__4_ibin_case0=expr { 
        ImmediateAST tmp__224 ; 
        ImmediateAST tmp__223 ; 
        string tmp__222 ; 
        ImmediateAST tmp__221 ; 
        CommonToken tmp__220 ; 
        tmp__220 = ( CommonToken ) _localctx.local__3_ibin_case0 ; 
        tmp__221 = ( ImmediateAST ) _localctx.local__1_ibin_case0.result ; 
        tmp__222 = ( string ) _localctx.local__2_ibin_case0.result ; 
        tmp__223 = ( ImmediateAST ) _localctx.local__4_ibin_case0.result ; 
        tmp__224 = (ImmediateAST) mkIBin( tmp__220, tmp__221, tmp__222, tmp__223 ); 
        $result = tmp__224; 
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
        tmp__251 = (ImmediateAST) mkAnd( tmp__248, tmp__249, tmp__250 ); 
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
lhs_seq returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_lhs_seq_case0=lhs_seq local__2_lhs_seq_case0=lhs '=' { 
        System.Collections.Generic.List<ImmediateAST> tmp__292 ; 
        ImmediateAST tmp__291 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__290 ; 
        tmp__290 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_lhs_seq_case0.result ; 
        tmp__291 = ( ImmediateAST ) _localctx.local__2_lhs_seq_case0.result ; 
        tmp__292 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__290, tmp__291 ); 
        $result = tmp__292; 
      } 
    | local__1_lhs_seq_case1=lhs '=' { 
        ImmediateAST tmp__294 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__293 ; 
        tmp__294 = ( ImmediateAST ) _localctx.local__1_lhs_seq_case1.result ; 
        tmp__293 = new System.Collections.Generic.List<ImmediateAST> { tmp__294 }; 
        $result = tmp__293; 
      } 
; 
start returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_start_case0=gen__nullable_gen__seplist_newline__stmt gen__optional_newline EOF { 
        System.Collections.Generic.List<ImmediateAST> tmp__295 ; 
        tmp__295 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_start_case0.result ; 
        $result = tmp__295; 
      } 
; 
gen__nullable_gen__seplist_newline__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__nullable_gen__seplist_newline__stmt_case0=gen__seplist_newline__stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__296 ; 
        tmp__296 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist_newline__stmt_case0.result ; 
        $result = tmp__296; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__297 ; 
        tmp__297 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__297; 
      } 
; 
gen__seplist_newline__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_newline__stmt_case0=stmt { 
        ImmediateAST tmp__299 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__298 ; 
        tmp__299 = ( ImmediateAST ) _localctx.local__1_gen__seplist_newline__stmt_case0.result ; 
        tmp__298 = new System.Collections.Generic.List<ImmediateAST> { tmp__299 }; 
        $result = tmp__298; 
      } 
    | local__1_gen__seplist_newline__stmt_case1=gen__seplist_newline__stmt newline local__3_gen__seplist_newline__stmt_case1=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__302 ; 
        ImmediateAST tmp__301 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__300 ; 
        tmp__300 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_newline__stmt_case1.result ; 
        tmp__301 = ( ImmediateAST ) _localctx.local__3_gen__seplist_newline__stmt_case1.result ; 
        tmp__302 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__300, tmp__301 ); 
        $result = tmp__302; 
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


