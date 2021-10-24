grammar DianaScript;
options { language = CSharp; }
stmt returns [ImmediateAST result] :
      local__1_stmt_case0=NAME_13 '{' local__3_stmt_case0=gen__filter_option__NEWLINE '}' { 
        ImmediateAST tmp__6 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__5 ; 
        ImmediateAST tmp__4 ; 
        CommonToken tmp__3 ; 
        CommonToken tmp__2 ; 
        CommonToken tmp__1 ; 
        tmp__1 = ( CommonToken ) _localctx.local__1_stmt_case0 ; 
        tmp__2 = ( CommonToken ) _localctx.local__1_stmt_case0 ; 
        tmp__3 = ( CommonToken ) _localctx.local__1_stmt_case0 ; 
        tmp__4 = (ImmediateAST) mkVar( tmp__2, tmp__3.Text ); 
        tmp__5 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__3_stmt_case0.result ; 
        tmp__6 = (ImmediateAST) mkWorkflow( tmp__1, tmp__4, tmp__5 ); 
        $result = tmp__6; 
      } 
    | local__1_stmt_case1=lhs_seq local__2_stmt_case1=expr { 
        ImmediateAST tmp__9 ; 
        ImmediateAST tmp__8 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__7 ; 
        tmp__7 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_stmt_case1.result ; 
        tmp__8 = ( ImmediateAST ) _localctx.local__2_stmt_case1.result ; 
        tmp__9 = (ImmediateAST) mkStoreMany( tmp__7, tmp__8 ); 
        $result = tmp__9; 
      } 
    | local__1_stmt_case2='loop' local__2_stmt_case2=block 'end' { 
        ImmediateAST tmp__14 ; 
        ImmediateAST tmp__13 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__12 ; 
        CommonToken tmp__11 ; 
        CommonToken tmp__10 ; 
        tmp__10 = ( CommonToken ) _localctx.local__1_stmt_case2 ; 
        tmp__11 = ( CommonToken ) _localctx.local__1_stmt_case2 ; 
        tmp__12 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_stmt_case2.result ; 
        tmp__13 = (ImmediateAST) mkBlock( tmp__11, tmp__12 ); 
        tmp__14 = (ImmediateAST) mkLoop( tmp__10, tmp__13 ); 
        $result = tmp__14; 
      } 
    | local__1_stmt_case3='for' local__2_stmt_case3=NAME_13 'in' local__4_stmt_case3=expr local__5_stmt_case3=gen__blockOf_do 'end' { 
        ImmediateAST tmp__19 ; 
        ImmediateAST tmp__18 ; 
        ImmediateAST tmp__17 ; 
        CommonToken tmp__16 ; 
        CommonToken tmp__15 ; 
        tmp__15 = ( CommonToken ) _localctx.local__1_stmt_case3 ; 
        tmp__16 = ( CommonToken ) _localctx.local__2_stmt_case3 ; 
        tmp__17 = ( ImmediateAST ) _localctx.local__4_stmt_case3.result ; 
        tmp__18 = ( ImmediateAST ) _localctx.local__5_stmt_case3.result ; 
        tmp__19 = (ImmediateAST) mkFor( tmp__15, tmp__16.Text, tmp__17, tmp__18 ); 
        $result = tmp__19; 
      } 
    | local__1_stmt_case4='break' { 
        ImmediateAST tmp__21 ; 
        CommonToken tmp__20 ; 
        tmp__20 = ( CommonToken ) _localctx.local__1_stmt_case4 ; 
        tmp__21 = (ImmediateAST) mkBreak( tmp__20 ); 
        $result = tmp__21; 
      } 
    | local__1_stmt_case5='continue' { 
        ImmediateAST tmp__23 ; 
        CommonToken tmp__22 ; 
        tmp__22 = ( CommonToken ) _localctx.local__1_stmt_case5 ; 
        tmp__23 = (ImmediateAST) mkContinue( tmp__22 ); 
        $result = tmp__23; 
      } 
    | local__1_stmt_case6='return' local__2_stmt_case6=expr { 
        ImmediateAST tmp__26 ; 
        ImmediateAST tmp__25 ; 
        CommonToken tmp__24 ; 
        tmp__24 = ( CommonToken ) _localctx.local__1_stmt_case6 ; 
        tmp__25 = ( ImmediateAST ) _localctx.local__2_stmt_case6.result ; 
        tmp__26 = (ImmediateAST) mkReturn( tmp__24, tmp__25 ); 
        $result = tmp__26; 
      } 
    | local__1_stmt_case7='return' { 
        ImmediateAST tmp__28 ; 
        CommonToken tmp__27 ; 
        tmp__27 = ( CommonToken ) _localctx.local__1_stmt_case7 ; 
        tmp__28 = (ImmediateAST) mkReturn( tmp__27, null ); 
        $result = tmp__28; 
      } 
; 
gen__filter_option__NEWLINE returns [System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> result] :
      local__1_gen__filter_option__NEWLINE_case0=gen__filter_option__NEWLINE local__2_gen__filter_option__NEWLINE_case0=option { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__31 ; 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__30 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__29 ; 
        tmp__29 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__1_gen__filter_option__NEWLINE_case0.result ; 
        tmp__30 = ( (int, int, string, System.Collections.Generic.List<ImmediateAST>) ) _localctx.local__2_gen__filter_option__NEWLINE_case0.result ; 
        tmp__31 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) append<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>( tmp__29, tmp__30 ); 
        $result = tmp__31; 
      } 
    | local__1_gen__filter_option__NEWLINE_case1=gen__filter_option__NEWLINE NEWLINE_17 { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__32 ; 
        tmp__32 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__1_gen__filter_option__NEWLINE_case1.result ; 
        $result = tmp__32; 
      } 
    | local__1_gen__filter_option__NEWLINE_case2=option { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__35 ; 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__34 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__33 ; 
        tmp__33 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) empty<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>(  ); 
        tmp__34 = ( (int, int, string, System.Collections.Generic.List<ImmediateAST>) ) _localctx.local__1_gen__filter_option__NEWLINE_case2.result ; 
        tmp__35 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) append<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>( tmp__33, tmp__34 ); 
        $result = tmp__35; 
      } 
    | NEWLINE_17 { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__36 ; 
        tmp__36 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) empty<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>(  ); 
        $result = tmp__36; 
      } 
; 
option returns [(int, int, string, System.Collections.Generic.List<ImmediateAST>) result] :
      local__1_option_case0=NAME_13 { 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__38 ; 
        CommonToken tmp__37 ; 
        tmp__37 = ( CommonToken ) _localctx.local__1_option_case0 ; 
        tmp__38 = ((int, int, string, System.Collections.Generic.List<ImmediateAST>)) mkOption0( tmp__37 ); 
        $result = tmp__38; 
      } 
    | local__1_option_case1=NAME_13 local__2_option_case1=gen__seplist__L44__expr { 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__41 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__40 ; 
        CommonToken tmp__39 ; 
        tmp__39 = ( CommonToken ) _localctx.local__1_option_case1 ; 
        tmp__40 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_option_case1.result ; 
        tmp__41 = ((int, int, string, System.Collections.Generic.List<ImmediateAST>)) mkOptionN( tmp__39, tmp__40 ); 
        $result = tmp__41; 
      } 
    | 'do' local__2_option_case2=expr { 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__43 ; 
        ImmediateAST tmp__42 ; 
        tmp__42 = ( ImmediateAST ) _localctx.local__2_option_case2.result ; 
        tmp__43 = ((int, int, string, System.Collections.Generic.List<ImmediateAST>)) mkDoOption( tmp__42 ); 
        $result = tmp__43; 
      } 
; 
gen__seplist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist__L44__expr_case0=expr { 
        ImmediateAST tmp__45 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__44 ; 
        tmp__45 = ( ImmediateAST ) _localctx.local__1_gen__seplist__L44__expr_case0.result ; 
        tmp__44 = new System.Collections.Generic.List<ImmediateAST> { tmp__45 }; 
        $result = tmp__44; 
      } 
    | local__1_gen__seplist__L44__expr_case1=gen__seplist__L44__expr ',' local__3_gen__seplist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__48 ; 
        ImmediateAST tmp__47 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__46 ; 
        tmp__46 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist__L44__expr_case1.result ; 
        tmp__47 = ( ImmediateAST ) _localctx.local__3_gen__seplist__L44__expr_case1.result ; 
        tmp__48 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__46, tmp__47 ); 
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
    | local__1_atom_case5='{' local__2_atom_case5=gen__closelist__L44__pair trailer '}' { 
        ImmediateAST tmp__73 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__72 ; 
        CommonToken tmp__71 ; 
        tmp__71 = ( CommonToken ) _localctx.local__1_atom_case5 ; 
        tmp__72 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case5.result ; 
        tmp__73 = (ImmediateAST) mkDict( tmp__71, tmp__72 ); 
        $result = tmp__73; 
      } 
    | local__1_atom_case6=STR_4 { 
        ImmediateAST tmp__78 ; 
        DObj tmp__77 ; 
        string tmp__76 ; 
        CommonToken tmp__75 ; 
        CommonToken tmp__74 ; 
        tmp__74 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__75 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__76 = (string) unesc( tmp__75.Text ); 
        tmp__77 = (DObj) mkstr( tmp__76 ); 
        tmp__78 = (ImmediateAST) mkVal( tmp__74, tmp__77 ); 
        $result = tmp__78; 
      } 
    | local__1_atom_case7=INT_10 { 
        ImmediateAST tmp__83 ; 
        DObj tmp__82 ; 
        int tmp__81 ; 
        CommonToken tmp__80 ; 
        CommonToken tmp__79 ; 
        tmp__79 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__80 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__81 = 0 ; 
        tmp__82 = (DObj) mkint( tmp__80.Text, tmp__81 ); 
        tmp__83 = (ImmediateAST) mkVal( tmp__79, tmp__82 ); 
        $result = tmp__83; 
      } 
    | local__1_atom_case8=HEX_7 { 
        ImmediateAST tmp__88 ; 
        DObj tmp__87 ; 
        int tmp__86 ; 
        CommonToken tmp__85 ; 
        CommonToken tmp__84 ; 
        tmp__84 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__85 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__86 = 16 ; 
        tmp__87 = (DObj) mkint( tmp__85.Text, tmp__86 ); 
        tmp__88 = (ImmediateAST) mkVal( tmp__84, tmp__87 ); 
        $result = tmp__88; 
      } 
    | local__1_atom_case9=OCT_8 { 
        ImmediateAST tmp__93 ; 
        DObj tmp__92 ; 
        int tmp__91 ; 
        CommonToken tmp__90 ; 
        CommonToken tmp__89 ; 
        tmp__89 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__90 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__91 = 8 ; 
        tmp__92 = (DObj) mkint( tmp__90.Text, tmp__91 ); 
        tmp__93 = (ImmediateAST) mkVal( tmp__89, tmp__92 ); 
        $result = tmp__93; 
      } 
    | local__1_atom_case10=BIN_9 { 
        ImmediateAST tmp__98 ; 
        DObj tmp__97 ; 
        int tmp__96 ; 
        CommonToken tmp__95 ; 
        CommonToken tmp__94 ; 
        tmp__94 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__95 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__96 = 2 ; 
        tmp__97 = (DObj) mkint( tmp__95.Text, tmp__96 ); 
        tmp__98 = (ImmediateAST) mkVal( tmp__94, tmp__97 ); 
        $result = tmp__98; 
      } 
    | local__1_atom_case11=FLOAT_11 { 
        ImmediateAST tmp__102 ; 
        DObj tmp__101 ; 
        CommonToken tmp__100 ; 
        CommonToken tmp__99 ; 
        tmp__99 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__100 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__101 = (DObj) mkfloat( tmp__100.Text ); 
        tmp__102 = (ImmediateAST) mkVal( tmp__99, tmp__101 ); 
        $result = tmp__102; 
      } 
    | local__1_atom_case12='None' { 
        ImmediateAST tmp__105 ; 
        DObj tmp__104 ; 
        CommonToken tmp__103 ; 
        tmp__103 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__104 = (DObj) mknone(  ); 
        tmp__105 = (ImmediateAST) mkVal( tmp__103, tmp__104 ); 
        $result = tmp__105; 
      } 
    | local__1_atom_case13=NAME_13 { 
        ImmediateAST tmp__108 ; 
        CommonToken tmp__107 ; 
        CommonToken tmp__106 ; 
        tmp__106 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__107 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__108 = (ImmediateAST) mkVar( tmp__106, tmp__107.Text ); 
        $result = tmp__108; 
      } 
    | local__1_atom_case14='-' local__2_atom_case14=atom { 
        ImmediateAST tmp__111 ; 
        ImmediateAST tmp__110 ; 
        CommonToken tmp__109 ; 
        tmp__109 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__110 = ( ImmediateAST ) _localctx.local__2_atom_case14.result ; 
        tmp__111 = (ImmediateAST) mkNeg( tmp__109, tmp__110 ); 
        $result = tmp__111; 
      } 
    | local__1_atom_case15='~' local__2_atom_case15=atom { 
        ImmediateAST tmp__114 ; 
        ImmediateAST tmp__113 ; 
        CommonToken tmp__112 ; 
        tmp__112 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__113 = ( ImmediateAST ) _localctx.local__2_atom_case15.result ; 
        tmp__114 = (ImmediateAST) mkInv( tmp__112, tmp__113 ); 
        $result = tmp__114; 
      } 
    | local__1_atom_case16='if' local__2_atom_case16=expr local__3_atom_case16=then local__4_atom_case16=block 'end' { 
        ImmediateAST tmp__120 ; 
        ImmediateAST tmp__119 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__118 ; 
        CommonToken tmp__117 ; 
        ImmediateAST tmp__116 ; 
        CommonToken tmp__115 ; 
        tmp__115 = ( CommonToken ) _localctx.local__1_atom_case16 ; 
        tmp__116 = ( ImmediateAST ) _localctx.local__2_atom_case16.result ; 
        tmp__117 = ( CommonToken ) _localctx.local__3_atom_case16.result ; 
        tmp__118 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case16.result ; 
        tmp__119 = (ImmediateAST) mkBlock( tmp__117, tmp__118 ); 
        tmp__120 = (ImmediateAST) mkIfThen( tmp__115, tmp__116, tmp__119 ); 
        $result = tmp__120; 
      } 
    | local__1_atom_case17='if' local__2_atom_case17=expr local__3_atom_case17=then local__4_atom_case17=block local__5_atom_case17=gen__nullable_gen__list_gen__snd_elif__elifBlock local__6_atom_case17=gen__optional_gen__blockOf_else 'end' { 
        ImmediateAST tmp__132 ; 
        ImmediateAST tmp__131 ; 
        CommonToken tmp__130 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__128 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__129 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__126 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__127 ; 
        ImmediateAST tmp__125 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__124 ; 
        CommonToken tmp__123 ; 
        ImmediateAST tmp__122 ; 
        (ImmediateAST, ImmediateAST) elif__121 ; 
        tmp__122 = ( ImmediateAST ) _localctx.local__2_atom_case17.result ; 
        tmp__123 = ( CommonToken ) _localctx.local__3_atom_case17.result ; 
        tmp__124 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case17.result ; 
        tmp__125 = (ImmediateAST) mkBlock( tmp__123, tmp__124 ); 
        elif__121 = ( tmp__122 , tmp__125 ); 
        tmp__127 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        elifs__126 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__127, elif__121 ); 
        tmp__129 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__5_atom_case17.result ; 
        elifs__128 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) extend<(ImmediateAST, ImmediateAST)>( elifs__126, tmp__129 ); 
        tmp__130 = ( CommonToken ) _localctx.local__1_atom_case17 ; 
        tmp__131 = ( ImmediateAST ) _localctx.local__6_atom_case17.result ; 
        tmp__132 = (ImmediateAST) mkNestedIf( tmp__130, elifs__126, tmp__131 ); 
        $result = tmp__132; 
      } 
    | local__1_atom_case18='fun' local__2_atom_case18=name '(' local__4_atom_case18=gen__nullable_gen__seplist__L44__name ')' local__6_atom_case18=block 'end' { 
        ImmediateAST tmp__137 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__136 ; 
        System.Collections.Generic.List<string> tmp__135 ; 
        string tmp__134 ; 
        CommonToken tmp__133 ; 
        tmp__133 = ( CommonToken ) _localctx.local__1_atom_case18 ; 
        tmp__134 = ( string ) _localctx.local__2_atom_case18.result ; 
        tmp__135 = ( System.Collections.Generic.List<string> ) _localctx.local__4_atom_case18.result ; 
        tmp__136 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__6_atom_case18.result ; 
        tmp__137 = (ImmediateAST) mkFunc( tmp__133, tmp__134, tmp__135, tmp__136 ); 
        $result = tmp__137; 
      } 
    | local__1_atom_case19='fun' '(' local__3_atom_case19=gen__nullable_gen__seplist__L44__name ')' local__5_atom_case19=block 'end' { 
        ImmediateAST tmp__142 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__141 ; 
        System.Collections.Generic.List<string> tmp__140 ; 
        string tmp__139 ; 
        CommonToken tmp__138 ; 
        tmp__138 = ( CommonToken ) _localctx.local__1_atom_case19 ; 
        tmp__139 = "ans" ; 
        tmp__140 = ( System.Collections.Generic.List<string> ) _localctx.local__3_atom_case19.result ; 
        tmp__141 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__5_atom_case19.result ; 
        tmp__142 = (ImmediateAST) mkFunc( tmp__138, tmp__139, tmp__140, tmp__141 ); 
        $result = tmp__142; 
      } 
    | local__1_atom_case20='(' local__2_atom_case20=gen__nullable_gen__seplist__L44__name ')' '->' local__5_atom_case20=gen__line_wrap_expr { 
        ImmediateAST tmp__148 ; 
        ImmediateAST tmp__147 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__146 ; 
        System.Collections.Generic.List<string> tmp__145 ; 
        string tmp__144 ; 
        CommonToken tmp__143 ; 
        tmp__143 = ( CommonToken ) _localctx.local__1_atom_case20 ; 
        tmp__144 = "ans" ; 
        tmp__145 = ( System.Collections.Generic.List<string> ) _localctx.local__2_atom_case20.result ; 
        tmp__147 = ( ImmediateAST ) _localctx.local__5_atom_case20.result ; 
        tmp__146 = new System.Collections.Generic.List<ImmediateAST> { tmp__147 }; 
        tmp__148 = (ImmediateAST) mkFunc( tmp__143, tmp__144, tmp__145, tmp__146 ); 
        $result = tmp__148; 
      } 
    | local__1_atom_case21=NAME_13 '->' local__3_atom_case21=gen__line_wrap_expr { 
        ImmediateAST tmp__155 ; 
        ImmediateAST tmp__154 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__153 ; 
        CommonToken tmp__152 ; 
        System.Collections.Generic.List<string> tmp__151 ; 
        string tmp__150 ; 
        CommonToken tmp__149 ; 
        tmp__149 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__150 = "ans" ; 
        tmp__152 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__151 = new System.Collections.Generic.List<string> { tmp__152.Text }; 
        tmp__154 = ( ImmediateAST ) _localctx.local__3_atom_case21.result ; 
        tmp__153 = new System.Collections.Generic.List<ImmediateAST> { tmp__154 }; 
        tmp__155 = (ImmediateAST) mkFunc( tmp__149, tmp__150, tmp__151, tmp__153 ); 
        $result = tmp__155; 
      } 
; 
gen__line_wrap_expr returns [ImmediateAST result] :
      gen__optional_NEWLINE local__2_gen__line_wrap_expr_case0=expr gen__optional_NEWLINE { 
        ImmediateAST tmp__156 ; 
        tmp__156 = ( ImmediateAST ) _localctx.local__2_gen__line_wrap_expr_case0.result ; 
        $result = tmp__156; 
      } 
; 
gen__optional_NEWLINE returns [CommonToken result] :
      { 
        $result = null; 
      } 
    | local__1_gen__optional_NEWLINE_case1=NEWLINE_17 { 
        CommonToken tmp__157 ; 
        tmp__157 = ( CommonToken ) _localctx.local__1_gen__optional_NEWLINE_case1 ; 
        $result = tmp__157; 
      } 
; 
gen__nullable_gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      { 
        System.Collections.Generic.List<string> tmp__158 ; 
        tmp__158 = (System.Collections.Generic.List<string>) empty<string>(  ); 
        $result = tmp__158; 
      } 
    | local__1_gen__nullable_gen__seplist__L44__name_case1=gen__seplist__L44__name { 
        System.Collections.Generic.List<string> tmp__159 ; 
        tmp__159 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__nullable_gen__seplist__L44__name_case1.result ; 
        $result = tmp__159; 
      } 
; 
gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__seplist__L44__name_case0=name { 
        string tmp__161 ; 
        System.Collections.Generic.List<string> tmp__160 ; 
        tmp__161 = ( string ) _localctx.local__1_gen__seplist__L44__name_case0.result ; 
        tmp__160 = new System.Collections.Generic.List<string> { tmp__161 }; 
        $result = tmp__160; 
      } 
    | local__1_gen__seplist__L44__name_case1=gen__seplist__L44__name ',' local__3_gen__seplist__L44__name_case1=name { 
        System.Collections.Generic.List<string> tmp__164 ; 
        string tmp__163 ; 
        System.Collections.Generic.List<string> tmp__162 ; 
        tmp__162 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__seplist__L44__name_case1.result ; 
        tmp__163 = ( string ) _localctx.local__3_gen__seplist__L44__name_case1.result ; 
        tmp__164 = (System.Collections.Generic.List<string>) append<string>( tmp__162, tmp__163 ); 
        $result = tmp__164; 
      } 
; 
gen__optional_gen__blockOf_else returns [ImmediateAST result] :
      { 
        $result = null; 
      } 
    | local__1_gen__optional_gen__blockOf_else_case1=gen__blockOf_else { 
        ImmediateAST tmp__165 ; 
        tmp__165 = ( ImmediateAST ) _localctx.local__1_gen__optional_gen__blockOf_else_case1.result ; 
        $result = tmp__165; 
      } 
; 
gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__blockOf_else_case0='else' local__2_gen__blockOf_else_case0=block { 
        ImmediateAST tmp__168 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__167 ; 
        CommonToken tmp__166 ; 
        tmp__166 = ( CommonToken ) _localctx.local__1_gen__blockOf_else_case0 ; 
        tmp__167 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_else_case0.result ; 
        tmp__168 = (ImmediateAST) mkBlock( tmp__166, tmp__167 ); 
        $result = tmp__168; 
      } 
; 
gen__nullable_gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__169 ; 
        tmp__169 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__169; 
      } 
    | local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__170 ; 
        tmp__170 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        $result = tmp__170; 
      } 
; 
gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__list_gen__snd_elif__elifBlock_case0=gen__snd_elif__elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__172 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__171 ; 
        tmp__172 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        tmp__171 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__172 }; 
        $result = tmp__171; 
      } 
    | local__1_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock local__2_gen__list_gen__snd_elif__elifBlock_case1=gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__175 ; 
        (ImmediateAST, ImmediateAST) tmp__174 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__173 ; 
        tmp__173 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__174 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__175 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__173, tmp__174 ); 
        $result = tmp__175; 
      } 
; 
gen__snd_elif__elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      'elif' local__2_gen__snd_elif__elifBlock_case0=elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__176 ; 
        tmp__176 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__176; 
      } 
; 
gen__closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      gen__optional_NEWLINE local__2_gen__closelist__L44__pair_case0=gen___closelist__L44__pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__177 ; 
        tmp__177 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_gen__closelist__L44__pair_case0.result ; 
        $result = tmp__177; 
      } 
; 
gen___closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen___closelist__L44__pair_case0=gen___closelist__L44__pair NEWLINE_17 { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__178 ; 
        tmp__178 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case0.result ; 
        $result = tmp__178; 
      } 
    | local__1_gen___closelist__L44__pair_case1=gen___closelist__L44__pair ',' NEWLINE_17 local__4_gen___closelist__L44__pair_case1=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__181 ; 
        (ImmediateAST, ImmediateAST) tmp__180 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__179 ; 
        tmp__179 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case1.result ; 
        tmp__180 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__4_gen___closelist__L44__pair_case1.result ; 
        tmp__181 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__179, tmp__180 ); 
        $result = tmp__181; 
      } 
    | local__1_gen___closelist__L44__pair_case2=gen___closelist__L44__pair ',' local__3_gen___closelist__L44__pair_case2=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__184 ; 
        (ImmediateAST, ImmediateAST) tmp__183 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__182 ; 
        tmp__182 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case2.result ; 
        tmp__183 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__3_gen___closelist__L44__pair_case2.result ; 
        tmp__184 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__182, tmp__183 ); 
        $result = tmp__184; 
      } 
    | local__1_gen___closelist__L44__pair_case3=pair { 
        (ImmediateAST, ImmediateAST) tmp__186 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__185 ; 
        tmp__186 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen___closelist__L44__pair_case3.result ; 
        tmp__185 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__186 }; 
        $result = tmp__185; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__187 ; 
        tmp__187 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { }; 
        $result = tmp__187; 
      } 
; 
gen__closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_NEWLINE local__2_gen__closelist__L44__expr_case0=gen___closelist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__188 ; 
        tmp__188 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__closelist__L44__expr_case0.result ; 
        $result = tmp__188; 
      } 
; 
gen___closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen___closelist__L44__expr_case0=gen___closelist__L44__expr NEWLINE_17 { 
        System.Collections.Generic.List<ImmediateAST> tmp__189 ; 
        tmp__189 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case0.result ; 
        $result = tmp__189; 
      } 
    | local__1_gen___closelist__L44__expr_case1=gen___closelist__L44__expr ',' NEWLINE_17 local__4_gen___closelist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__192 ; 
        ImmediateAST tmp__191 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__190 ; 
        tmp__190 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case1.result ; 
        tmp__191 = ( ImmediateAST ) _localctx.local__4_gen___closelist__L44__expr_case1.result ; 
        tmp__192 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__190, tmp__191 ); 
        $result = tmp__192; 
      } 
    | local__1_gen___closelist__L44__expr_case2=gen___closelist__L44__expr ',' local__3_gen___closelist__L44__expr_case2=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__195 ; 
        ImmediateAST tmp__194 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__193 ; 
        tmp__193 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case2.result ; 
        tmp__194 = ( ImmediateAST ) _localctx.local__3_gen___closelist__L44__expr_case2.result ; 
        tmp__195 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__193, tmp__194 ); 
        $result = tmp__195; 
      } 
    | local__1_gen___closelist__L44__expr_case3=expr { 
        ImmediateAST tmp__197 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__196 ; 
        tmp__197 = ( ImmediateAST ) _localctx.local__1_gen___closelist__L44__expr_case3.result ; 
        tmp__196 = new System.Collections.Generic.List<ImmediateAST> { tmp__197 }; 
        $result = tmp__196; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__198 ; 
        tmp__198 = new System.Collections.Generic.List<ImmediateAST> { }; 
        $result = tmp__198; 
      } 
; 
pair returns [(ImmediateAST, ImmediateAST) result] :
      local__1_pair_case0=expr gen__line_wrap__L58 local__3_pair_case0=expr { 
        ImmediateAST tmp__201 ; 
        ImmediateAST tmp__200 ; 
        (ImmediateAST, ImmediateAST) tmp__199 ; 
        tmp__200 = ( ImmediateAST ) _localctx.local__1_pair_case0.result ; 
        tmp__201 = ( ImmediateAST ) _localctx.local__3_pair_case0.result ; 
        tmp__199 = ( tmp__200 , tmp__201 ); 
        $result = tmp__199; 
      } 
; 
gen__line_wrap__L58 returns [CommonToken result] :
      gen__optional_NEWLINE local__2_gen__line_wrap__L58_case0=':' gen__optional_NEWLINE { 
        CommonToken tmp__202 ; 
        tmp__202 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L58_case0 ; 
        $result = tmp__202; 
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
        ImmediateAST tmp__204 ; 
        System.Collections.Generic.List<object> tmp__203 ; 
        tmp__203 = ( System.Collections.Generic.List<object> ) _localctx.local__1_bin_case0.result ; 
        tmp__204 = (ImmediateAST) resolve_binop( tmp__203 ); 
        $result = tmp__204; 
      } 
; 
binseq returns [System.Collections.Generic.List<object> result] :
      local__1_binseq_case0=atom { 
        System.Collections.Generic.List<object> tmp__208 ; 
        object tmp__207 ; 
        ImmediateAST tmp__206 ; 
        System.Collections.Generic.List<object> tmp__205 ; 
        tmp__205 = (System.Collections.Generic.List<object>) empty<object>(  ); 
        tmp__206 = ( ImmediateAST ) _localctx.local__1_binseq_case0.result ; 
        tmp__207 = (object) to_obj<ImmediateAST>( tmp__206 ); 
        tmp__208 = (System.Collections.Generic.List<object>) append<object>( tmp__205, tmp__207 ); 
        $result = tmp__208; 
      } 
    | local__1_binseq_case1=binseq local__2_binseq_case1=binop local__3_binseq_case1=atom { 
        object tmp__214 ; 
        ImmediateAST tmp__213 ; 
        System.Collections.Generic.List<object> tmp__212 ; 
        System.Collections.Generic.List<object> block__209 ; 
        object tmp__211 ; 
        System.Collections.Generic.List<object> tmp__210 ; 
        tmp__210 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__211 = ( object ) _localctx.local__2_binseq_case1.result ; 
        block__209 = (System.Collections.Generic.List<object>) append<object>( tmp__210, tmp__211 ); 
        tmp__212 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__213 = ( ImmediateAST ) _localctx.local__3_binseq_case1.result ; 
        tmp__214 = (object) to_obj<ImmediateAST>( tmp__213 ); 
        block__209 = (System.Collections.Generic.List<object>) append<object>( tmp__212, tmp__214 ); 
        $result = block__209; 
      } 
; 
binop returns [object result] :
      local__1_binop_case0=SINGLE_BINOP_2 { 
        object tmp__217 ; 
        CommonToken tmp__216 ; 
        CommonToken tmp__215 ; 
        tmp__215 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__216 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__217 = (object) mkop( tmp__215, tmp__216.Text ); 
        $result = tmp__217; 
      } 
    | local__1_binop_case1='not' 'in' { 
        object tmp__220 ; 
        string tmp__219 ; 
        CommonToken tmp__218 ; 
        tmp__218 = ( CommonToken ) _localctx.local__1_binop_case1 ; 
        tmp__219 = "notin" ; 
        tmp__220 = (object) mkop( tmp__218, tmp__219 ); 
        $result = tmp__220; 
      } 
    | local__1_binop_case2='in' { 
        object tmp__223 ; 
        string tmp__222 ; 
        CommonToken tmp__221 ; 
        tmp__221 = ( CommonToken ) _localctx.local__1_binop_case2 ; 
        tmp__222 = "in" ; 
        tmp__223 = (object) mkop( tmp__221, tmp__222 ); 
        $result = tmp__223; 
      } 
    | local__1_binop_case3='-' { 
        object tmp__226 ; 
        string tmp__225 ; 
        CommonToken tmp__224 ; 
        tmp__224 = ( CommonToken ) _localctx.local__1_binop_case3 ; 
        tmp__225 = "-" ; 
        tmp__226 = (object) mkop( tmp__224, tmp__225 ); 
        $result = tmp__226; 
      } 
; 
not returns [ImmediateAST result] :
      local__1_not_case0='not' local__2_not_case0=bin { 
        ImmediateAST tmp__229 ; 
        ImmediateAST tmp__228 ; 
        CommonToken tmp__227 ; 
        tmp__227 = ( CommonToken ) _localctx.local__1_not_case0 ; 
        tmp__228 = ( ImmediateAST ) _localctx.local__2_not_case0.result ; 
        tmp__229 = (ImmediateAST) mkNot( tmp__227, tmp__228 ); 
        $result = tmp__229; 
      } 
    | local__1_not_case1=bin { 
        ImmediateAST tmp__230 ; 
        tmp__230 = ( ImmediateAST ) _localctx.local__1_not_case1.result ; 
        $result = tmp__230; 
      } 
; 
and_expr returns [ImmediateAST result] :
      local__1_and_expr_case0=and_expr local__2_and_expr_case0='and' local__3_and_expr_case0=not { 
        ImmediateAST tmp__234 ; 
        ImmediateAST tmp__233 ; 
        ImmediateAST tmp__232 ; 
        CommonToken tmp__231 ; 
        tmp__231 = ( CommonToken ) _localctx.local__2_and_expr_case0 ; 
        tmp__232 = ( ImmediateAST ) _localctx.local__1_and_expr_case0.result ; 
        tmp__233 = ( ImmediateAST ) _localctx.local__3_and_expr_case0.result ; 
        tmp__234 = (ImmediateAST) mkAnd( tmp__231, tmp__232, tmp__233 ); 
        $result = tmp__234; 
      } 
    | local__1_and_expr_case1=not { 
        ImmediateAST tmp__235 ; 
        tmp__235 = ( ImmediateAST ) _localctx.local__1_and_expr_case1.result ; 
        $result = tmp__235; 
      } 
; 
or_expr returns [ImmediateAST result] :
      local__1_or_expr_case0=or_expr local__2_or_expr_case0='or' local__3_or_expr_case0=and_expr { 
        ImmediateAST tmp__239 ; 
        ImmediateAST tmp__238 ; 
        ImmediateAST tmp__237 ; 
        CommonToken tmp__236 ; 
        tmp__236 = ( CommonToken ) _localctx.local__2_or_expr_case0 ; 
        tmp__237 = ( ImmediateAST ) _localctx.local__1_or_expr_case0.result ; 
        tmp__238 = ( ImmediateAST ) _localctx.local__3_or_expr_case0.result ; 
        tmp__239 = (ImmediateAST) mkAnd( tmp__236, tmp__237, tmp__238 ); 
        $result = tmp__239; 
      } 
    | local__1_or_expr_case1=and_expr { 
        ImmediateAST tmp__240 ; 
        tmp__240 = ( ImmediateAST ) _localctx.local__1_or_expr_case1.result ; 
        $result = tmp__240; 
      } 
; 
expr returns [ImmediateAST result] :
      local__1_expr_case0=or_expr { 
        ImmediateAST tmp__241 ; 
        tmp__241 = ( ImmediateAST ) _localctx.local__1_expr_case0.result ; 
        $result = tmp__241; 
      } 
; 
block returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_block_case0=gen__filter_stmt__NEWLINE { 
        System.Collections.Generic.List<ImmediateAST> tmp__242 ; 
        tmp__242 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_block_case0.result ; 
        $result = tmp__242; 
      } 
; 
gen__filter_stmt__NEWLINE returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__filter_stmt__NEWLINE_case0=gen__filter_stmt__NEWLINE local__2_gen__filter_stmt__NEWLINE_case0=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__245 ; 
        ImmediateAST tmp__244 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__243 ; 
        tmp__243 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__NEWLINE_case0.result ; 
        tmp__244 = ( ImmediateAST ) _localctx.local__2_gen__filter_stmt__NEWLINE_case0.result ; 
        tmp__245 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__243, tmp__244 ); 
        $result = tmp__245; 
      } 
    | local__1_gen__filter_stmt__NEWLINE_case1=gen__filter_stmt__NEWLINE NEWLINE_17 { 
        System.Collections.Generic.List<ImmediateAST> tmp__246 ; 
        tmp__246 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__NEWLINE_case1.result ; 
        $result = tmp__246; 
      } 
    | local__1_gen__filter_stmt__NEWLINE_case2=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__249 ; 
        ImmediateAST tmp__248 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__247 ; 
        tmp__247 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__248 = ( ImmediateAST ) _localctx.local__1_gen__filter_stmt__NEWLINE_case2.result ; 
        tmp__249 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__247, tmp__248 ); 
        $result = tmp__249; 
      } 
    | NEWLINE_17 { 
        System.Collections.Generic.List<ImmediateAST> tmp__250 ; 
        tmp__250 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__250; 
      } 
; 
lhs returns [ImmediateAST result] :
      local__1_lhs_case0=NAME_13 { 
        ImmediateAST tmp__253 ; 
        CommonToken tmp__252 ; 
        CommonToken tmp__251 ; 
        tmp__251 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__252 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__253 = (ImmediateAST) mkVar( tmp__251, tmp__252.Text ); 
        $result = tmp__253; 
      } 
    | local__1_lhs_case1=atom local__2_lhs_case1='.' '[' local__4_lhs_case1=expr ']' { 
        ImmediateAST tmp__257 ; 
        ImmediateAST tmp__256 ; 
        ImmediateAST tmp__255 ; 
        CommonToken tmp__254 ; 
        tmp__254 = ( CommonToken ) _localctx.local__2_lhs_case1 ; 
        tmp__255 = ( ImmediateAST ) _localctx.local__1_lhs_case1.result ; 
        tmp__256 = ( ImmediateAST ) _localctx.local__4_lhs_case1.result ; 
        tmp__257 = (ImmediateAST) mkOGet( tmp__254, tmp__255, tmp__256 ); 
        $result = tmp__257; 
      } 
    | local__1_lhs_case2=atom local__2_lhs_case2='.' local__3_lhs_case2=NAME_13 { 
        ImmediateAST tmp__264 ; 
        ImmediateAST tmp__263 ; 
        DObj tmp__262 ; 
        CommonToken tmp__261 ; 
        CommonToken tmp__260 ; 
        ImmediateAST tmp__259 ; 
        CommonToken tmp__258 ; 
        tmp__258 = ( CommonToken ) _localctx.local__2_lhs_case2 ; 
        tmp__259 = ( ImmediateAST ) _localctx.local__1_lhs_case2.result ; 
        tmp__260 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__261 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__262 = (DObj) mkstr( tmp__261.Text ); 
        tmp__263 = (ImmediateAST) mkVal( tmp__260, tmp__262 ); 
        tmp__264 = (ImmediateAST) mkOGet( tmp__258, tmp__259, tmp__263 ); 
        $result = tmp__264; 
      } 
; 
do returns [CommonToken result] :
      gen__optional_NEWLINE local__2_do_case0='do' { 
        CommonToken tmp__265 ; 
        tmp__265 = ( CommonToken ) _localctx.local__2_do_case0 ; 
        $result = tmp__265; 
      } 
; 
then returns [CommonToken result] :
      gen__optional_NEWLINE local__2_then_case0='then' { 
        CommonToken tmp__266 ; 
        tmp__266 = ( CommonToken ) _localctx.local__2_then_case0 ; 
        $result = tmp__266; 
      } 
; 
gen__blockOf_do returns [ImmediateAST result] :
      local__1_gen__blockOf_do_case0=do local__2_gen__blockOf_do_case0=block { 
        ImmediateAST tmp__269 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__268 ; 
        CommonToken tmp__267 ; 
        tmp__267 = ( CommonToken ) _localctx.local__1_gen__blockOf_do_case0.result ; 
        tmp__268 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_do_case0.result ; 
        tmp__269 = (ImmediateAST) mkBlock( tmp__267, tmp__268 ); 
        $result = tmp__269; 
      } 
; 
name returns [string result] :
      local__1_name_case0=NAME_13 { 
        CommonToken tmp__270 ; 
        tmp__270 = ( CommonToken ) _localctx.local__1_name_case0 ; 
        $result = tmp__270.Text; 
      } 
; 
elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      local__1_elifBlock_case0=expr local__2_elifBlock_case0=gen__blockOf_then { 
        ImmediateAST tmp__273 ; 
        ImmediateAST tmp__272 ; 
        (ImmediateAST, ImmediateAST) tmp__271 ; 
        tmp__272 = ( ImmediateAST ) _localctx.local__1_elifBlock_case0.result ; 
        tmp__273 = ( ImmediateAST ) _localctx.local__2_elifBlock_case0.result ; 
        tmp__271 = ( tmp__272 , tmp__273 ); 
        $result = tmp__271; 
      } 
; 
gen__blockOf_then returns [ImmediateAST result] :
      local__1_gen__blockOf_then_case0=then local__2_gen__blockOf_then_case0=block { 
        ImmediateAST tmp__276 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__275 ; 
        CommonToken tmp__274 ; 
        tmp__274 = ( CommonToken ) _localctx.local__1_gen__blockOf_then_case0.result ; 
        tmp__275 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_then_case0.result ; 
        tmp__276 = (ImmediateAST) mkBlock( tmp__274, tmp__275 ); 
        $result = tmp__276; 
      } 
; 
lhs_seq returns [System.Collections.Generic.List<ImmediateAST> result] :
      { 
        System.Collections.Generic.List<ImmediateAST> tmp__277 ; 
        tmp__277 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__277; 
      } 
    | local__1_lhs_seq_case1=lhs_seq local__2_lhs_seq_case1=lhs '=' { 
        System.Collections.Generic.List<ImmediateAST> tmp__280 ; 
        ImmediateAST tmp__279 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__278 ; 
        tmp__278 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_lhs_seq_case1.result ; 
        tmp__279 = ( ImmediateAST ) _localctx.local__2_lhs_seq_case1.result ; 
        tmp__280 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__278, tmp__279 ); 
        $result = tmp__280; 
      } 
; 
start returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_NEWLINE local__2_start_case0=gen__nullable_gen__seplist_NEWLINE__stmt gen__optional_NEWLINE EOF { 
        System.Collections.Generic.List<ImmediateAST> tmp__281 ; 
        tmp__281 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_start_case0.result ; 
        $result = tmp__281; 
      } 
; 
gen__nullable_gen__seplist_NEWLINE__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      { 
        System.Collections.Generic.List<ImmediateAST> tmp__282 ; 
        tmp__282 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__282; 
      } 
    | local__1_gen__nullable_gen__seplist_NEWLINE__stmt_case1=gen__seplist_NEWLINE__stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__283 ; 
        tmp__283 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist_NEWLINE__stmt_case1.result ; 
        $result = tmp__283; 
      } 
; 
gen__seplist_NEWLINE__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_NEWLINE__stmt_case0=stmt { 
        ImmediateAST tmp__285 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__284 ; 
        tmp__285 = ( ImmediateAST ) _localctx.local__1_gen__seplist_NEWLINE__stmt_case0.result ; 
        tmp__284 = new System.Collections.Generic.List<ImmediateAST> { tmp__285 }; 
        $result = tmp__284; 
      } 
    | local__1_gen__seplist_NEWLINE__stmt_case1=gen__seplist_NEWLINE__stmt NEWLINE_17 local__3_gen__seplist_NEWLINE__stmt_case1=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__288 ; 
        ImmediateAST tmp__287 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__286 ; 
        tmp__286 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_NEWLINE__stmt_case1.result ; 
        tmp__287 = ( ImmediateAST ) _localctx.local__3_gen__seplist_NEWLINE__stmt_case1.result ; 
        tmp__288 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__286, tmp__287 ); 
        $result = tmp__288; 
      } 
; 


COMMENT_1 : '#' (~'\n')* -> skip;
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
NEWLINE_17 : (CR_15? LF_16)+;


