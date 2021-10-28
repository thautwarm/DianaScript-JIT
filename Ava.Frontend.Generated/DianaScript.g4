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
atom returns [ImmediateAST result] :
      local__1_atom_case0=atom local__2_atom_case0='.' '[' local__4_atom_case0=expr ']' { 
        ImmediateAST tmp__63 ; 
        ImmediateAST tmp__62 ; 
        ImmediateAST tmp__61 ; 
        CommonToken tmp__60 ; 
        tmp__60 = ( CommonToken ) _localctx.local__2_atom_case0 ; 
        tmp__61 = ( ImmediateAST ) _localctx.local__1_atom_case0.result ; 
        tmp__62 = ( ImmediateAST ) _localctx.local__4_atom_case0.result ; 
        tmp__63 = (ImmediateAST) mkOGet( tmp__60, tmp__61, tmp__62 ); 
        $result = tmp__63; 
      } 
    | local__1_atom_case1=atom local__2_atom_case1='.' local__3_atom_case1=NAME_13 { 
        ImmediateAST tmp__70 ; 
        ImmediateAST tmp__69 ; 
        DObj tmp__68 ; 
        CommonToken tmp__67 ; 
        CommonToken tmp__66 ; 
        ImmediateAST tmp__65 ; 
        CommonToken tmp__64 ; 
        tmp__64 = ( CommonToken ) _localctx.local__2_atom_case1 ; 
        tmp__65 = ( ImmediateAST ) _localctx.local__1_atom_case1.result ; 
        tmp__66 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__67 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__68 = (DObj) mkstr( tmp__67.Text ); 
        tmp__69 = (ImmediateAST) mkVal( tmp__66, tmp__68 ); 
        tmp__70 = (ImmediateAST) mkOGet( tmp__64, tmp__65, tmp__69 ); 
        $result = tmp__70; 
      } 
    | local__1_atom_case2=atom local__2_atom_case2='(' local__3_atom_case2=gen__closelist__L44__expr ')' { 
        ImmediateAST tmp__74 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__73 ; 
        ImmediateAST tmp__72 ; 
        CommonToken tmp__71 ; 
        tmp__71 = ( CommonToken ) _localctx.local__2_atom_case2 ; 
        tmp__72 = ( ImmediateAST ) _localctx.local__1_atom_case2.result ; 
        tmp__73 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__3_atom_case2.result ; 
        tmp__74 = (ImmediateAST) mkApp( tmp__71, tmp__72, tmp__73 ); 
        $result = tmp__74; 
      } 
    | local__1_atom_case3='[' local__2_atom_case3=gen__closelist__L44__expr ']' { 
        ImmediateAST tmp__77 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__76 ; 
        CommonToken tmp__75 ; 
        tmp__75 = ( CommonToken ) _localctx.local__1_atom_case3 ; 
        tmp__76 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case3.result ; 
        tmp__77 = (ImmediateAST) mkList( tmp__75, tmp__76 ); 
        $result = tmp__77; 
      } 
    | local__1_atom_case4='(' local__2_atom_case4=gen__closelist__L44__expr local__3_atom_case4=trailer ')' { 
        ImmediateAST tmp__81 ; 
        bool tmp__80 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__79 ; 
        CommonToken tmp__78 ; 
        tmp__78 = ( CommonToken ) _localctx.local__1_atom_case4 ; 
        tmp__79 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case4.result ; 
        tmp__80 = ( bool ) _localctx.local__3_atom_case4.result ; 
        tmp__81 = (ImmediateAST) mkTuple( tmp__78, tmp__79, tmp__80 ); 
        $result = tmp__81; 
      } 
    | local__1_atom_case5='{' local__2_atom_case5=gen__closelist__L44__pair trailer '}' { 
        ImmediateAST tmp__84 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__83 ; 
        CommonToken tmp__82 ; 
        tmp__82 = ( CommonToken ) _localctx.local__1_atom_case5 ; 
        tmp__83 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case5.result ; 
        tmp__84 = (ImmediateAST) mkDict( tmp__82, tmp__83 ); 
        $result = tmp__84; 
      } 
    | local__1_atom_case6=STR_4 { 
        ImmediateAST tmp__89 ; 
        DObj tmp__88 ; 
        string tmp__87 ; 
        CommonToken tmp__86 ; 
        CommonToken tmp__85 ; 
        tmp__85 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__86 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__87 = (string) unesc( tmp__86.Text ); 
        tmp__88 = (DObj) mkstr( tmp__87 ); 
        tmp__89 = (ImmediateAST) mkVal( tmp__85, tmp__88 ); 
        $result = tmp__89; 
      } 
    | local__1_atom_case7=INT_10 { 
        ImmediateAST tmp__94 ; 
        DObj tmp__93 ; 
        int tmp__92 ; 
        CommonToken tmp__91 ; 
        CommonToken tmp__90 ; 
        tmp__90 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__91 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__92 = 0 ; 
        tmp__93 = (DObj) mkint( tmp__91.Text, tmp__92 ); 
        tmp__94 = (ImmediateAST) mkVal( tmp__90, tmp__93 ); 
        $result = tmp__94; 
      } 
    | local__1_atom_case8=HEX_7 { 
        ImmediateAST tmp__99 ; 
        DObj tmp__98 ; 
        int tmp__97 ; 
        CommonToken tmp__96 ; 
        CommonToken tmp__95 ; 
        tmp__95 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__96 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__97 = 16 ; 
        tmp__98 = (DObj) mkint( tmp__96.Text, tmp__97 ); 
        tmp__99 = (ImmediateAST) mkVal( tmp__95, tmp__98 ); 
        $result = tmp__99; 
      } 
    | local__1_atom_case9=OCT_8 { 
        ImmediateAST tmp__104 ; 
        DObj tmp__103 ; 
        int tmp__102 ; 
        CommonToken tmp__101 ; 
        CommonToken tmp__100 ; 
        tmp__100 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__101 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__102 = 8 ; 
        tmp__103 = (DObj) mkint( tmp__101.Text, tmp__102 ); 
        tmp__104 = (ImmediateAST) mkVal( tmp__100, tmp__103 ); 
        $result = tmp__104; 
      } 
    | local__1_atom_case10=BIN_9 { 
        ImmediateAST tmp__109 ; 
        DObj tmp__108 ; 
        int tmp__107 ; 
        CommonToken tmp__106 ; 
        CommonToken tmp__105 ; 
        tmp__105 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__106 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__107 = 2 ; 
        tmp__108 = (DObj) mkint( tmp__106.Text, tmp__107 ); 
        tmp__109 = (ImmediateAST) mkVal( tmp__105, tmp__108 ); 
        $result = tmp__109; 
      } 
    | local__1_atom_case11=FLOAT_11 { 
        ImmediateAST tmp__113 ; 
        DObj tmp__112 ; 
        CommonToken tmp__111 ; 
        CommonToken tmp__110 ; 
        tmp__110 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__111 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__112 = (DObj) mkfloat( tmp__111.Text ); 
        tmp__113 = (ImmediateAST) mkVal( tmp__110, tmp__112 ); 
        $result = tmp__113; 
      } 
    | local__1_atom_case12='None' { 
        ImmediateAST tmp__116 ; 
        DObj tmp__115 ; 
        CommonToken tmp__114 ; 
        tmp__114 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__115 = (DObj) mknone(  ); 
        tmp__116 = (ImmediateAST) mkVal( tmp__114, tmp__115 ); 
        $result = tmp__116; 
      } 
    | local__1_atom_case13=NAME_13 { 
        ImmediateAST tmp__119 ; 
        CommonToken tmp__118 ; 
        CommonToken tmp__117 ; 
        tmp__117 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__118 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__119 = (ImmediateAST) mkVar( tmp__117, tmp__118.Text ); 
        $result = tmp__119; 
      } 
    | local__1_atom_case14='-' local__2_atom_case14=atom { 
        ImmediateAST tmp__122 ; 
        ImmediateAST tmp__121 ; 
        CommonToken tmp__120 ; 
        tmp__120 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__121 = ( ImmediateAST ) _localctx.local__2_atom_case14.result ; 
        tmp__122 = (ImmediateAST) mkNeg( tmp__120, tmp__121 ); 
        $result = tmp__122; 
      } 
    | local__1_atom_case15='~' local__2_atom_case15=atom { 
        ImmediateAST tmp__125 ; 
        ImmediateAST tmp__124 ; 
        CommonToken tmp__123 ; 
        tmp__123 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__124 = ( ImmediateAST ) _localctx.local__2_atom_case15.result ; 
        tmp__125 = (ImmediateAST) mkInv( tmp__123, tmp__124 ); 
        $result = tmp__125; 
      } 
    | local__1_atom_case16='if' local__2_atom_case16=expr local__3_atom_case16=then local__4_atom_case16=block 'end' { 
        ImmediateAST tmp__131 ; 
        ImmediateAST tmp__130 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__129 ; 
        CommonToken tmp__128 ; 
        ImmediateAST tmp__127 ; 
        CommonToken tmp__126 ; 
        tmp__126 = ( CommonToken ) _localctx.local__1_atom_case16 ; 
        tmp__127 = ( ImmediateAST ) _localctx.local__2_atom_case16.result ; 
        tmp__128 = ( CommonToken ) _localctx.local__3_atom_case16.result ; 
        tmp__129 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case16.result ; 
        tmp__130 = (ImmediateAST) mkBlock( tmp__128, tmp__129 ); 
        tmp__131 = (ImmediateAST) mkIfThen( tmp__126, tmp__127, tmp__130 ); 
        $result = tmp__131; 
      } 
    | local__1_atom_case17='if' local__2_atom_case17=expr local__3_atom_case17=then local__4_atom_case17=block local__5_atom_case17=gen__nullable_gen__list_gen__snd_elif__elifBlock local__6_atom_case17=gen__optional_gen__blockOf_else 'end' { 
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
        tmp__133 = ( ImmediateAST ) _localctx.local__2_atom_case17.result ; 
        tmp__134 = ( CommonToken ) _localctx.local__3_atom_case17.result ; 
        tmp__135 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case17.result ; 
        tmp__136 = (ImmediateAST) mkBlock( tmp__134, tmp__135 ); 
        elif__132 = ( tmp__133 , tmp__136 ); 
        tmp__138 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        elifs__137 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__138, elif__132 ); 
        tmp__140 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__5_atom_case17.result ; 
        elifs__139 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) extend<(ImmediateAST, ImmediateAST)>( elifs__137, tmp__140 ); 
        tmp__141 = ( CommonToken ) _localctx.local__1_atom_case17 ; 
        tmp__142 = ( ImmediateAST ) _localctx.local__6_atom_case17.result ; 
        tmp__143 = (ImmediateAST) mkNestedIf( tmp__141, elifs__137, tmp__142 ); 
        $result = tmp__143; 
      } 
    | local__1_atom_case18='fun' local__2_atom_case18=name '(' local__4_atom_case18=gen__nullable_gen__seplist__L44__name ')' local__6_atom_case18=block 'end' { 
        ImmediateAST tmp__148 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__147 ; 
        System.Collections.Generic.List<string> tmp__146 ; 
        string tmp__145 ; 
        CommonToken tmp__144 ; 
        tmp__144 = ( CommonToken ) _localctx.local__1_atom_case18 ; 
        tmp__145 = ( string ) _localctx.local__2_atom_case18.result ; 
        tmp__146 = ( System.Collections.Generic.List<string> ) _localctx.local__4_atom_case18.result ; 
        tmp__147 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__6_atom_case18.result ; 
        tmp__148 = (ImmediateAST) mkFunc( tmp__144, tmp__145, tmp__146, tmp__147 ); 
        $result = tmp__148; 
      } 
    | local__1_atom_case19='fun' '(' local__3_atom_case19=gen__nullable_gen__seplist__L44__name ')' local__5_atom_case19=block 'end' { 
        ImmediateAST tmp__153 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__152 ; 
        System.Collections.Generic.List<string> tmp__151 ; 
        string tmp__150 ; 
        CommonToken tmp__149 ; 
        tmp__149 = ( CommonToken ) _localctx.local__1_atom_case19 ; 
        tmp__150 = "" ; 
        tmp__151 = ( System.Collections.Generic.List<string> ) _localctx.local__3_atom_case19.result ; 
        tmp__152 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__5_atom_case19.result ; 
        tmp__153 = (ImmediateAST) mkFunc( tmp__149, tmp__150, tmp__151, tmp__152 ); 
        $result = tmp__153; 
      } 
    | local__1_atom_case20='(' local__2_atom_case20=gen__nullable_gen__seplist__L44__name ')' '->' local__5_atom_case20=gen__line_wrap_expr { 
        ImmediateAST tmp__159 ; 
        ImmediateAST tmp__158 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__157 ; 
        System.Collections.Generic.List<string> tmp__156 ; 
        string tmp__155 ; 
        CommonToken tmp__154 ; 
        tmp__154 = ( CommonToken ) _localctx.local__1_atom_case20 ; 
        tmp__155 = "" ; 
        tmp__156 = ( System.Collections.Generic.List<string> ) _localctx.local__2_atom_case20.result ; 
        tmp__158 = ( ImmediateAST ) _localctx.local__5_atom_case20.result ; 
        tmp__157 = new System.Collections.Generic.List<ImmediateAST> { tmp__158 }; 
        tmp__159 = (ImmediateAST) mkFunc( tmp__154, tmp__155, tmp__156, tmp__157 ); 
        $result = tmp__159; 
      } 
    | local__1_atom_case21=NAME_13 '->' local__3_atom_case21=gen__line_wrap_expr { 
        ImmediateAST tmp__166 ; 
        ImmediateAST tmp__165 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__164 ; 
        CommonToken tmp__163 ; 
        System.Collections.Generic.List<string> tmp__162 ; 
        string tmp__161 ; 
        CommonToken tmp__160 ; 
        tmp__160 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__161 = "" ; 
        tmp__163 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__162 = new System.Collections.Generic.List<string> { tmp__163.Text }; 
        tmp__165 = ( ImmediateAST ) _localctx.local__3_atom_case21.result ; 
        tmp__164 = new System.Collections.Generic.List<ImmediateAST> { tmp__165 }; 
        tmp__166 = (ImmediateAST) mkFunc( tmp__160, tmp__161, tmp__162, tmp__164 ); 
        $result = tmp__166; 
      } 
; 
gen__line_wrap_expr returns [ImmediateAST result] :
      gen__optional_NEWLINE local__2_gen__line_wrap_expr_case0=expr gen__optional_NEWLINE { 
        ImmediateAST tmp__167 ; 
        tmp__167 = ( ImmediateAST ) _localctx.local__2_gen__line_wrap_expr_case0.result ; 
        $result = tmp__167; 
      } 
; 
gen__optional_NEWLINE returns [CommonToken result] :
      local__1_gen__optional_NEWLINE_case0=NEWLINE_17 { 
        CommonToken tmp__168 ; 
        tmp__168 = ( CommonToken ) _localctx.local__1_gen__optional_NEWLINE_case0 ; 
        $result = tmp__168; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__nullable_gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__nullable_gen__seplist__L44__name_case0=gen__seplist__L44__name { 
        System.Collections.Generic.List<string> tmp__169 ; 
        tmp__169 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__nullable_gen__seplist__L44__name_case0.result ; 
        $result = tmp__169; 
      } 
    | { 
        System.Collections.Generic.List<string> tmp__170 ; 
        tmp__170 = (System.Collections.Generic.List<string>) empty<string>(  ); 
        $result = tmp__170; 
      } 
; 
gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__seplist__L44__name_case0=name { 
        string tmp__172 ; 
        System.Collections.Generic.List<string> tmp__171 ; 
        tmp__172 = ( string ) _localctx.local__1_gen__seplist__L44__name_case0.result ; 
        tmp__171 = new System.Collections.Generic.List<string> { tmp__172 }; 
        $result = tmp__171; 
      } 
    | local__1_gen__seplist__L44__name_case1=gen__seplist__L44__name ',' local__3_gen__seplist__L44__name_case1=name { 
        System.Collections.Generic.List<string> tmp__175 ; 
        string tmp__174 ; 
        System.Collections.Generic.List<string> tmp__173 ; 
        tmp__173 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__seplist__L44__name_case1.result ; 
        tmp__174 = ( string ) _localctx.local__3_gen__seplist__L44__name_case1.result ; 
        tmp__175 = (System.Collections.Generic.List<string>) append<string>( tmp__173, tmp__174 ); 
        $result = tmp__175; 
      } 
; 
gen__optional_gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__optional_gen__blockOf_else_case0=gen__blockOf_else { 
        ImmediateAST tmp__176 ; 
        tmp__176 = ( ImmediateAST ) _localctx.local__1_gen__optional_gen__blockOf_else_case0.result ; 
        $result = tmp__176; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__blockOf_else_case0='else' local__2_gen__blockOf_else_case0=block { 
        ImmediateAST tmp__179 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__178 ; 
        CommonToken tmp__177 ; 
        tmp__177 = ( CommonToken ) _localctx.local__1_gen__blockOf_else_case0 ; 
        tmp__178 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_else_case0.result ; 
        tmp__179 = (ImmediateAST) mkBlock( tmp__177, tmp__178 ); 
        $result = tmp__179; 
      } 
; 
gen__nullable_gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0=gen__list_gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__180 ; 
        tmp__180 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__180; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__181 ; 
        tmp__181 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__181; 
      } 
; 
gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__list_gen__snd_elif__elifBlock_case0=gen__snd_elif__elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__183 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__182 ; 
        tmp__183 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        tmp__182 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__183 }; 
        $result = tmp__182; 
      } 
    | local__1_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock local__2_gen__list_gen__snd_elif__elifBlock_case1=gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__186 ; 
        (ImmediateAST, ImmediateAST) tmp__185 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__184 ; 
        tmp__184 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__185 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__186 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__184, tmp__185 ); 
        $result = tmp__186; 
      } 
; 
gen__snd_elif__elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      'elif' local__2_gen__snd_elif__elifBlock_case0=elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__187 ; 
        tmp__187 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__187; 
      } 
; 
gen__closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      gen__optional_NEWLINE local__2_gen__closelist__L44__pair_case0=gen___closelist__L44__pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__188 ; 
        tmp__188 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_gen__closelist__L44__pair_case0.result ; 
        $result = tmp__188; 
      } 
; 
gen___closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen___closelist__L44__pair_case0=gen___closelist__L44__pair NEWLINE_17 { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__189 ; 
        tmp__189 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case0.result ; 
        $result = tmp__189; 
      } 
    | local__1_gen___closelist__L44__pair_case1=gen___closelist__L44__pair ',' NEWLINE_17 local__4_gen___closelist__L44__pair_case1=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__192 ; 
        (ImmediateAST, ImmediateAST) tmp__191 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__190 ; 
        tmp__190 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case1.result ; 
        tmp__191 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__4_gen___closelist__L44__pair_case1.result ; 
        tmp__192 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__190, tmp__191 ); 
        $result = tmp__192; 
      } 
    | local__1_gen___closelist__L44__pair_case2=gen___closelist__L44__pair ',' local__3_gen___closelist__L44__pair_case2=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__195 ; 
        (ImmediateAST, ImmediateAST) tmp__194 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__193 ; 
        tmp__193 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case2.result ; 
        tmp__194 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__3_gen___closelist__L44__pair_case2.result ; 
        tmp__195 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__193, tmp__194 ); 
        $result = tmp__195; 
      } 
    | local__1_gen___closelist__L44__pair_case3=pair { 
        (ImmediateAST, ImmediateAST) tmp__197 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__196 ; 
        tmp__197 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen___closelist__L44__pair_case3.result ; 
        tmp__196 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__197 }; 
        $result = tmp__196; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__198 ; 
        tmp__198 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { }; 
        $result = tmp__198; 
      } 
; 
gen__closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_NEWLINE local__2_gen__closelist__L44__expr_case0=gen___closelist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__199 ; 
        tmp__199 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__closelist__L44__expr_case0.result ; 
        $result = tmp__199; 
      } 
; 
gen___closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen___closelist__L44__expr_case0=gen___closelist__L44__expr NEWLINE_17 { 
        System.Collections.Generic.List<ImmediateAST> tmp__200 ; 
        tmp__200 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case0.result ; 
        $result = tmp__200; 
      } 
    | local__1_gen___closelist__L44__expr_case1=gen___closelist__L44__expr ',' NEWLINE_17 local__4_gen___closelist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__203 ; 
        ImmediateAST tmp__202 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__201 ; 
        tmp__201 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case1.result ; 
        tmp__202 = ( ImmediateAST ) _localctx.local__4_gen___closelist__L44__expr_case1.result ; 
        tmp__203 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__201, tmp__202 ); 
        $result = tmp__203; 
      } 
    | local__1_gen___closelist__L44__expr_case2=gen___closelist__L44__expr ',' local__3_gen___closelist__L44__expr_case2=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__206 ; 
        ImmediateAST tmp__205 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__204 ; 
        tmp__204 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case2.result ; 
        tmp__205 = ( ImmediateAST ) _localctx.local__3_gen___closelist__L44__expr_case2.result ; 
        tmp__206 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__204, tmp__205 ); 
        $result = tmp__206; 
      } 
    | local__1_gen___closelist__L44__expr_case3=expr { 
        ImmediateAST tmp__208 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__207 ; 
        tmp__208 = ( ImmediateAST ) _localctx.local__1_gen___closelist__L44__expr_case3.result ; 
        tmp__207 = new System.Collections.Generic.List<ImmediateAST> { tmp__208 }; 
        $result = tmp__207; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__209 ; 
        tmp__209 = new System.Collections.Generic.List<ImmediateAST> { }; 
        $result = tmp__209; 
      } 
; 
pair returns [(ImmediateAST, ImmediateAST) result] :
      local__1_pair_case0=expr gen__line_wrap__L58 local__3_pair_case0=expr { 
        ImmediateAST tmp__212 ; 
        ImmediateAST tmp__211 ; 
        (ImmediateAST, ImmediateAST) tmp__210 ; 
        tmp__211 = ( ImmediateAST ) _localctx.local__1_pair_case0.result ; 
        tmp__212 = ( ImmediateAST ) _localctx.local__3_pair_case0.result ; 
        tmp__210 = ( tmp__211 , tmp__212 ); 
        $result = tmp__210; 
      } 
; 
gen__line_wrap__L58 returns [CommonToken result] :
      gen__optional_NEWLINE local__2_gen__line_wrap__L58_case0=':' gen__optional_NEWLINE { 
        CommonToken tmp__213 ; 
        tmp__213 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L58_case0 ; 
        $result = tmp__213; 
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
        ImmediateAST tmp__215 ; 
        System.Collections.Generic.List<object> tmp__214 ; 
        tmp__214 = ( System.Collections.Generic.List<object> ) _localctx.local__1_bin_case0.result ; 
        tmp__215 = (ImmediateAST) resolve_binop( tmp__214 ); 
        $result = tmp__215; 
      } 
; 
binseq returns [System.Collections.Generic.List<object> result] :
      local__1_binseq_case0=atom { 
        System.Collections.Generic.List<object> tmp__219 ; 
        object tmp__218 ; 
        ImmediateAST tmp__217 ; 
        System.Collections.Generic.List<object> tmp__216 ; 
        tmp__216 = (System.Collections.Generic.List<object>) empty<object>(  ); 
        tmp__217 = ( ImmediateAST ) _localctx.local__1_binseq_case0.result ; 
        tmp__218 = (object) to_obj<ImmediateAST>( tmp__217 ); 
        tmp__219 = (System.Collections.Generic.List<object>) append<object>( tmp__216, tmp__218 ); 
        $result = tmp__219; 
      } 
    | local__1_binseq_case1=binseq local__2_binseq_case1=binop local__3_binseq_case1=atom { 
        object tmp__225 ; 
        ImmediateAST tmp__224 ; 
        System.Collections.Generic.List<object> tmp__223 ; 
        System.Collections.Generic.List<object> block__220 ; 
        object tmp__222 ; 
        System.Collections.Generic.List<object> tmp__221 ; 
        tmp__221 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__222 = ( object ) _localctx.local__2_binseq_case1.result ; 
        block__220 = (System.Collections.Generic.List<object>) append<object>( tmp__221, tmp__222 ); 
        tmp__223 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__224 = ( ImmediateAST ) _localctx.local__3_binseq_case1.result ; 
        tmp__225 = (object) to_obj<ImmediateAST>( tmp__224 ); 
        block__220 = (System.Collections.Generic.List<object>) append<object>( tmp__223, tmp__225 ); 
        $result = block__220; 
      } 
; 
ibin returns [ImmediateAST result] :
      local__1_ibin_case0=lhs local__2_ibin_case0=ibinop local__3_ibin_case0='=' local__4_ibin_case0=expr { 
        ImmediateAST tmp__230 ; 
        ImmediateAST tmp__229 ; 
        string tmp__228 ; 
        ImmediateAST tmp__227 ; 
        CommonToken tmp__226 ; 
        tmp__226 = ( CommonToken ) _localctx.local__3_ibin_case0 ; 
        tmp__227 = ( ImmediateAST ) _localctx.local__1_ibin_case0.result ; 
        tmp__228 = ( string ) _localctx.local__2_ibin_case0.result ; 
        tmp__229 = ( ImmediateAST ) _localctx.local__4_ibin_case0.result ; 
        tmp__230 = (ImmediateAST) mkIBin( tmp__226, tmp__227, tmp__228, tmp__229 ); 
        $result = tmp__230; 
      } 
; 
ibinop returns [string result] :
      local__1_ibinop_case0=SINGLE_BINOP_2 { 
        CommonToken tmp__231 ; 
        tmp__231 = ( CommonToken ) _localctx.local__1_ibinop_case0 ; 
        $result = tmp__231.Text; 
      } 
    | '-' { 
        string tmp__232 ; 
        tmp__232 = "-" ; 
        $result = tmp__232; 
      } 
; 
binop returns [object result] :
      local__1_binop_case0=SINGLE_BINOP_2 { 
        object tmp__235 ; 
        CommonToken tmp__234 ; 
        CommonToken tmp__233 ; 
        tmp__233 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__234 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__235 = (object) mkop( tmp__233, tmp__234.Text ); 
        $result = tmp__235; 
      } 
    | local__1_binop_case1='not' 'in' { 
        object tmp__238 ; 
        string tmp__237 ; 
        CommonToken tmp__236 ; 
        tmp__236 = ( CommonToken ) _localctx.local__1_binop_case1 ; 
        tmp__237 = "notin" ; 
        tmp__238 = (object) mkop( tmp__236, tmp__237 ); 
        $result = tmp__238; 
      } 
    | local__1_binop_case2='in' { 
        object tmp__241 ; 
        string tmp__240 ; 
        CommonToken tmp__239 ; 
        tmp__239 = ( CommonToken ) _localctx.local__1_binop_case2 ; 
        tmp__240 = "in" ; 
        tmp__241 = (object) mkop( tmp__239, tmp__240 ); 
        $result = tmp__241; 
      } 
    | local__1_binop_case3='-' { 
        object tmp__244 ; 
        string tmp__243 ; 
        CommonToken tmp__242 ; 
        tmp__242 = ( CommonToken ) _localctx.local__1_binop_case3 ; 
        tmp__243 = "-" ; 
        tmp__244 = (object) mkop( tmp__242, tmp__243 ); 
        $result = tmp__244; 
      } 
; 
not returns [ImmediateAST result] :
      local__1_not_case0='not' local__2_not_case0=bin { 
        ImmediateAST tmp__247 ; 
        ImmediateAST tmp__246 ; 
        CommonToken tmp__245 ; 
        tmp__245 = ( CommonToken ) _localctx.local__1_not_case0 ; 
        tmp__246 = ( ImmediateAST ) _localctx.local__2_not_case0.result ; 
        tmp__247 = (ImmediateAST) mkNot( tmp__245, tmp__246 ); 
        $result = tmp__247; 
      } 
    | local__1_not_case1=bin { 
        ImmediateAST tmp__248 ; 
        tmp__248 = ( ImmediateAST ) _localctx.local__1_not_case1.result ; 
        $result = tmp__248; 
      } 
; 
and_expr returns [ImmediateAST result] :
      local__1_and_expr_case0=and_expr local__2_and_expr_case0='and' local__3_and_expr_case0=not { 
        ImmediateAST tmp__252 ; 
        ImmediateAST tmp__251 ; 
        ImmediateAST tmp__250 ; 
        CommonToken tmp__249 ; 
        tmp__249 = ( CommonToken ) _localctx.local__2_and_expr_case0 ; 
        tmp__250 = ( ImmediateAST ) _localctx.local__1_and_expr_case0.result ; 
        tmp__251 = ( ImmediateAST ) _localctx.local__3_and_expr_case0.result ; 
        tmp__252 = (ImmediateAST) mkAnd( tmp__249, tmp__250, tmp__251 ); 
        $result = tmp__252; 
      } 
    | local__1_and_expr_case1=not { 
        ImmediateAST tmp__253 ; 
        tmp__253 = ( ImmediateAST ) _localctx.local__1_and_expr_case1.result ; 
        $result = tmp__253; 
      } 
; 
or_expr returns [ImmediateAST result] :
      local__1_or_expr_case0=or_expr local__2_or_expr_case0='or' local__3_or_expr_case0=and_expr { 
        ImmediateAST tmp__257 ; 
        ImmediateAST tmp__256 ; 
        ImmediateAST tmp__255 ; 
        CommonToken tmp__254 ; 
        tmp__254 = ( CommonToken ) _localctx.local__2_or_expr_case0 ; 
        tmp__255 = ( ImmediateAST ) _localctx.local__1_or_expr_case0.result ; 
        tmp__256 = ( ImmediateAST ) _localctx.local__3_or_expr_case0.result ; 
        tmp__257 = (ImmediateAST) mkAnd( tmp__254, tmp__255, tmp__256 ); 
        $result = tmp__257; 
      } 
    | local__1_or_expr_case1=and_expr { 
        ImmediateAST tmp__258 ; 
        tmp__258 = ( ImmediateAST ) _localctx.local__1_or_expr_case1.result ; 
        $result = tmp__258; 
      } 
; 
expr returns [ImmediateAST result] :
      local__1_expr_case0=gen__seplist_gen__line_wrap__L124_L62__or_expr { 
        ImmediateAST tmp__260 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__259 ; 
        tmp__259 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_expr_case0.result ; 
        tmp__260 = (ImmediateAST) mkPipeline( tmp__259 ); 
        $result = tmp__260; 
      } 
; 
gen__seplist_gen__line_wrap__L124_L62__or_expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case0=or_expr { 
        ImmediateAST tmp__262 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__261 ; 
        tmp__262 = ( ImmediateAST ) _localctx.local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case0.result ; 
        tmp__261 = new System.Collections.Generic.List<ImmediateAST> { tmp__262 }; 
        $result = tmp__261; 
      } 
    | local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1=gen__seplist_gen__line_wrap__L124_L62__or_expr gen__line_wrap__L124_L62 local__3_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1=or_expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__265 ; 
        ImmediateAST tmp__264 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__263 ; 
        tmp__263 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1.result ; 
        tmp__264 = ( ImmediateAST ) _localctx.local__3_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1.result ; 
        tmp__265 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__263, tmp__264 ); 
        $result = tmp__265; 
      } 
; 
gen__line_wrap__L124_L62 returns [CommonToken result] :
      gen__optional_NEWLINE local__2_gen__line_wrap__L124_L62_case0='|>' gen__optional_NEWLINE { 
        CommonToken tmp__266 ; 
        tmp__266 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L124_L62_case0 ; 
        $result = tmp__266; 
      } 
; 
block returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_block_case0=gen__filter_stmt__gen__or___L59__NEWLINE { 
        System.Collections.Generic.List<ImmediateAST> tmp__267 ; 
        tmp__267 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_block_case0.result ; 
        $result = tmp__267; 
      } 
; 
gen__filter_stmt__gen__or___L59__NEWLINE returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case0=gen__filter_stmt__gen__or___L59__NEWLINE local__2_gen__filter_stmt__gen__or___L59__NEWLINE_case0=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__270 ; 
        ImmediateAST tmp__269 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__268 ; 
        tmp__268 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case0.result ; 
        tmp__269 = ( ImmediateAST ) _localctx.local__2_gen__filter_stmt__gen__or___L59__NEWLINE_case0.result ; 
        tmp__270 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__268, tmp__269 ); 
        $result = tmp__270; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case1=gen__filter_stmt__gen__or___L59__NEWLINE gen__or___L59__NEWLINE { 
        System.Collections.Generic.List<ImmediateAST> tmp__271 ; 
        tmp__271 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case1.result ; 
        $result = tmp__271; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case2=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__274 ; 
        ImmediateAST tmp__273 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__272 ; 
        tmp__272 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__273 = ( ImmediateAST ) _localctx.local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case2.result ; 
        tmp__274 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__272, tmp__273 ); 
        $result = tmp__274; 
      } 
    | gen__or___L59__NEWLINE { 
        System.Collections.Generic.List<ImmediateAST> tmp__275 ; 
        tmp__275 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__275; 
      } 
; 
gen__or___L59__NEWLINE returns [int result] :
      ';' { 
        int tmp__276 ; 
        tmp__276 = 0 ; 
        $result = tmp__276; 
      } 
    | NEWLINE_17 { 
        int tmp__277 ; 
        tmp__277 = 0 ; 
        $result = tmp__277; 
      } 
; 
lhs returns [ImmediateAST result] :
      local__1_lhs_case0=NAME_13 { 
        ImmediateAST tmp__280 ; 
        CommonToken tmp__279 ; 
        CommonToken tmp__278 ; 
        tmp__278 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__279 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__280 = (ImmediateAST) mkVar( tmp__278, tmp__279.Text ); 
        $result = tmp__280; 
      } 
    | local__1_lhs_case1=atom local__2_lhs_case1='.' '[' local__4_lhs_case1=expr ']' { 
        ImmediateAST tmp__284 ; 
        ImmediateAST tmp__283 ; 
        ImmediateAST tmp__282 ; 
        CommonToken tmp__281 ; 
        tmp__281 = ( CommonToken ) _localctx.local__2_lhs_case1 ; 
        tmp__282 = ( ImmediateAST ) _localctx.local__1_lhs_case1.result ; 
        tmp__283 = ( ImmediateAST ) _localctx.local__4_lhs_case1.result ; 
        tmp__284 = (ImmediateAST) mkOGet( tmp__281, tmp__282, tmp__283 ); 
        $result = tmp__284; 
      } 
    | local__1_lhs_case2=atom local__2_lhs_case2='.' local__3_lhs_case2=NAME_13 { 
        ImmediateAST tmp__291 ; 
        ImmediateAST tmp__290 ; 
        DObj tmp__289 ; 
        CommonToken tmp__288 ; 
        CommonToken tmp__287 ; 
        ImmediateAST tmp__286 ; 
        CommonToken tmp__285 ; 
        tmp__285 = ( CommonToken ) _localctx.local__2_lhs_case2 ; 
        tmp__286 = ( ImmediateAST ) _localctx.local__1_lhs_case2.result ; 
        tmp__287 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__288 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__289 = (DObj) mkstr( tmp__288.Text ); 
        tmp__290 = (ImmediateAST) mkVal( tmp__287, tmp__289 ); 
        tmp__291 = (ImmediateAST) mkOGet( tmp__285, tmp__286, tmp__290 ); 
        $result = tmp__291; 
      } 
; 
do returns [CommonToken result] :
      gen__optional_NEWLINE local__2_do_case0='do' { 
        CommonToken tmp__292 ; 
        tmp__292 = ( CommonToken ) _localctx.local__2_do_case0 ; 
        $result = tmp__292; 
      } 
; 
then returns [CommonToken result] :
      gen__optional_NEWLINE local__2_then_case0='then' { 
        CommonToken tmp__293 ; 
        tmp__293 = ( CommonToken ) _localctx.local__2_then_case0 ; 
        $result = tmp__293; 
      } 
; 
gen__blockOf_do returns [ImmediateAST result] :
      local__1_gen__blockOf_do_case0=do local__2_gen__blockOf_do_case0=block { 
        ImmediateAST tmp__296 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__295 ; 
        CommonToken tmp__294 ; 
        tmp__294 = ( CommonToken ) _localctx.local__1_gen__blockOf_do_case0.result ; 
        tmp__295 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_do_case0.result ; 
        tmp__296 = (ImmediateAST) mkBlock( tmp__294, tmp__295 ); 
        $result = tmp__296; 
      } 
; 
name returns [string result] :
      local__1_name_case0=NAME_13 { 
        CommonToken tmp__297 ; 
        tmp__297 = ( CommonToken ) _localctx.local__1_name_case0 ; 
        $result = tmp__297.Text; 
      } 
; 
elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      local__1_elifBlock_case0=expr local__2_elifBlock_case0=gen__blockOf_then { 
        ImmediateAST tmp__300 ; 
        ImmediateAST tmp__299 ; 
        (ImmediateAST, ImmediateAST) tmp__298 ; 
        tmp__299 = ( ImmediateAST ) _localctx.local__1_elifBlock_case0.result ; 
        tmp__300 = ( ImmediateAST ) _localctx.local__2_elifBlock_case0.result ; 
        tmp__298 = ( tmp__299 , tmp__300 ); 
        $result = tmp__298; 
      } 
; 
gen__blockOf_then returns [ImmediateAST result] :
      local__1_gen__blockOf_then_case0=then local__2_gen__blockOf_then_case0=block { 
        ImmediateAST tmp__303 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__302 ; 
        CommonToken tmp__301 ; 
        tmp__301 = ( CommonToken ) _localctx.local__1_gen__blockOf_then_case0.result ; 
        tmp__302 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_then_case0.result ; 
        tmp__303 = (ImmediateAST) mkBlock( tmp__301, tmp__302 ); 
        $result = tmp__303; 
      } 
; 
lhs_seq returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_lhs_seq_case0=lhs_seq local__2_lhs_seq_case0=lhs '=' { 
        System.Collections.Generic.List<ImmediateAST> tmp__306 ; 
        ImmediateAST tmp__305 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__304 ; 
        tmp__304 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_lhs_seq_case0.result ; 
        tmp__305 = ( ImmediateAST ) _localctx.local__2_lhs_seq_case0.result ; 
        tmp__306 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__304, tmp__305 ); 
        $result = tmp__306; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__307 ; 
        tmp__307 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__307; 
      } 
; 
start returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_NEWLINE local__2_start_case0=gen__nullable_gen__seplist_NEWLINE__stmt gen__optional_NEWLINE EOF { 
        System.Collections.Generic.List<ImmediateAST> tmp__308 ; 
        tmp__308 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_start_case0.result ; 
        $result = tmp__308; 
      } 
; 
gen__nullable_gen__seplist_NEWLINE__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__nullable_gen__seplist_NEWLINE__stmt_case0=gen__seplist_NEWLINE__stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__309 ; 
        tmp__309 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist_NEWLINE__stmt_case0.result ; 
        $result = tmp__309; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__310 ; 
        tmp__310 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__310; 
      } 
; 
gen__seplist_NEWLINE__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_NEWLINE__stmt_case0=stmt { 
        ImmediateAST tmp__312 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__311 ; 
        tmp__312 = ( ImmediateAST ) _localctx.local__1_gen__seplist_NEWLINE__stmt_case0.result ; 
        tmp__311 = new System.Collections.Generic.List<ImmediateAST> { tmp__312 }; 
        $result = tmp__311; 
      } 
    | local__1_gen__seplist_NEWLINE__stmt_case1=gen__seplist_NEWLINE__stmt NEWLINE_17 local__3_gen__seplist_NEWLINE__stmt_case1=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__315 ; 
        ImmediateAST tmp__314 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__313 ; 
        tmp__313 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_NEWLINE__stmt_case1.result ; 
        tmp__314 = ( ImmediateAST ) _localctx.local__3_gen__seplist_NEWLINE__stmt_case1.result ; 
        tmp__315 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__313, tmp__314 ); 
        $result = tmp__315; 
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


