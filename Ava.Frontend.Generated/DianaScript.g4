grammar DianaScript;
options { language = CSharp; }
stmt returns [ImmediateAST result] :
      local__1_stmt_case0=NAME_13 '{' local__3_stmt_case0=gen__filter_option__NEWLINE '}' { 
        ImmediateAST tmp__4 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__3 ; 
        CommonToken tmp__2 ; 
        CommonToken tmp__1 ; 
        tmp__1 = ( CommonToken ) _localctx.local__1_stmt_case0 ; 
        tmp__2 = ( CommonToken ) _localctx.local__1_stmt_case0 ; 
        tmp__3 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__3_stmt_case0.result ; 
        tmp__4 = (ImmediateAST) mkWorkflow( tmp__1, tmp__2.Text, null, tmp__3 ); 
        $result = tmp__4; 
      } 
    | local__1_stmt_case1=NAME_13 'as' local__3_stmt_case1=NAME_13 '{' local__5_stmt_case1=gen__filter_option__NEWLINE '}' { 
        ImmediateAST tmp__9 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__8 ; 
        CommonToken tmp__7 ; 
        CommonToken tmp__6 ; 
        CommonToken tmp__5 ; 
        tmp__5 = ( CommonToken ) _localctx.local__1_stmt_case1 ; 
        tmp__6 = ( CommonToken ) _localctx.local__1_stmt_case1 ; 
        tmp__7 = ( CommonToken ) _localctx.local__3_stmt_case1 ; 
        tmp__8 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__5_stmt_case1.result ; 
        tmp__9 = (ImmediateAST) mkWorkflow( tmp__5, tmp__6.Text, tmp__7.Text, tmp__8 ); 
        $result = tmp__9; 
      } 
    | local__1_stmt_case2='let' local__2_stmt_case2=NAME_13 '=' local__4_stmt_case2=expr { 
        ImmediateAST tmp__13 ; 
        ImmediateAST tmp__12 ; 
        CommonToken tmp__11 ; 
        CommonToken tmp__10 ; 
        tmp__10 = ( CommonToken ) _localctx.local__1_stmt_case2 ; 
        tmp__11 = ( CommonToken ) _localctx.local__2_stmt_case2 ; 
        tmp__12 = ( ImmediateAST ) _localctx.local__4_stmt_case2.result ; 
        tmp__13 = (ImmediateAST) mkLet( tmp__10, tmp__11.Text, tmp__12 ); 
        $result = tmp__13; 
      } 
    | local__1_stmt_case3=lhs_seq local__2_stmt_case3=expr { 
        ImmediateAST tmp__16 ; 
        ImmediateAST tmp__15 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__14 ; 
        tmp__14 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_stmt_case3.result ; 
        tmp__15 = ( ImmediateAST ) _localctx.local__2_stmt_case3.result ; 
        tmp__16 = (ImmediateAST) mkStoreMany( tmp__14, tmp__15 ); 
        $result = tmp__16; 
      } 
    | local__1_stmt_case4='loop' local__2_stmt_case4=block 'end' { 
        ImmediateAST tmp__21 ; 
        ImmediateAST tmp__20 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__19 ; 
        CommonToken tmp__18 ; 
        CommonToken tmp__17 ; 
        tmp__17 = ( CommonToken ) _localctx.local__1_stmt_case4 ; 
        tmp__18 = ( CommonToken ) _localctx.local__1_stmt_case4 ; 
        tmp__19 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_stmt_case4.result ; 
        tmp__20 = (ImmediateAST) mkBlock( tmp__18, tmp__19 ); 
        tmp__21 = (ImmediateAST) mkLoop( tmp__17, tmp__20 ); 
        $result = tmp__21; 
      } 
    | local__1_stmt_case5='for' local__2_stmt_case5=NAME_13 'in' local__4_stmt_case5=expr local__5_stmt_case5=gen__blockOf_do 'end' { 
        ImmediateAST tmp__26 ; 
        ImmediateAST tmp__25 ; 
        ImmediateAST tmp__24 ; 
        CommonToken tmp__23 ; 
        CommonToken tmp__22 ; 
        tmp__22 = ( CommonToken ) _localctx.local__1_stmt_case5 ; 
        tmp__23 = ( CommonToken ) _localctx.local__2_stmt_case5 ; 
        tmp__24 = ( ImmediateAST ) _localctx.local__4_stmt_case5.result ; 
        tmp__25 = ( ImmediateAST ) _localctx.local__5_stmt_case5.result ; 
        tmp__26 = (ImmediateAST) mkFor( tmp__22, tmp__23.Text, tmp__24, tmp__25 ); 
        $result = tmp__26; 
      } 
    | local__1_stmt_case6='break' { 
        ImmediateAST tmp__28 ; 
        CommonToken tmp__27 ; 
        tmp__27 = ( CommonToken ) _localctx.local__1_stmt_case6 ; 
        tmp__28 = (ImmediateAST) mkBreak( tmp__27 ); 
        $result = tmp__28; 
      } 
    | local__1_stmt_case7='continue' { 
        ImmediateAST tmp__30 ; 
        CommonToken tmp__29 ; 
        tmp__29 = ( CommonToken ) _localctx.local__1_stmt_case7 ; 
        tmp__30 = (ImmediateAST) mkContinue( tmp__29 ); 
        $result = tmp__30; 
      } 
    | local__1_stmt_case8='return' local__2_stmt_case8=expr { 
        ImmediateAST tmp__33 ; 
        ImmediateAST tmp__32 ; 
        CommonToken tmp__31 ; 
        tmp__31 = ( CommonToken ) _localctx.local__1_stmt_case8 ; 
        tmp__32 = ( ImmediateAST ) _localctx.local__2_stmt_case8.result ; 
        tmp__33 = (ImmediateAST) mkReturn( tmp__31, tmp__32 ); 
        $result = tmp__33; 
      } 
    | local__1_stmt_case9='return' { 
        ImmediateAST tmp__35 ; 
        CommonToken tmp__34 ; 
        tmp__34 = ( CommonToken ) _localctx.local__1_stmt_case9 ; 
        tmp__35 = (ImmediateAST) mkReturn( tmp__34, null ); 
        $result = tmp__35; 
      } 
    | local__1_stmt_case10='var' local__2_stmt_case10=gen__seplist__L44__name { 
        ImmediateAST tmp__38 ; 
        System.Collections.Generic.List<string> tmp__37 ; 
        CommonToken tmp__36 ; 
        tmp__36 = ( CommonToken ) _localctx.local__1_stmt_case10 ; 
        tmp__37 = ( System.Collections.Generic.List<string> ) _localctx.local__2_stmt_case10.result ; 
        tmp__38 = (ImmediateAST) mkDecl( tmp__36, tmp__37 ); 
        $result = tmp__38; 
      } 
    | local__1_stmt_case11=ibin { 
        ImmediateAST tmp__39 ; 
        tmp__39 = ( ImmediateAST ) _localctx.local__1_stmt_case11.result ; 
        $result = tmp__39; 
      } 
; 
gen__filter_option__NEWLINE returns [System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> result] :
      local__1_gen__filter_option__NEWLINE_case0=gen__filter_option__NEWLINE local__2_gen__filter_option__NEWLINE_case0=option { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__42 ; 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__41 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__40 ; 
        tmp__40 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__1_gen__filter_option__NEWLINE_case0.result ; 
        tmp__41 = ( (int, int, string, System.Collections.Generic.List<ImmediateAST>) ) _localctx.local__2_gen__filter_option__NEWLINE_case0.result ; 
        tmp__42 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) append<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>( tmp__40, tmp__41 ); 
        $result = tmp__42; 
      } 
    | local__1_gen__filter_option__NEWLINE_case1=gen__filter_option__NEWLINE NEWLINE_17 { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__43 ; 
        tmp__43 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__1_gen__filter_option__NEWLINE_case1.result ; 
        $result = tmp__43; 
      } 
    | local__1_gen__filter_option__NEWLINE_case2=option { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__46 ; 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__45 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__44 ; 
        tmp__44 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) empty<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>(  ); 
        tmp__45 = ( (int, int, string, System.Collections.Generic.List<ImmediateAST>) ) _localctx.local__1_gen__filter_option__NEWLINE_case2.result ; 
        tmp__46 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) append<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>( tmp__44, tmp__45 ); 
        $result = tmp__46; 
      } 
    | NEWLINE_17 { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__47 ; 
        tmp__47 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) empty<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>(  ); 
        $result = tmp__47; 
      } 
; 
option returns [(int, int, string, System.Collections.Generic.List<ImmediateAST>) result] :
      local__1_option_case0=NAME_13 local__2_option_case0=gen__nullable_gen__seplist__L44__expr { 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__50 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__49 ; 
        CommonToken tmp__48 ; 
        tmp__48 = ( CommonToken ) _localctx.local__1_option_case0 ; 
        tmp__49 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_option_case0.result ; 
        tmp__50 = ((int, int, string, System.Collections.Generic.List<ImmediateAST>)) mkOptionN( tmp__48, tmp__49 ); 
        $result = tmp__50; 
      } 
    | 'do' local__2_option_case1=expr { 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__52 ; 
        ImmediateAST tmp__51 ; 
        tmp__51 = ( ImmediateAST ) _localctx.local__2_option_case1.result ; 
        tmp__52 = ((int, int, string, System.Collections.Generic.List<ImmediateAST>)) mkDoOption( tmp__51 ); 
        $result = tmp__52; 
      } 
; 
gen__nullable_gen__seplist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__nullable_gen__seplist__L44__expr_case0=gen__seplist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__53 ; 
        tmp__53 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist__L44__expr_case0.result ; 
        $result = tmp__53; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__54 ; 
        tmp__54 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__54; 
      } 
; 
gen__seplist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist__L44__expr_case0=expr { 
        ImmediateAST tmp__56 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__55 ; 
        tmp__56 = ( ImmediateAST ) _localctx.local__1_gen__seplist__L44__expr_case0.result ; 
        tmp__55 = new System.Collections.Generic.List<ImmediateAST> { tmp__56 }; 
        $result = tmp__55; 
      } 
    | local__1_gen__seplist__L44__expr_case1=gen__seplist__L44__expr ',' local__3_gen__seplist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__59 ; 
        ImmediateAST tmp__58 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__57 ; 
        tmp__57 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist__L44__expr_case1.result ; 
        tmp__58 = ( ImmediateAST ) _localctx.local__3_gen__seplist__L44__expr_case1.result ; 
        tmp__59 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__57, tmp__58 ); 
        $result = tmp__59; 
      } 
; 
newline returns [CommonToken result] :
      local__1_newline_case0=NEWLINE_17 { 
        CommonToken tmp__60 ; 
        tmp__60 = ( CommonToken ) _localctx.local__1_newline_case0 ; 
        $result = tmp__60; 
      } 
    | newline local__2_newline_case1=NEWLINE_17 { 
        CommonToken tmp__61 ; 
        tmp__61 = ( CommonToken ) _localctx.local__2_newline_case1 ; 
        $result = tmp__61; 
      } 
; 
atom returns [ImmediateAST result] :
      local__1_atom_case0=atom local__2_atom_case0='.' '[' local__4_atom_case0=expr ']' { 
        ImmediateAST tmp__65 ; 
        ImmediateAST tmp__64 ; 
        ImmediateAST tmp__63 ; 
        CommonToken tmp__62 ; 
        tmp__62 = ( CommonToken ) _localctx.local__2_atom_case0 ; 
        tmp__63 = ( ImmediateAST ) _localctx.local__1_atom_case0.result ; 
        tmp__64 = ( ImmediateAST ) _localctx.local__4_atom_case0.result ; 
        tmp__65 = (ImmediateAST) mkOGet( tmp__62, tmp__63, tmp__64 ); 
        $result = tmp__65; 
      } 
    | local__1_atom_case1=atom local__2_atom_case1='.' local__3_atom_case1=NAME_13 { 
        ImmediateAST tmp__72 ; 
        ImmediateAST tmp__71 ; 
        DObj tmp__70 ; 
        CommonToken tmp__69 ; 
        CommonToken tmp__68 ; 
        ImmediateAST tmp__67 ; 
        CommonToken tmp__66 ; 
        tmp__66 = ( CommonToken ) _localctx.local__2_atom_case1 ; 
        tmp__67 = ( ImmediateAST ) _localctx.local__1_atom_case1.result ; 
        tmp__68 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__69 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__70 = (DObj) mkstr( tmp__69.Text ); 
        tmp__71 = (ImmediateAST) mkVal( tmp__68, tmp__70 ); 
        tmp__72 = (ImmediateAST) mkOGet( tmp__66, tmp__67, tmp__71 ); 
        $result = tmp__72; 
      } 
    | local__1_atom_case2=atom local__2_atom_case2='(' local__3_atom_case2=gen__closelist__L44__expr ')' { 
        ImmediateAST tmp__76 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__75 ; 
        ImmediateAST tmp__74 ; 
        CommonToken tmp__73 ; 
        tmp__73 = ( CommonToken ) _localctx.local__2_atom_case2 ; 
        tmp__74 = ( ImmediateAST ) _localctx.local__1_atom_case2.result ; 
        tmp__75 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__3_atom_case2.result ; 
        tmp__76 = (ImmediateAST) mkApp( tmp__73, tmp__74, tmp__75 ); 
        $result = tmp__76; 
      } 
    | local__1_atom_case3='[' local__2_atom_case3=gen__closelist__L44__expr ']' { 
        ImmediateAST tmp__79 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__78 ; 
        CommonToken tmp__77 ; 
        tmp__77 = ( CommonToken ) _localctx.local__1_atom_case3 ; 
        tmp__78 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case3.result ; 
        tmp__79 = (ImmediateAST) mkList( tmp__77, tmp__78 ); 
        $result = tmp__79; 
      } 
    | local__1_atom_case4='(' local__2_atom_case4=gen__closelist__L44__expr local__3_atom_case4=trailer ')' { 
        ImmediateAST tmp__83 ; 
        bool tmp__82 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__81 ; 
        CommonToken tmp__80 ; 
        tmp__80 = ( CommonToken ) _localctx.local__1_atom_case4 ; 
        tmp__81 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case4.result ; 
        tmp__82 = ( bool ) _localctx.local__3_atom_case4.result ; 
        tmp__83 = (ImmediateAST) mkTuple( tmp__80, tmp__81, tmp__82 ); 
        $result = tmp__83; 
      } 
    | local__1_atom_case5='{' local__2_atom_case5=gen__closelist__L44__pair trailer '}' { 
        ImmediateAST tmp__86 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__85 ; 
        CommonToken tmp__84 ; 
        tmp__84 = ( CommonToken ) _localctx.local__1_atom_case5 ; 
        tmp__85 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case5.result ; 
        tmp__86 = (ImmediateAST) mkDict( tmp__84, tmp__85 ); 
        $result = tmp__86; 
      } 
    | local__1_atom_case6=STR_4 { 
        ImmediateAST tmp__91 ; 
        DObj tmp__90 ; 
        string tmp__89 ; 
        CommonToken tmp__88 ; 
        CommonToken tmp__87 ; 
        tmp__87 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__88 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__89 = (string) unesc( tmp__88.Text ); 
        tmp__90 = (DObj) mkstr( tmp__89 ); 
        tmp__91 = (ImmediateAST) mkVal( tmp__87, tmp__90 ); 
        $result = tmp__91; 
      } 
    | local__1_atom_case7=INT_10 { 
        ImmediateAST tmp__96 ; 
        DObj tmp__95 ; 
        int tmp__94 ; 
        CommonToken tmp__93 ; 
        CommonToken tmp__92 ; 
        tmp__92 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__93 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__94 = 0 ; 
        tmp__95 = (DObj) mkint( tmp__93.Text, tmp__94 ); 
        tmp__96 = (ImmediateAST) mkVal( tmp__92, tmp__95 ); 
        $result = tmp__96; 
      } 
    | local__1_atom_case8=HEX_7 { 
        ImmediateAST tmp__101 ; 
        DObj tmp__100 ; 
        int tmp__99 ; 
        CommonToken tmp__98 ; 
        CommonToken tmp__97 ; 
        tmp__97 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__98 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__99 = 16 ; 
        tmp__100 = (DObj) mkint( tmp__98.Text, tmp__99 ); 
        tmp__101 = (ImmediateAST) mkVal( tmp__97, tmp__100 ); 
        $result = tmp__101; 
      } 
    | local__1_atom_case9=OCT_8 { 
        ImmediateAST tmp__106 ; 
        DObj tmp__105 ; 
        int tmp__104 ; 
        CommonToken tmp__103 ; 
        CommonToken tmp__102 ; 
        tmp__102 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__103 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__104 = 8 ; 
        tmp__105 = (DObj) mkint( tmp__103.Text, tmp__104 ); 
        tmp__106 = (ImmediateAST) mkVal( tmp__102, tmp__105 ); 
        $result = tmp__106; 
      } 
    | local__1_atom_case10=BIN_9 { 
        ImmediateAST tmp__111 ; 
        DObj tmp__110 ; 
        int tmp__109 ; 
        CommonToken tmp__108 ; 
        CommonToken tmp__107 ; 
        tmp__107 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__108 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__109 = 2 ; 
        tmp__110 = (DObj) mkint( tmp__108.Text, tmp__109 ); 
        tmp__111 = (ImmediateAST) mkVal( tmp__107, tmp__110 ); 
        $result = tmp__111; 
      } 
    | local__1_atom_case11=FLOAT_11 { 
        ImmediateAST tmp__115 ; 
        DObj tmp__114 ; 
        CommonToken tmp__113 ; 
        CommonToken tmp__112 ; 
        tmp__112 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__113 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__114 = (DObj) mkfloat( tmp__113.Text ); 
        tmp__115 = (ImmediateAST) mkVal( tmp__112, tmp__114 ); 
        $result = tmp__115; 
      } 
    | local__1_atom_case12='None' { 
        ImmediateAST tmp__118 ; 
        DObj tmp__117 ; 
        CommonToken tmp__116 ; 
        tmp__116 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__117 = (DObj) mknone(  ); 
        tmp__118 = (ImmediateAST) mkVal( tmp__116, tmp__117 ); 
        $result = tmp__118; 
      } 
    | local__1_atom_case13=NAME_13 { 
        ImmediateAST tmp__121 ; 
        CommonToken tmp__120 ; 
        CommonToken tmp__119 ; 
        tmp__119 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__120 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__121 = (ImmediateAST) mkVar( tmp__119, tmp__120.Text ); 
        $result = tmp__121; 
      } 
    | local__1_atom_case14='-' local__2_atom_case14=atom { 
        ImmediateAST tmp__124 ; 
        ImmediateAST tmp__123 ; 
        CommonToken tmp__122 ; 
        tmp__122 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__123 = ( ImmediateAST ) _localctx.local__2_atom_case14.result ; 
        tmp__124 = (ImmediateAST) mkNeg( tmp__122, tmp__123 ); 
        $result = tmp__124; 
      } 
    | local__1_atom_case15='~' local__2_atom_case15=atom { 
        ImmediateAST tmp__127 ; 
        ImmediateAST tmp__126 ; 
        CommonToken tmp__125 ; 
        tmp__125 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__126 = ( ImmediateAST ) _localctx.local__2_atom_case15.result ; 
        tmp__127 = (ImmediateAST) mkInv( tmp__125, tmp__126 ); 
        $result = tmp__127; 
      } 
    | local__1_atom_case16='if' local__2_atom_case16=expr local__3_atom_case16=then local__4_atom_case16=block 'end' { 
        ImmediateAST tmp__133 ; 
        ImmediateAST tmp__132 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__131 ; 
        CommonToken tmp__130 ; 
        ImmediateAST tmp__129 ; 
        CommonToken tmp__128 ; 
        tmp__128 = ( CommonToken ) _localctx.local__1_atom_case16 ; 
        tmp__129 = ( ImmediateAST ) _localctx.local__2_atom_case16.result ; 
        tmp__130 = ( CommonToken ) _localctx.local__3_atom_case16.result ; 
        tmp__131 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case16.result ; 
        tmp__132 = (ImmediateAST) mkBlock( tmp__130, tmp__131 ); 
        tmp__133 = (ImmediateAST) mkIfThen( tmp__128, tmp__129, tmp__132 ); 
        $result = tmp__133; 
      } 
    | local__1_atom_case17='if' local__2_atom_case17=expr local__3_atom_case17=then local__4_atom_case17=block local__5_atom_case17=gen__nullable_gen__list_gen__snd_elif__elifBlock local__6_atom_case17=gen__optional_gen__blockOf_else 'end' { 
        ImmediateAST tmp__145 ; 
        ImmediateAST tmp__144 ; 
        CommonToken tmp__143 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__141 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__142 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__139 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__140 ; 
        ImmediateAST tmp__138 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__137 ; 
        CommonToken tmp__136 ; 
        ImmediateAST tmp__135 ; 
        (ImmediateAST, ImmediateAST) elif__134 ; 
        tmp__135 = ( ImmediateAST ) _localctx.local__2_atom_case17.result ; 
        tmp__136 = ( CommonToken ) _localctx.local__3_atom_case17.result ; 
        tmp__137 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case17.result ; 
        tmp__138 = (ImmediateAST) mkBlock( tmp__136, tmp__137 ); 
        elif__134 = ( tmp__135 , tmp__138 ); 
        tmp__140 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        elifs__139 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__140, elif__134 ); 
        tmp__142 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__5_atom_case17.result ; 
        elifs__141 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) extend<(ImmediateAST, ImmediateAST)>( elifs__139, tmp__142 ); 
        tmp__143 = ( CommonToken ) _localctx.local__1_atom_case17 ; 
        tmp__144 = ( ImmediateAST ) _localctx.local__6_atom_case17.result ; 
        tmp__145 = (ImmediateAST) mkNestedIf( tmp__143, elifs__139, tmp__144 ); 
        $result = tmp__145; 
      } 
    | local__1_atom_case18='fun' local__2_atom_case18=name '(' local__4_atom_case18=gen__nullable_gen__seplist__L44__name ')' local__6_atom_case18=block 'end' { 
        ImmediateAST tmp__150 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__149 ; 
        System.Collections.Generic.List<string> tmp__148 ; 
        string tmp__147 ; 
        CommonToken tmp__146 ; 
        tmp__146 = ( CommonToken ) _localctx.local__1_atom_case18 ; 
        tmp__147 = ( string ) _localctx.local__2_atom_case18.result ; 
        tmp__148 = ( System.Collections.Generic.List<string> ) _localctx.local__4_atom_case18.result ; 
        tmp__149 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__6_atom_case18.result ; 
        tmp__150 = (ImmediateAST) mkFunc( tmp__146, tmp__147, tmp__148, tmp__149 ); 
        $result = tmp__150; 
      } 
    | local__1_atom_case19='fun' '(' local__3_atom_case19=gen__nullable_gen__seplist__L44__name ')' local__5_atom_case19=block 'end' { 
        ImmediateAST tmp__155 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__154 ; 
        System.Collections.Generic.List<string> tmp__153 ; 
        string tmp__152 ; 
        CommonToken tmp__151 ; 
        tmp__151 = ( CommonToken ) _localctx.local__1_atom_case19 ; 
        tmp__152 = "" ; 
        tmp__153 = ( System.Collections.Generic.List<string> ) _localctx.local__3_atom_case19.result ; 
        tmp__154 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__5_atom_case19.result ; 
        tmp__155 = (ImmediateAST) mkFunc( tmp__151, tmp__152, tmp__153, tmp__154 ); 
        $result = tmp__155; 
      } 
    | local__1_atom_case20='(' local__2_atom_case20=gen__nullable_gen__seplist__L44__name ')' '->' local__5_atom_case20=gen__line_wrap_expr { 
        ImmediateAST tmp__161 ; 
        ImmediateAST tmp__160 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__159 ; 
        System.Collections.Generic.List<string> tmp__158 ; 
        string tmp__157 ; 
        CommonToken tmp__156 ; 
        tmp__156 = ( CommonToken ) _localctx.local__1_atom_case20 ; 
        tmp__157 = "" ; 
        tmp__158 = ( System.Collections.Generic.List<string> ) _localctx.local__2_atom_case20.result ; 
        tmp__160 = ( ImmediateAST ) _localctx.local__5_atom_case20.result ; 
        tmp__159 = new System.Collections.Generic.List<ImmediateAST> { tmp__160 }; 
        tmp__161 = (ImmediateAST) mkFunc( tmp__156, tmp__157, tmp__158, tmp__159 ); 
        $result = tmp__161; 
      } 
    | local__1_atom_case21=NAME_13 '->' local__3_atom_case21=gen__line_wrap_expr { 
        ImmediateAST tmp__168 ; 
        ImmediateAST tmp__167 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__166 ; 
        CommonToken tmp__165 ; 
        System.Collections.Generic.List<string> tmp__164 ; 
        string tmp__163 ; 
        CommonToken tmp__162 ; 
        tmp__162 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__163 = "" ; 
        tmp__165 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__164 = new System.Collections.Generic.List<string> { tmp__165.Text }; 
        tmp__167 = ( ImmediateAST ) _localctx.local__3_atom_case21.result ; 
        tmp__166 = new System.Collections.Generic.List<ImmediateAST> { tmp__167 }; 
        tmp__168 = (ImmediateAST) mkFunc( tmp__162, tmp__163, tmp__164, tmp__166 ); 
        $result = tmp__168; 
      } 
; 
gen__line_wrap_expr returns [ImmediateAST result] :
      gen__optional_newline local__2_gen__line_wrap_expr_case0=expr gen__optional_newline { 
        ImmediateAST tmp__169 ; 
        tmp__169 = ( ImmediateAST ) _localctx.local__2_gen__line_wrap_expr_case0.result ; 
        $result = tmp__169; 
      } 
; 
gen__optional_newline returns [CommonToken result] :
      local__1_gen__optional_newline_case0=newline { 
        CommonToken tmp__170 ; 
        tmp__170 = ( CommonToken ) _localctx.local__1_gen__optional_newline_case0.result ; 
        $result = tmp__170; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__nullable_gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__nullable_gen__seplist__L44__name_case0=gen__seplist__L44__name { 
        System.Collections.Generic.List<string> tmp__171 ; 
        tmp__171 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__nullable_gen__seplist__L44__name_case0.result ; 
        $result = tmp__171; 
      } 
    | { 
        System.Collections.Generic.List<string> tmp__172 ; 
        tmp__172 = (System.Collections.Generic.List<string>) empty<string>(  ); 
        $result = tmp__172; 
      } 
; 
gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__seplist__L44__name_case0=name { 
        string tmp__174 ; 
        System.Collections.Generic.List<string> tmp__173 ; 
        tmp__174 = ( string ) _localctx.local__1_gen__seplist__L44__name_case0.result ; 
        tmp__173 = new System.Collections.Generic.List<string> { tmp__174 }; 
        $result = tmp__173; 
      } 
    | local__1_gen__seplist__L44__name_case1=gen__seplist__L44__name ',' local__3_gen__seplist__L44__name_case1=name { 
        System.Collections.Generic.List<string> tmp__177 ; 
        string tmp__176 ; 
        System.Collections.Generic.List<string> tmp__175 ; 
        tmp__175 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__seplist__L44__name_case1.result ; 
        tmp__176 = ( string ) _localctx.local__3_gen__seplist__L44__name_case1.result ; 
        tmp__177 = (System.Collections.Generic.List<string>) append<string>( tmp__175, tmp__176 ); 
        $result = tmp__177; 
      } 
; 
gen__optional_gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__optional_gen__blockOf_else_case0=gen__blockOf_else { 
        ImmediateAST tmp__178 ; 
        tmp__178 = ( ImmediateAST ) _localctx.local__1_gen__optional_gen__blockOf_else_case0.result ; 
        $result = tmp__178; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__blockOf_else_case0='else' local__2_gen__blockOf_else_case0=block { 
        ImmediateAST tmp__181 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__180 ; 
        CommonToken tmp__179 ; 
        tmp__179 = ( CommonToken ) _localctx.local__1_gen__blockOf_else_case0 ; 
        tmp__180 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_else_case0.result ; 
        tmp__181 = (ImmediateAST) mkBlock( tmp__179, tmp__180 ); 
        $result = tmp__181; 
      } 
; 
gen__nullable_gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0=gen__list_gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__182 ; 
        tmp__182 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__182; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__183 ; 
        tmp__183 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__183; 
      } 
; 
gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__list_gen__snd_elif__elifBlock_case0=gen__snd_elif__elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__185 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__184 ; 
        tmp__185 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        tmp__184 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__185 }; 
        $result = tmp__184; 
      } 
    | local__1_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock local__2_gen__list_gen__snd_elif__elifBlock_case1=gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__188 ; 
        (ImmediateAST, ImmediateAST) tmp__187 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__186 ; 
        tmp__186 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__187 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__188 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__186, tmp__187 ); 
        $result = tmp__188; 
      } 
; 
gen__snd_elif__elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      'elif' local__2_gen__snd_elif__elifBlock_case0=elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__189 ; 
        tmp__189 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__189; 
      } 
; 
gen__closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      gen__optional_newline local__2_gen__closelist__L44__pair_case0=gen___closelist__L44__pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__190 ; 
        tmp__190 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_gen__closelist__L44__pair_case0.result ; 
        $result = tmp__190; 
      } 
; 
gen___closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen___closelist__L44__pair_case0=gen___closelist__L44__pair newline { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__191 ; 
        tmp__191 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case0.result ; 
        $result = tmp__191; 
      } 
    | local__1_gen___closelist__L44__pair_case1=gen___closelist__L44__pair ',' newline local__4_gen___closelist__L44__pair_case1=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__194 ; 
        (ImmediateAST, ImmediateAST) tmp__193 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__192 ; 
        tmp__192 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case1.result ; 
        tmp__193 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__4_gen___closelist__L44__pair_case1.result ; 
        tmp__194 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__192, tmp__193 ); 
        $result = tmp__194; 
      } 
    | local__1_gen___closelist__L44__pair_case2=gen___closelist__L44__pair ',' local__3_gen___closelist__L44__pair_case2=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__197 ; 
        (ImmediateAST, ImmediateAST) tmp__196 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__195 ; 
        tmp__195 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case2.result ; 
        tmp__196 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__3_gen___closelist__L44__pair_case2.result ; 
        tmp__197 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__195, tmp__196 ); 
        $result = tmp__197; 
      } 
    | local__1_gen___closelist__L44__pair_case3=pair { 
        (ImmediateAST, ImmediateAST) tmp__199 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__198 ; 
        tmp__199 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen___closelist__L44__pair_case3.result ; 
        tmp__198 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__199 }; 
        $result = tmp__198; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__200 ; 
        tmp__200 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { }; 
        $result = tmp__200; 
      } 
; 
gen__closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_gen__closelist__L44__expr_case0=gen___closelist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__201 ; 
        tmp__201 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__closelist__L44__expr_case0.result ; 
        $result = tmp__201; 
      } 
; 
gen___closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen___closelist__L44__expr_case0=gen___closelist__L44__expr newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__202 ; 
        tmp__202 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case0.result ; 
        $result = tmp__202; 
      } 
    | local__1_gen___closelist__L44__expr_case1=gen___closelist__L44__expr ',' newline local__4_gen___closelist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__205 ; 
        ImmediateAST tmp__204 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__203 ; 
        tmp__203 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case1.result ; 
        tmp__204 = ( ImmediateAST ) _localctx.local__4_gen___closelist__L44__expr_case1.result ; 
        tmp__205 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__203, tmp__204 ); 
        $result = tmp__205; 
      } 
    | local__1_gen___closelist__L44__expr_case2=gen___closelist__L44__expr ',' local__3_gen___closelist__L44__expr_case2=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__208 ; 
        ImmediateAST tmp__207 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__206 ; 
        tmp__206 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case2.result ; 
        tmp__207 = ( ImmediateAST ) _localctx.local__3_gen___closelist__L44__expr_case2.result ; 
        tmp__208 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__206, tmp__207 ); 
        $result = tmp__208; 
      } 
    | local__1_gen___closelist__L44__expr_case3=expr { 
        ImmediateAST tmp__210 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__209 ; 
        tmp__210 = ( ImmediateAST ) _localctx.local__1_gen___closelist__L44__expr_case3.result ; 
        tmp__209 = new System.Collections.Generic.List<ImmediateAST> { tmp__210 }; 
        $result = tmp__209; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__211 ; 
        tmp__211 = new System.Collections.Generic.List<ImmediateAST> { }; 
        $result = tmp__211; 
      } 
; 
pair returns [(ImmediateAST, ImmediateAST) result] :
      local__1_pair_case0=expr gen__line_wrap__L58 local__3_pair_case0=expr { 
        ImmediateAST tmp__214 ; 
        ImmediateAST tmp__213 ; 
        (ImmediateAST, ImmediateAST) tmp__212 ; 
        tmp__213 = ( ImmediateAST ) _localctx.local__1_pair_case0.result ; 
        tmp__214 = ( ImmediateAST ) _localctx.local__3_pair_case0.result ; 
        tmp__212 = ( tmp__213 , tmp__214 ); 
        $result = tmp__212; 
      } 
; 
gen__line_wrap__L58 returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap__L58_case0=':' gen__optional_newline { 
        CommonToken tmp__215 ; 
        tmp__215 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L58_case0 ; 
        $result = tmp__215; 
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
        ImmediateAST tmp__217 ; 
        System.Collections.Generic.List<object> tmp__216 ; 
        tmp__216 = ( System.Collections.Generic.List<object> ) _localctx.local__1_bin_case0.result ; 
        tmp__217 = (ImmediateAST) resolve_binop( tmp__216 ); 
        $result = tmp__217; 
      } 
; 
binseq returns [System.Collections.Generic.List<object> result] :
      local__1_binseq_case0=atom { 
        System.Collections.Generic.List<object> tmp__221 ; 
        object tmp__220 ; 
        ImmediateAST tmp__219 ; 
        System.Collections.Generic.List<object> tmp__218 ; 
        tmp__218 = (System.Collections.Generic.List<object>) empty<object>(  ); 
        tmp__219 = ( ImmediateAST ) _localctx.local__1_binseq_case0.result ; 
        tmp__220 = (object) to_obj<ImmediateAST>( tmp__219 ); 
        tmp__221 = (System.Collections.Generic.List<object>) append<object>( tmp__218, tmp__220 ); 
        $result = tmp__221; 
      } 
    | local__1_binseq_case1=binseq local__2_binseq_case1=binop local__3_binseq_case1=atom { 
        object tmp__227 ; 
        ImmediateAST tmp__226 ; 
        System.Collections.Generic.List<object> tmp__225 ; 
        System.Collections.Generic.List<object> block__222 ; 
        object tmp__224 ; 
        System.Collections.Generic.List<object> tmp__223 ; 
        tmp__223 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__224 = ( object ) _localctx.local__2_binseq_case1.result ; 
        block__222 = (System.Collections.Generic.List<object>) append<object>( tmp__223, tmp__224 ); 
        tmp__225 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__226 = ( ImmediateAST ) _localctx.local__3_binseq_case1.result ; 
        tmp__227 = (object) to_obj<ImmediateAST>( tmp__226 ); 
        block__222 = (System.Collections.Generic.List<object>) append<object>( tmp__225, tmp__227 ); 
        $result = block__222; 
      } 
; 
ibin returns [ImmediateAST result] :
      local__1_ibin_case0=lhs local__2_ibin_case0=ibinop local__3_ibin_case0='=' local__4_ibin_case0=expr { 
        ImmediateAST tmp__232 ; 
        ImmediateAST tmp__231 ; 
        string tmp__230 ; 
        ImmediateAST tmp__229 ; 
        CommonToken tmp__228 ; 
        tmp__228 = ( CommonToken ) _localctx.local__3_ibin_case0 ; 
        tmp__229 = ( ImmediateAST ) _localctx.local__1_ibin_case0.result ; 
        tmp__230 = ( string ) _localctx.local__2_ibin_case0.result ; 
        tmp__231 = ( ImmediateAST ) _localctx.local__4_ibin_case0.result ; 
        tmp__232 = (ImmediateAST) mkIBin( tmp__228, tmp__229, tmp__230, tmp__231 ); 
        $result = tmp__232; 
      } 
; 
ibinop returns [string result] :
      local__1_ibinop_case0=SINGLE_BINOP_2 { 
        CommonToken tmp__233 ; 
        tmp__233 = ( CommonToken ) _localctx.local__1_ibinop_case0 ; 
        $result = tmp__233.Text; 
      } 
    | '-' { 
        string tmp__234 ; 
        tmp__234 = "-" ; 
        $result = tmp__234; 
      } 
; 
binop returns [object result] :
      local__1_binop_case0=SINGLE_BINOP_2 { 
        object tmp__237 ; 
        CommonToken tmp__236 ; 
        CommonToken tmp__235 ; 
        tmp__235 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__236 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__237 = (object) mkop( tmp__235, tmp__236.Text ); 
        $result = tmp__237; 
      } 
    | local__1_binop_case1='not' 'in' { 
        object tmp__240 ; 
        string tmp__239 ; 
        CommonToken tmp__238 ; 
        tmp__238 = ( CommonToken ) _localctx.local__1_binop_case1 ; 
        tmp__239 = "notin" ; 
        tmp__240 = (object) mkop( tmp__238, tmp__239 ); 
        $result = tmp__240; 
      } 
    | local__1_binop_case2='in' { 
        object tmp__243 ; 
        string tmp__242 ; 
        CommonToken tmp__241 ; 
        tmp__241 = ( CommonToken ) _localctx.local__1_binop_case2 ; 
        tmp__242 = "in" ; 
        tmp__243 = (object) mkop( tmp__241, tmp__242 ); 
        $result = tmp__243; 
      } 
    | local__1_binop_case3='-' { 
        object tmp__246 ; 
        string tmp__245 ; 
        CommonToken tmp__244 ; 
        tmp__244 = ( CommonToken ) _localctx.local__1_binop_case3 ; 
        tmp__245 = "-" ; 
        tmp__246 = (object) mkop( tmp__244, tmp__245 ); 
        $result = tmp__246; 
      } 
; 
not returns [ImmediateAST result] :
      local__1_not_case0='not' local__2_not_case0=bin { 
        ImmediateAST tmp__249 ; 
        ImmediateAST tmp__248 ; 
        CommonToken tmp__247 ; 
        tmp__247 = ( CommonToken ) _localctx.local__1_not_case0 ; 
        tmp__248 = ( ImmediateAST ) _localctx.local__2_not_case0.result ; 
        tmp__249 = (ImmediateAST) mkNot( tmp__247, tmp__248 ); 
        $result = tmp__249; 
      } 
    | local__1_not_case1=bin { 
        ImmediateAST tmp__250 ; 
        tmp__250 = ( ImmediateAST ) _localctx.local__1_not_case1.result ; 
        $result = tmp__250; 
      } 
; 
and_expr returns [ImmediateAST result] :
      local__1_and_expr_case0=and_expr local__2_and_expr_case0='and' local__3_and_expr_case0=not { 
        ImmediateAST tmp__254 ; 
        ImmediateAST tmp__253 ; 
        ImmediateAST tmp__252 ; 
        CommonToken tmp__251 ; 
        tmp__251 = ( CommonToken ) _localctx.local__2_and_expr_case0 ; 
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
or_expr returns [ImmediateAST result] :
      local__1_or_expr_case0=or_expr local__2_or_expr_case0='or' local__3_or_expr_case0=and_expr { 
        ImmediateAST tmp__259 ; 
        ImmediateAST tmp__258 ; 
        ImmediateAST tmp__257 ; 
        CommonToken tmp__256 ; 
        tmp__256 = ( CommonToken ) _localctx.local__2_or_expr_case0 ; 
        tmp__257 = ( ImmediateAST ) _localctx.local__1_or_expr_case0.result ; 
        tmp__258 = ( ImmediateAST ) _localctx.local__3_or_expr_case0.result ; 
        tmp__259 = (ImmediateAST) mkAnd( tmp__256, tmp__257, tmp__258 ); 
        $result = tmp__259; 
      } 
    | local__1_or_expr_case1=and_expr { 
        ImmediateAST tmp__260 ; 
        tmp__260 = ( ImmediateAST ) _localctx.local__1_or_expr_case1.result ; 
        $result = tmp__260; 
      } 
; 
expr returns [ImmediateAST result] :
      local__1_expr_case0=gen__seplist_gen__line_wrap__L124_L62__or_expr { 
        ImmediateAST tmp__262 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__261 ; 
        tmp__261 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_expr_case0.result ; 
        tmp__262 = (ImmediateAST) mkPipeline( tmp__261 ); 
        $result = tmp__262; 
      } 
; 
gen__seplist_gen__line_wrap__L124_L62__or_expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case0=or_expr { 
        ImmediateAST tmp__264 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__263 ; 
        tmp__264 = ( ImmediateAST ) _localctx.local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case0.result ; 
        tmp__263 = new System.Collections.Generic.List<ImmediateAST> { tmp__264 }; 
        $result = tmp__263; 
      } 
    | local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1=gen__seplist_gen__line_wrap__L124_L62__or_expr gen__line_wrap__L124_L62 local__3_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1=or_expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__267 ; 
        ImmediateAST tmp__266 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__265 ; 
        tmp__265 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1.result ; 
        tmp__266 = ( ImmediateAST ) _localctx.local__3_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1.result ; 
        tmp__267 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__265, tmp__266 ); 
        $result = tmp__267; 
      } 
; 
gen__line_wrap__L124_L62 returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap__L124_L62_case0='|>' gen__optional_newline { 
        CommonToken tmp__268 ; 
        tmp__268 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L124_L62_case0 ; 
        $result = tmp__268; 
      } 
; 
block returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_block_case0=gen__filter_stmt__gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__269 ; 
        tmp__269 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_block_case0.result ; 
        $result = tmp__269; 
      } 
; 
gen__filter_stmt__gen__or___L59__newline returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__filter_stmt__gen__or___L59__newline_case0=gen__filter_stmt__gen__or___L59__newline local__2_gen__filter_stmt__gen__or___L59__newline_case0=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__272 ; 
        ImmediateAST tmp__271 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__270 ; 
        tmp__270 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case0.result ; 
        tmp__271 = ( ImmediateAST ) _localctx.local__2_gen__filter_stmt__gen__or___L59__newline_case0.result ; 
        tmp__272 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__270, tmp__271 ); 
        $result = tmp__272; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__newline_case1=gen__filter_stmt__gen__or___L59__newline gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__273 ; 
        tmp__273 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case1.result ; 
        $result = tmp__273; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__newline_case2=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__276 ; 
        ImmediateAST tmp__275 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__274 ; 
        tmp__274 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__275 = ( ImmediateAST ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case2.result ; 
        tmp__276 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__274, tmp__275 ); 
        $result = tmp__276; 
      } 
    | gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__277 ; 
        tmp__277 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__277; 
      } 
; 
gen__or___L59__newline returns [int result] :
      ';' { 
        int tmp__278 ; 
        tmp__278 = 0 ; 
        $result = tmp__278; 
      } 
    | newline { 
        int tmp__279 ; 
        tmp__279 = 0 ; 
        $result = tmp__279; 
      } 
; 
lhs returns [ImmediateAST result] :
      local__1_lhs_case0=NAME_13 { 
        ImmediateAST tmp__282 ; 
        CommonToken tmp__281 ; 
        CommonToken tmp__280 ; 
        tmp__280 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__281 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__282 = (ImmediateAST) mkVar( tmp__280, tmp__281.Text ); 
        $result = tmp__282; 
      } 
    | local__1_lhs_case1=atom local__2_lhs_case1='.' '[' local__4_lhs_case1=expr ']' { 
        ImmediateAST tmp__286 ; 
        ImmediateAST tmp__285 ; 
        ImmediateAST tmp__284 ; 
        CommonToken tmp__283 ; 
        tmp__283 = ( CommonToken ) _localctx.local__2_lhs_case1 ; 
        tmp__284 = ( ImmediateAST ) _localctx.local__1_lhs_case1.result ; 
        tmp__285 = ( ImmediateAST ) _localctx.local__4_lhs_case1.result ; 
        tmp__286 = (ImmediateAST) mkOGet( tmp__283, tmp__284, tmp__285 ); 
        $result = tmp__286; 
      } 
    | local__1_lhs_case2=atom local__2_lhs_case2='.' local__3_lhs_case2=NAME_13 { 
        ImmediateAST tmp__293 ; 
        ImmediateAST tmp__292 ; 
        DObj tmp__291 ; 
        CommonToken tmp__290 ; 
        CommonToken tmp__289 ; 
        ImmediateAST tmp__288 ; 
        CommonToken tmp__287 ; 
        tmp__287 = ( CommonToken ) _localctx.local__2_lhs_case2 ; 
        tmp__288 = ( ImmediateAST ) _localctx.local__1_lhs_case2.result ; 
        tmp__289 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__290 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__291 = (DObj) mkstr( tmp__290.Text ); 
        tmp__292 = (ImmediateAST) mkVal( tmp__289, tmp__291 ); 
        tmp__293 = (ImmediateAST) mkOGet( tmp__287, tmp__288, tmp__292 ); 
        $result = tmp__293; 
      } 
; 
do returns [CommonToken result] :
      gen__optional_newline local__2_do_case0='do' { 
        CommonToken tmp__294 ; 
        tmp__294 = ( CommonToken ) _localctx.local__2_do_case0 ; 
        $result = tmp__294; 
      } 
; 
then returns [CommonToken result] :
      gen__optional_newline local__2_then_case0='then' { 
        CommonToken tmp__295 ; 
        tmp__295 = ( CommonToken ) _localctx.local__2_then_case0 ; 
        $result = tmp__295; 
      } 
; 
gen__blockOf_do returns [ImmediateAST result] :
      local__1_gen__blockOf_do_case0=do local__2_gen__blockOf_do_case0=block { 
        ImmediateAST tmp__298 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__297 ; 
        CommonToken tmp__296 ; 
        tmp__296 = ( CommonToken ) _localctx.local__1_gen__blockOf_do_case0.result ; 
        tmp__297 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_do_case0.result ; 
        tmp__298 = (ImmediateAST) mkBlock( tmp__296, tmp__297 ); 
        $result = tmp__298; 
      } 
; 
name returns [string result] :
      local__1_name_case0=NAME_13 { 
        CommonToken tmp__299 ; 
        tmp__299 = ( CommonToken ) _localctx.local__1_name_case0 ; 
        $result = tmp__299.Text; 
      } 
; 
elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      local__1_elifBlock_case0=expr local__2_elifBlock_case0=gen__blockOf_then { 
        ImmediateAST tmp__302 ; 
        ImmediateAST tmp__301 ; 
        (ImmediateAST, ImmediateAST) tmp__300 ; 
        tmp__301 = ( ImmediateAST ) _localctx.local__1_elifBlock_case0.result ; 
        tmp__302 = ( ImmediateAST ) _localctx.local__2_elifBlock_case0.result ; 
        tmp__300 = ( tmp__301 , tmp__302 ); 
        $result = tmp__300; 
      } 
; 
gen__blockOf_then returns [ImmediateAST result] :
      local__1_gen__blockOf_then_case0=then local__2_gen__blockOf_then_case0=block { 
        ImmediateAST tmp__305 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__304 ; 
        CommonToken tmp__303 ; 
        tmp__303 = ( CommonToken ) _localctx.local__1_gen__blockOf_then_case0.result ; 
        tmp__304 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_then_case0.result ; 
        tmp__305 = (ImmediateAST) mkBlock( tmp__303, tmp__304 ); 
        $result = tmp__305; 
      } 
; 
lhs_seq returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_lhs_seq_case0=lhs_seq local__2_lhs_seq_case0=lhs '=' { 
        System.Collections.Generic.List<ImmediateAST> tmp__308 ; 
        ImmediateAST tmp__307 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__306 ; 
        tmp__306 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_lhs_seq_case0.result ; 
        tmp__307 = ( ImmediateAST ) _localctx.local__2_lhs_seq_case0.result ; 
        tmp__308 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__306, tmp__307 ); 
        $result = tmp__308; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__309 ; 
        tmp__309 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__309; 
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
fragment UCODE_12 : [\u0061-\u007A]|[\u0041-\u005A]|'_'|[\u4e00-\u9fa5];
NAME_13 : UCODE_12 (DIGIT_6|UCODE_12)*;
WS_INLINE_14 : (' '|'\t')+ -> skip;
fragment CR_15 : '\r';
fragment LF_16 : '\n';
NEWLINE_17 : (CR_15? LF_16)+ (WS_INLINE_14|(CR_15? LF_16))*;


