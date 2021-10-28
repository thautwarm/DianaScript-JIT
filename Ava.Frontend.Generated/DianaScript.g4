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
    | local__1_stmt_case1='let' local__2_stmt_case1=NAME_13 '=' local__4_stmt_case1=expr { 
        ImmediateAST tmp__10 ; 
        ImmediateAST tmp__9 ; 
        CommonToken tmp__8 ; 
        CommonToken tmp__7 ; 
        tmp__7 = ( CommonToken ) _localctx.local__1_stmt_case1 ; 
        tmp__8 = ( CommonToken ) _localctx.local__2_stmt_case1 ; 
        tmp__9 = ( ImmediateAST ) _localctx.local__4_stmt_case1.result ; 
        tmp__10 = (ImmediateAST) mkLet( tmp__7, tmp__8.Text, tmp__9 ); 
        $result = tmp__10; 
      } 
    | local__1_stmt_case2=lhs_seq local__2_stmt_case2=expr { 
        ImmediateAST tmp__13 ; 
        ImmediateAST tmp__12 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__11 ; 
        tmp__11 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_stmt_case2.result ; 
        tmp__12 = ( ImmediateAST ) _localctx.local__2_stmt_case2.result ; 
        tmp__13 = (ImmediateAST) mkStoreMany( tmp__11, tmp__12 ); 
        $result = tmp__13; 
      } 
    | local__1_stmt_case3='loop' local__2_stmt_case3=block 'end' { 
        ImmediateAST tmp__18 ; 
        ImmediateAST tmp__17 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__16 ; 
        CommonToken tmp__15 ; 
        CommonToken tmp__14 ; 
        tmp__14 = ( CommonToken ) _localctx.local__1_stmt_case3 ; 
        tmp__15 = ( CommonToken ) _localctx.local__1_stmt_case3 ; 
        tmp__16 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_stmt_case3.result ; 
        tmp__17 = (ImmediateAST) mkBlock( tmp__15, tmp__16 ); 
        tmp__18 = (ImmediateAST) mkLoop( tmp__14, tmp__17 ); 
        $result = tmp__18; 
      } 
    | local__1_stmt_case4='for' local__2_stmt_case4=NAME_13 'in' local__4_stmt_case4=expr local__5_stmt_case4=gen__blockOf_do 'end' { 
        ImmediateAST tmp__23 ; 
        ImmediateAST tmp__22 ; 
        ImmediateAST tmp__21 ; 
        CommonToken tmp__20 ; 
        CommonToken tmp__19 ; 
        tmp__19 = ( CommonToken ) _localctx.local__1_stmt_case4 ; 
        tmp__20 = ( CommonToken ) _localctx.local__2_stmt_case4 ; 
        tmp__21 = ( ImmediateAST ) _localctx.local__4_stmt_case4.result ; 
        tmp__22 = ( ImmediateAST ) _localctx.local__5_stmt_case4.result ; 
        tmp__23 = (ImmediateAST) mkFor( tmp__19, tmp__20.Text, tmp__21, tmp__22 ); 
        $result = tmp__23; 
      } 
    | local__1_stmt_case5='break' { 
        ImmediateAST tmp__25 ; 
        CommonToken tmp__24 ; 
        tmp__24 = ( CommonToken ) _localctx.local__1_stmt_case5 ; 
        tmp__25 = (ImmediateAST) mkBreak( tmp__24 ); 
        $result = tmp__25; 
      } 
    | local__1_stmt_case6='continue' { 
        ImmediateAST tmp__27 ; 
        CommonToken tmp__26 ; 
        tmp__26 = ( CommonToken ) _localctx.local__1_stmt_case6 ; 
        tmp__27 = (ImmediateAST) mkContinue( tmp__26 ); 
        $result = tmp__27; 
      } 
    | local__1_stmt_case7='return' local__2_stmt_case7=expr { 
        ImmediateAST tmp__30 ; 
        ImmediateAST tmp__29 ; 
        CommonToken tmp__28 ; 
        tmp__28 = ( CommonToken ) _localctx.local__1_stmt_case7 ; 
        tmp__29 = ( ImmediateAST ) _localctx.local__2_stmt_case7.result ; 
        tmp__30 = (ImmediateAST) mkReturn( tmp__28, tmp__29 ); 
        $result = tmp__30; 
      } 
    | local__1_stmt_case8='return' { 
        ImmediateAST tmp__32 ; 
        CommonToken tmp__31 ; 
        tmp__31 = ( CommonToken ) _localctx.local__1_stmt_case8 ; 
        tmp__32 = (ImmediateAST) mkReturn( tmp__31, null ); 
        $result = tmp__32; 
      } 
    | local__1_stmt_case9=ibin { 
        ImmediateAST tmp__33 ; 
        tmp__33 = ( ImmediateAST ) _localctx.local__1_stmt_case9.result ; 
        $result = tmp__33; 
      } 
; 
gen__filter_option__NEWLINE returns [System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> result] :
      local__1_gen__filter_option__NEWLINE_case0=gen__filter_option__NEWLINE local__2_gen__filter_option__NEWLINE_case0=option { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__36 ; 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__35 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__34 ; 
        tmp__34 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__1_gen__filter_option__NEWLINE_case0.result ; 
        tmp__35 = ( (int, int, string, System.Collections.Generic.List<ImmediateAST>) ) _localctx.local__2_gen__filter_option__NEWLINE_case0.result ; 
        tmp__36 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) append<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>( tmp__34, tmp__35 ); 
        $result = tmp__36; 
      } 
    | local__1_gen__filter_option__NEWLINE_case1=gen__filter_option__NEWLINE NEWLINE_17 { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__37 ; 
        tmp__37 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__1_gen__filter_option__NEWLINE_case1.result ; 
        $result = tmp__37; 
      } 
    | local__1_gen__filter_option__NEWLINE_case2=option { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__40 ; 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__39 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__38 ; 
        tmp__38 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) empty<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>(  ); 
        tmp__39 = ( (int, int, string, System.Collections.Generic.List<ImmediateAST>) ) _localctx.local__1_gen__filter_option__NEWLINE_case2.result ; 
        tmp__40 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) append<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>( tmp__38, tmp__39 ); 
        $result = tmp__40; 
      } 
    | NEWLINE_17 { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__41 ; 
        tmp__41 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) empty<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>(  ); 
        $result = tmp__41; 
      } 
; 
option returns [(int, int, string, System.Collections.Generic.List<ImmediateAST>) result] :
      local__1_option_case0=NAME_13 local__2_option_case0=gen__nullable_gen__seplist__L44__expr { 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__44 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__43 ; 
        CommonToken tmp__42 ; 
        tmp__42 = ( CommonToken ) _localctx.local__1_option_case0 ; 
        tmp__43 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_option_case0.result ; 
        tmp__44 = ((int, int, string, System.Collections.Generic.List<ImmediateAST>)) mkOptionN( tmp__42, tmp__43 ); 
        $result = tmp__44; 
      } 
    | 'do' local__2_option_case1=expr { 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__46 ; 
        ImmediateAST tmp__45 ; 
        tmp__45 = ( ImmediateAST ) _localctx.local__2_option_case1.result ; 
        tmp__46 = ((int, int, string, System.Collections.Generic.List<ImmediateAST>)) mkDoOption( tmp__45 ); 
        $result = tmp__46; 
      } 
; 
gen__nullable_gen__seplist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      { 
        System.Collections.Generic.List<ImmediateAST> tmp__47 ; 
        tmp__47 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__47; 
      } 
    | local__1_gen__nullable_gen__seplist__L44__expr_case1=gen__seplist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__48 ; 
        tmp__48 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist__L44__expr_case1.result ; 
        $result = tmp__48; 
      } 
; 
gen__seplist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist__L44__expr_case0=expr { 
        ImmediateAST tmp__50 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__49 ; 
        tmp__50 = ( ImmediateAST ) _localctx.local__1_gen__seplist__L44__expr_case0.result ; 
        tmp__49 = new System.Collections.Generic.List<ImmediateAST> { tmp__50 }; 
        $result = tmp__49; 
      } 
    | local__1_gen__seplist__L44__expr_case1=gen__seplist__L44__expr ',' local__3_gen__seplist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__53 ; 
        ImmediateAST tmp__52 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__51 ; 
        tmp__51 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist__L44__expr_case1.result ; 
        tmp__52 = ( ImmediateAST ) _localctx.local__3_gen__seplist__L44__expr_case1.result ; 
        tmp__53 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__51, tmp__52 ); 
        $result = tmp__53; 
      } 
; 
atom returns [ImmediateAST result] :
      local__1_atom_case0=atom local__2_atom_case0='.' '[' local__4_atom_case0=expr ']' { 
        ImmediateAST tmp__57 ; 
        ImmediateAST tmp__56 ; 
        ImmediateAST tmp__55 ; 
        CommonToken tmp__54 ; 
        tmp__54 = ( CommonToken ) _localctx.local__2_atom_case0 ; 
        tmp__55 = ( ImmediateAST ) _localctx.local__1_atom_case0.result ; 
        tmp__56 = ( ImmediateAST ) _localctx.local__4_atom_case0.result ; 
        tmp__57 = (ImmediateAST) mkOGet( tmp__54, tmp__55, tmp__56 ); 
        $result = tmp__57; 
      } 
    | local__1_atom_case1=atom local__2_atom_case1='.' local__3_atom_case1=NAME_13 { 
        ImmediateAST tmp__64 ; 
        ImmediateAST tmp__63 ; 
        DObj tmp__62 ; 
        CommonToken tmp__61 ; 
        CommonToken tmp__60 ; 
        ImmediateAST tmp__59 ; 
        CommonToken tmp__58 ; 
        tmp__58 = ( CommonToken ) _localctx.local__2_atom_case1 ; 
        tmp__59 = ( ImmediateAST ) _localctx.local__1_atom_case1.result ; 
        tmp__60 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__61 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__62 = (DObj) mkstr( tmp__61.Text ); 
        tmp__63 = (ImmediateAST) mkVal( tmp__60, tmp__62 ); 
        tmp__64 = (ImmediateAST) mkOGet( tmp__58, tmp__59, tmp__63 ); 
        $result = tmp__64; 
      } 
    | local__1_atom_case2=atom local__2_atom_case2='(' local__3_atom_case2=gen__closelist__L44__expr ')' { 
        ImmediateAST tmp__68 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__67 ; 
        ImmediateAST tmp__66 ; 
        CommonToken tmp__65 ; 
        tmp__65 = ( CommonToken ) _localctx.local__2_atom_case2 ; 
        tmp__66 = ( ImmediateAST ) _localctx.local__1_atom_case2.result ; 
        tmp__67 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__3_atom_case2.result ; 
        tmp__68 = (ImmediateAST) mkApp( tmp__65, tmp__66, tmp__67 ); 
        $result = tmp__68; 
      } 
    | local__1_atom_case3='[' local__2_atom_case3=gen__closelist__L44__expr ']' { 
        ImmediateAST tmp__71 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__70 ; 
        CommonToken tmp__69 ; 
        tmp__69 = ( CommonToken ) _localctx.local__1_atom_case3 ; 
        tmp__70 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case3.result ; 
        tmp__71 = (ImmediateAST) mkList( tmp__69, tmp__70 ); 
        $result = tmp__71; 
      } 
    | local__1_atom_case4='(' local__2_atom_case4=gen__closelist__L44__expr local__3_atom_case4=trailer ')' { 
        ImmediateAST tmp__75 ; 
        bool tmp__74 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__73 ; 
        CommonToken tmp__72 ; 
        tmp__72 = ( CommonToken ) _localctx.local__1_atom_case4 ; 
        tmp__73 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case4.result ; 
        tmp__74 = ( bool ) _localctx.local__3_atom_case4.result ; 
        tmp__75 = (ImmediateAST) mkTuple( tmp__72, tmp__73, tmp__74 ); 
        $result = tmp__75; 
      } 
    | local__1_atom_case5='{' local__2_atom_case5=gen__closelist__L44__pair trailer '}' { 
        ImmediateAST tmp__78 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__77 ; 
        CommonToken tmp__76 ; 
        tmp__76 = ( CommonToken ) _localctx.local__1_atom_case5 ; 
        tmp__77 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case5.result ; 
        tmp__78 = (ImmediateAST) mkDict( tmp__76, tmp__77 ); 
        $result = tmp__78; 
      } 
    | local__1_atom_case6=STR_4 { 
        ImmediateAST tmp__83 ; 
        DObj tmp__82 ; 
        string tmp__81 ; 
        CommonToken tmp__80 ; 
        CommonToken tmp__79 ; 
        tmp__79 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__80 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__81 = (string) unesc( tmp__80.Text ); 
        tmp__82 = (DObj) mkstr( tmp__81 ); 
        tmp__83 = (ImmediateAST) mkVal( tmp__79, tmp__82 ); 
        $result = tmp__83; 
      } 
    | local__1_atom_case7=INT_10 { 
        ImmediateAST tmp__88 ; 
        DObj tmp__87 ; 
        int tmp__86 ; 
        CommonToken tmp__85 ; 
        CommonToken tmp__84 ; 
        tmp__84 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__85 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__86 = 0 ; 
        tmp__87 = (DObj) mkint( tmp__85.Text, tmp__86 ); 
        tmp__88 = (ImmediateAST) mkVal( tmp__84, tmp__87 ); 
        $result = tmp__88; 
      } 
    | local__1_atom_case8=HEX_7 { 
        ImmediateAST tmp__93 ; 
        DObj tmp__92 ; 
        int tmp__91 ; 
        CommonToken tmp__90 ; 
        CommonToken tmp__89 ; 
        tmp__89 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__90 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__91 = 16 ; 
        tmp__92 = (DObj) mkint( tmp__90.Text, tmp__91 ); 
        tmp__93 = (ImmediateAST) mkVal( tmp__89, tmp__92 ); 
        $result = tmp__93; 
      } 
    | local__1_atom_case9=OCT_8 { 
        ImmediateAST tmp__98 ; 
        DObj tmp__97 ; 
        int tmp__96 ; 
        CommonToken tmp__95 ; 
        CommonToken tmp__94 ; 
        tmp__94 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__95 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__96 = 8 ; 
        tmp__97 = (DObj) mkint( tmp__95.Text, tmp__96 ); 
        tmp__98 = (ImmediateAST) mkVal( tmp__94, tmp__97 ); 
        $result = tmp__98; 
      } 
    | local__1_atom_case10=BIN_9 { 
        ImmediateAST tmp__103 ; 
        DObj tmp__102 ; 
        int tmp__101 ; 
        CommonToken tmp__100 ; 
        CommonToken tmp__99 ; 
        tmp__99 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__100 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__101 = 2 ; 
        tmp__102 = (DObj) mkint( tmp__100.Text, tmp__101 ); 
        tmp__103 = (ImmediateAST) mkVal( tmp__99, tmp__102 ); 
        $result = tmp__103; 
      } 
    | local__1_atom_case11=FLOAT_11 { 
        ImmediateAST tmp__107 ; 
        DObj tmp__106 ; 
        CommonToken tmp__105 ; 
        CommonToken tmp__104 ; 
        tmp__104 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__105 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__106 = (DObj) mkfloat( tmp__105.Text ); 
        tmp__107 = (ImmediateAST) mkVal( tmp__104, tmp__106 ); 
        $result = tmp__107; 
      } 
    | local__1_atom_case12='None' { 
        ImmediateAST tmp__110 ; 
        DObj tmp__109 ; 
        CommonToken tmp__108 ; 
        tmp__108 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__109 = (DObj) mknone(  ); 
        tmp__110 = (ImmediateAST) mkVal( tmp__108, tmp__109 ); 
        $result = tmp__110; 
      } 
    | local__1_atom_case13=NAME_13 { 
        ImmediateAST tmp__113 ; 
        CommonToken tmp__112 ; 
        CommonToken tmp__111 ; 
        tmp__111 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__112 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__113 = (ImmediateAST) mkVar( tmp__111, tmp__112.Text ); 
        $result = tmp__113; 
      } 
    | local__1_atom_case14='-' local__2_atom_case14=atom { 
        ImmediateAST tmp__116 ; 
        ImmediateAST tmp__115 ; 
        CommonToken tmp__114 ; 
        tmp__114 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__115 = ( ImmediateAST ) _localctx.local__2_atom_case14.result ; 
        tmp__116 = (ImmediateAST) mkNeg( tmp__114, tmp__115 ); 
        $result = tmp__116; 
      } 
    | local__1_atom_case15='~' local__2_atom_case15=atom { 
        ImmediateAST tmp__119 ; 
        ImmediateAST tmp__118 ; 
        CommonToken tmp__117 ; 
        tmp__117 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__118 = ( ImmediateAST ) _localctx.local__2_atom_case15.result ; 
        tmp__119 = (ImmediateAST) mkInv( tmp__117, tmp__118 ); 
        $result = tmp__119; 
      } 
    | local__1_atom_case16='if' local__2_atom_case16=expr local__3_atom_case16=then local__4_atom_case16=block 'end' { 
        ImmediateAST tmp__125 ; 
        ImmediateAST tmp__124 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__123 ; 
        CommonToken tmp__122 ; 
        ImmediateAST tmp__121 ; 
        CommonToken tmp__120 ; 
        tmp__120 = ( CommonToken ) _localctx.local__1_atom_case16 ; 
        tmp__121 = ( ImmediateAST ) _localctx.local__2_atom_case16.result ; 
        tmp__122 = ( CommonToken ) _localctx.local__3_atom_case16.result ; 
        tmp__123 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case16.result ; 
        tmp__124 = (ImmediateAST) mkBlock( tmp__122, tmp__123 ); 
        tmp__125 = (ImmediateAST) mkIfThen( tmp__120, tmp__121, tmp__124 ); 
        $result = tmp__125; 
      } 
    | local__1_atom_case17='if' local__2_atom_case17=expr local__3_atom_case17=then local__4_atom_case17=block local__5_atom_case17=gen__nullable_gen__list_gen__snd_elif__elifBlock local__6_atom_case17=gen__optional_gen__blockOf_else 'end' { 
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
        tmp__127 = ( ImmediateAST ) _localctx.local__2_atom_case17.result ; 
        tmp__128 = ( CommonToken ) _localctx.local__3_atom_case17.result ; 
        tmp__129 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case17.result ; 
        tmp__130 = (ImmediateAST) mkBlock( tmp__128, tmp__129 ); 
        elif__126 = ( tmp__127 , tmp__130 ); 
        tmp__132 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        elifs__131 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__132, elif__126 ); 
        tmp__134 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__5_atom_case17.result ; 
        elifs__133 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) extend<(ImmediateAST, ImmediateAST)>( elifs__131, tmp__134 ); 
        tmp__135 = ( CommonToken ) _localctx.local__1_atom_case17 ; 
        tmp__136 = ( ImmediateAST ) _localctx.local__6_atom_case17.result ; 
        tmp__137 = (ImmediateAST) mkNestedIf( tmp__135, elifs__131, tmp__136 ); 
        $result = tmp__137; 
      } 
    | local__1_atom_case18='fun' local__2_atom_case18=name '(' local__4_atom_case18=gen__nullable_gen__seplist__L44__name ')' local__6_atom_case18=block 'end' { 
        ImmediateAST tmp__142 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__141 ; 
        System.Collections.Generic.List<string> tmp__140 ; 
        string tmp__139 ; 
        CommonToken tmp__138 ; 
        tmp__138 = ( CommonToken ) _localctx.local__1_atom_case18 ; 
        tmp__139 = ( string ) _localctx.local__2_atom_case18.result ; 
        tmp__140 = ( System.Collections.Generic.List<string> ) _localctx.local__4_atom_case18.result ; 
        tmp__141 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__6_atom_case18.result ; 
        tmp__142 = (ImmediateAST) mkFunc( tmp__138, tmp__139, tmp__140, tmp__141 ); 
        $result = tmp__142; 
      } 
    | local__1_atom_case19='fun' '(' local__3_atom_case19=gen__nullable_gen__seplist__L44__name ')' local__5_atom_case19=block 'end' { 
        ImmediateAST tmp__147 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__146 ; 
        System.Collections.Generic.List<string> tmp__145 ; 
        string tmp__144 ; 
        CommonToken tmp__143 ; 
        tmp__143 = ( CommonToken ) _localctx.local__1_atom_case19 ; 
        tmp__144 = "" ; 
        tmp__145 = ( System.Collections.Generic.List<string> ) _localctx.local__3_atom_case19.result ; 
        tmp__146 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__5_atom_case19.result ; 
        tmp__147 = (ImmediateAST) mkFunc( tmp__143, tmp__144, tmp__145, tmp__146 ); 
        $result = tmp__147; 
      } 
    | local__1_atom_case20='(' local__2_atom_case20=gen__nullable_gen__seplist__L44__name ')' '->' local__5_atom_case20=gen__line_wrap_expr { 
        ImmediateAST tmp__153 ; 
        ImmediateAST tmp__152 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__151 ; 
        System.Collections.Generic.List<string> tmp__150 ; 
        string tmp__149 ; 
        CommonToken tmp__148 ; 
        tmp__148 = ( CommonToken ) _localctx.local__1_atom_case20 ; 
        tmp__149 = "" ; 
        tmp__150 = ( System.Collections.Generic.List<string> ) _localctx.local__2_atom_case20.result ; 
        tmp__152 = ( ImmediateAST ) _localctx.local__5_atom_case20.result ; 
        tmp__151 = new System.Collections.Generic.List<ImmediateAST> { tmp__152 }; 
        tmp__153 = (ImmediateAST) mkFunc( tmp__148, tmp__149, tmp__150, tmp__151 ); 
        $result = tmp__153; 
      } 
    | local__1_atom_case21=NAME_13 '->' local__3_atom_case21=gen__line_wrap_expr { 
        ImmediateAST tmp__160 ; 
        ImmediateAST tmp__159 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__158 ; 
        CommonToken tmp__157 ; 
        System.Collections.Generic.List<string> tmp__156 ; 
        string tmp__155 ; 
        CommonToken tmp__154 ; 
        tmp__154 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__155 = "" ; 
        tmp__157 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__156 = new System.Collections.Generic.List<string> { tmp__157.Text }; 
        tmp__159 = ( ImmediateAST ) _localctx.local__3_atom_case21.result ; 
        tmp__158 = new System.Collections.Generic.List<ImmediateAST> { tmp__159 }; 
        tmp__160 = (ImmediateAST) mkFunc( tmp__154, tmp__155, tmp__156, tmp__158 ); 
        $result = tmp__160; 
      } 
; 
gen__line_wrap_expr returns [ImmediateAST result] :
      gen__optional_NEWLINE local__2_gen__line_wrap_expr_case0=expr gen__optional_NEWLINE { 
        ImmediateAST tmp__161 ; 
        tmp__161 = ( ImmediateAST ) _localctx.local__2_gen__line_wrap_expr_case0.result ; 
        $result = tmp__161; 
      } 
; 
gen__optional_NEWLINE returns [CommonToken result] :
      { 
        $result = null; 
      } 
    | local__1_gen__optional_NEWLINE_case1=NEWLINE_17 { 
        CommonToken tmp__162 ; 
        tmp__162 = ( CommonToken ) _localctx.local__1_gen__optional_NEWLINE_case1 ; 
        $result = tmp__162; 
      } 
; 
gen__nullable_gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      { 
        System.Collections.Generic.List<string> tmp__163 ; 
        tmp__163 = (System.Collections.Generic.List<string>) empty<string>(  ); 
        $result = tmp__163; 
      } 
    | local__1_gen__nullable_gen__seplist__L44__name_case1=gen__seplist__L44__name { 
        System.Collections.Generic.List<string> tmp__164 ; 
        tmp__164 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__nullable_gen__seplist__L44__name_case1.result ; 
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
      { 
        $result = null; 
      } 
    | local__1_gen__optional_gen__blockOf_else_case1=gen__blockOf_else { 
        ImmediateAST tmp__170 ; 
        tmp__170 = ( ImmediateAST ) _localctx.local__1_gen__optional_gen__blockOf_else_case1.result ; 
        $result = tmp__170; 
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
      { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__174 ; 
        tmp__174 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__174; 
      } 
    | local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__175 ; 
        tmp__175 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case1.result ; 
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
      gen__optional_NEWLINE local__2_gen__closelist__L44__pair_case0=gen___closelist__L44__pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__182 ; 
        tmp__182 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_gen__closelist__L44__pair_case0.result ; 
        $result = tmp__182; 
      } 
; 
gen___closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen___closelist__L44__pair_case0=gen___closelist__L44__pair NEWLINE_17 { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__183 ; 
        tmp__183 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case0.result ; 
        $result = tmp__183; 
      } 
    | local__1_gen___closelist__L44__pair_case1=gen___closelist__L44__pair ',' NEWLINE_17 local__4_gen___closelist__L44__pair_case1=pair { 
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
      gen__optional_NEWLINE local__2_gen__closelist__L44__expr_case0=gen___closelist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__193 ; 
        tmp__193 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__closelist__L44__expr_case0.result ; 
        $result = tmp__193; 
      } 
; 
gen___closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen___closelist__L44__expr_case0=gen___closelist__L44__expr NEWLINE_17 { 
        System.Collections.Generic.List<ImmediateAST> tmp__194 ; 
        tmp__194 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case0.result ; 
        $result = tmp__194; 
      } 
    | local__1_gen___closelist__L44__expr_case1=gen___closelist__L44__expr ',' NEWLINE_17 local__4_gen___closelist__L44__expr_case1=expr { 
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
      gen__optional_NEWLINE local__2_gen__line_wrap__L58_case0=':' gen__optional_NEWLINE { 
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
      local__1_not_case0='not' local__2_not_case0=bin { 
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
expr returns [ImmediateAST result] :
      local__1_expr_case0=gen__seplist_gen__line_wrap__L124_L62__or_expr { 
        ImmediateAST tmp__254 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__253 ; 
        tmp__253 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_expr_case0.result ; 
        tmp__254 = (ImmediateAST) mkPipeline( tmp__253 ); 
        $result = tmp__254; 
      } 
; 
gen__seplist_gen__line_wrap__L124_L62__or_expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case0=or_expr { 
        ImmediateAST tmp__256 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__255 ; 
        tmp__256 = ( ImmediateAST ) _localctx.local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case0.result ; 
        tmp__255 = new System.Collections.Generic.List<ImmediateAST> { tmp__256 }; 
        $result = tmp__255; 
      } 
    | local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1=gen__seplist_gen__line_wrap__L124_L62__or_expr gen__line_wrap__L124_L62 local__3_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1=or_expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__259 ; 
        ImmediateAST tmp__258 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__257 ; 
        tmp__257 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1.result ; 
        tmp__258 = ( ImmediateAST ) _localctx.local__3_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1.result ; 
        tmp__259 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__257, tmp__258 ); 
        $result = tmp__259; 
      } 
; 
gen__line_wrap__L124_L62 returns [CommonToken result] :
      gen__optional_NEWLINE local__2_gen__line_wrap__L124_L62_case0='|>' gen__optional_NEWLINE { 
        CommonToken tmp__260 ; 
        tmp__260 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L124_L62_case0 ; 
        $result = tmp__260; 
      } 
; 
block returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_block_case0=gen__filter_stmt__gen__or___L59__NEWLINE { 
        System.Collections.Generic.List<ImmediateAST> tmp__261 ; 
        tmp__261 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_block_case0.result ; 
        $result = tmp__261; 
      } 
; 
gen__filter_stmt__gen__or___L59__NEWLINE returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case0=gen__filter_stmt__gen__or___L59__NEWLINE local__2_gen__filter_stmt__gen__or___L59__NEWLINE_case0=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__264 ; 
        ImmediateAST tmp__263 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__262 ; 
        tmp__262 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case0.result ; 
        tmp__263 = ( ImmediateAST ) _localctx.local__2_gen__filter_stmt__gen__or___L59__NEWLINE_case0.result ; 
        tmp__264 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__262, tmp__263 ); 
        $result = tmp__264; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case1=gen__filter_stmt__gen__or___L59__NEWLINE gen__or___L59__NEWLINE { 
        System.Collections.Generic.List<ImmediateAST> tmp__265 ; 
        tmp__265 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case1.result ; 
        $result = tmp__265; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case2=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__268 ; 
        ImmediateAST tmp__267 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__266 ; 
        tmp__266 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__267 = ( ImmediateAST ) _localctx.local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case2.result ; 
        tmp__268 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__266, tmp__267 ); 
        $result = tmp__268; 
      } 
    | gen__or___L59__NEWLINE { 
        System.Collections.Generic.List<ImmediateAST> tmp__269 ; 
        tmp__269 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__269; 
      } 
; 
gen__or___L59__NEWLINE returns [int result] :
      ';' { 
        int tmp__270 ; 
        tmp__270 = 0 ; 
        $result = tmp__270; 
      } 
    | NEWLINE_17 { 
        int tmp__271 ; 
        tmp__271 = 0 ; 
        $result = tmp__271; 
      } 
; 
lhs returns [ImmediateAST result] :
      local__1_lhs_case0=NAME_13 { 
        ImmediateAST tmp__274 ; 
        CommonToken tmp__273 ; 
        CommonToken tmp__272 ; 
        tmp__272 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__273 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__274 = (ImmediateAST) mkVar( tmp__272, tmp__273.Text ); 
        $result = tmp__274; 
      } 
    | local__1_lhs_case1=atom local__2_lhs_case1='.' '[' local__4_lhs_case1=expr ']' { 
        ImmediateAST tmp__278 ; 
        ImmediateAST tmp__277 ; 
        ImmediateAST tmp__276 ; 
        CommonToken tmp__275 ; 
        tmp__275 = ( CommonToken ) _localctx.local__2_lhs_case1 ; 
        tmp__276 = ( ImmediateAST ) _localctx.local__1_lhs_case1.result ; 
        tmp__277 = ( ImmediateAST ) _localctx.local__4_lhs_case1.result ; 
        tmp__278 = (ImmediateAST) mkOGet( tmp__275, tmp__276, tmp__277 ); 
        $result = tmp__278; 
      } 
    | local__1_lhs_case2=atom local__2_lhs_case2='.' local__3_lhs_case2=NAME_13 { 
        ImmediateAST tmp__285 ; 
        ImmediateAST tmp__284 ; 
        DObj tmp__283 ; 
        CommonToken tmp__282 ; 
        CommonToken tmp__281 ; 
        ImmediateAST tmp__280 ; 
        CommonToken tmp__279 ; 
        tmp__279 = ( CommonToken ) _localctx.local__2_lhs_case2 ; 
        tmp__280 = ( ImmediateAST ) _localctx.local__1_lhs_case2.result ; 
        tmp__281 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__282 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__283 = (DObj) mkstr( tmp__282.Text ); 
        tmp__284 = (ImmediateAST) mkVal( tmp__281, tmp__283 ); 
        tmp__285 = (ImmediateAST) mkOGet( tmp__279, tmp__280, tmp__284 ); 
        $result = tmp__285; 
      } 
; 
do returns [CommonToken result] :
      gen__optional_NEWLINE local__2_do_case0='do' { 
        CommonToken tmp__286 ; 
        tmp__286 = ( CommonToken ) _localctx.local__2_do_case0 ; 
        $result = tmp__286; 
      } 
; 
then returns [CommonToken result] :
      gen__optional_NEWLINE local__2_then_case0='then' { 
        CommonToken tmp__287 ; 
        tmp__287 = ( CommonToken ) _localctx.local__2_then_case0 ; 
        $result = tmp__287; 
      } 
; 
gen__blockOf_do returns [ImmediateAST result] :
      local__1_gen__blockOf_do_case0=do local__2_gen__blockOf_do_case0=block { 
        ImmediateAST tmp__290 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__289 ; 
        CommonToken tmp__288 ; 
        tmp__288 = ( CommonToken ) _localctx.local__1_gen__blockOf_do_case0.result ; 
        tmp__289 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_do_case0.result ; 
        tmp__290 = (ImmediateAST) mkBlock( tmp__288, tmp__289 ); 
        $result = tmp__290; 
      } 
; 
name returns [string result] :
      local__1_name_case0=NAME_13 { 
        CommonToken tmp__291 ; 
        tmp__291 = ( CommonToken ) _localctx.local__1_name_case0 ; 
        $result = tmp__291.Text; 
      } 
; 
elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      local__1_elifBlock_case0=expr local__2_elifBlock_case0=gen__blockOf_then { 
        ImmediateAST tmp__294 ; 
        ImmediateAST tmp__293 ; 
        (ImmediateAST, ImmediateAST) tmp__292 ; 
        tmp__293 = ( ImmediateAST ) _localctx.local__1_elifBlock_case0.result ; 
        tmp__294 = ( ImmediateAST ) _localctx.local__2_elifBlock_case0.result ; 
        tmp__292 = ( tmp__293 , tmp__294 ); 
        $result = tmp__292; 
      } 
; 
gen__blockOf_then returns [ImmediateAST result] :
      local__1_gen__blockOf_then_case0=then local__2_gen__blockOf_then_case0=block { 
        ImmediateAST tmp__297 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__296 ; 
        CommonToken tmp__295 ; 
        tmp__295 = ( CommonToken ) _localctx.local__1_gen__blockOf_then_case0.result ; 
        tmp__296 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_then_case0.result ; 
        tmp__297 = (ImmediateAST) mkBlock( tmp__295, tmp__296 ); 
        $result = tmp__297; 
      } 
; 
lhs_seq returns [System.Collections.Generic.List<ImmediateAST> result] :
      { 
        System.Collections.Generic.List<ImmediateAST> tmp__298 ; 
        tmp__298 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__298; 
      } 
    | local__1_lhs_seq_case1=lhs_seq local__2_lhs_seq_case1=lhs '=' { 
        System.Collections.Generic.List<ImmediateAST> tmp__301 ; 
        ImmediateAST tmp__300 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__299 ; 
        tmp__299 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_lhs_seq_case1.result ; 
        tmp__300 = ( ImmediateAST ) _localctx.local__2_lhs_seq_case1.result ; 
        tmp__301 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__299, tmp__300 ); 
        $result = tmp__301; 
      } 
; 
start returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_NEWLINE local__2_start_case0=gen__nullable_gen__seplist_NEWLINE__stmt gen__optional_NEWLINE EOF { 
        System.Collections.Generic.List<ImmediateAST> tmp__302 ; 
        tmp__302 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_start_case0.result ; 
        $result = tmp__302; 
      } 
; 
gen__nullable_gen__seplist_NEWLINE__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      { 
        System.Collections.Generic.List<ImmediateAST> tmp__303 ; 
        tmp__303 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__303; 
      } 
    | local__1_gen__nullable_gen__seplist_NEWLINE__stmt_case1=gen__seplist_NEWLINE__stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__304 ; 
        tmp__304 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist_NEWLINE__stmt_case1.result ; 
        $result = tmp__304; 
      } 
; 
gen__seplist_NEWLINE__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_NEWLINE__stmt_case0=stmt { 
        ImmediateAST tmp__306 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__305 ; 
        tmp__306 = ( ImmediateAST ) _localctx.local__1_gen__seplist_NEWLINE__stmt_case0.result ; 
        tmp__305 = new System.Collections.Generic.List<ImmediateAST> { tmp__306 }; 
        $result = tmp__305; 
      } 
    | local__1_gen__seplist_NEWLINE__stmt_case1=gen__seplist_NEWLINE__stmt NEWLINE_17 local__3_gen__seplist_NEWLINE__stmt_case1=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__309 ; 
        ImmediateAST tmp__308 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__307 ; 
        tmp__307 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_NEWLINE__stmt_case1.result ; 
        tmp__308 = ( ImmediateAST ) _localctx.local__3_gen__seplist_NEWLINE__stmt_case1.result ; 
        tmp__309 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__307, tmp__308 ); 
        $result = tmp__309; 
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
NEWLINE_17 : (CR_15? LF_16)+ (WS_INLINE_14|(CR_15? LF_16))*;


