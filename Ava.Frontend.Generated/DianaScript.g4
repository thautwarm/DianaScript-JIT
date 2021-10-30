grammar DianaScript;
options { language = CSharp; }
expr returns [ImmediateAST result] :
      local__1_expr_case0=NAME_13 '{' local__3_expr_case0=gen__filter_option__NEWLINE '}' { 
        ImmediateAST tmp__4 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__3 ; 
        CommonToken tmp__2 ; 
        CommonToken tmp__1 ; 
        tmp__1 = ( CommonToken ) _localctx.local__1_expr_case0 ; 
        tmp__2 = ( CommonToken ) _localctx.local__1_expr_case0 ; 
        tmp__3 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__3_expr_case0.result ; 
        tmp__4 = (ImmediateAST) mkWorkflow( tmp__1, tmp__2.Text, null, tmp__3 ); 
        $result = tmp__4; 
      } 
    | local__1_expr_case1=NAME_13 'as' local__3_expr_case1=NAME_13 '{' local__5_expr_case1=gen__filter_option__NEWLINE '}' { 
        ImmediateAST tmp__9 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__8 ; 
        CommonToken tmp__7 ; 
        CommonToken tmp__6 ; 
        CommonToken tmp__5 ; 
        tmp__5 = ( CommonToken ) _localctx.local__1_expr_case1 ; 
        tmp__6 = ( CommonToken ) _localctx.local__1_expr_case1 ; 
        tmp__7 = ( CommonToken ) _localctx.local__3_expr_case1 ; 
        tmp__8 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__5_expr_case1.result ; 
        tmp__9 = (ImmediateAST) mkWorkflow( tmp__5, tmp__6.Text, tmp__7.Text, tmp__8 ); 
        $result = tmp__9; 
      } 
    | local__1_expr_case2=gen__seplist_gen__line_wrap__L124_L62__or_expr { 
        ImmediateAST tmp__11 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__10 ; 
        tmp__10 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_expr_case2.result ; 
        tmp__11 = (ImmediateAST) mkPipeline( tmp__10 ); 
        $result = tmp__11; 
      } 
; 
gen__filter_option__NEWLINE returns [System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> result] :
      local__1_gen__filter_option__NEWLINE_case0=gen__filter_option__NEWLINE local__2_gen__filter_option__NEWLINE_case0=option { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__14 ; 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__13 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__12 ; 
        tmp__12 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__1_gen__filter_option__NEWLINE_case0.result ; 
        tmp__13 = ( (int, int, string, System.Collections.Generic.List<ImmediateAST>) ) _localctx.local__2_gen__filter_option__NEWLINE_case0.result ; 
        tmp__14 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) append<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>( tmp__12, tmp__13 ); 
        $result = tmp__14; 
      } 
    | local__1_gen__filter_option__NEWLINE_case1=gen__filter_option__NEWLINE NEWLINE_17 { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__15 ; 
        tmp__15 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__1_gen__filter_option__NEWLINE_case1.result ; 
        $result = tmp__15; 
      } 
    | local__1_gen__filter_option__NEWLINE_case2=option { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__18 ; 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__17 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__16 ; 
        tmp__16 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) empty<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>(  ); 
        tmp__17 = ( (int, int, string, System.Collections.Generic.List<ImmediateAST>) ) _localctx.local__1_gen__filter_option__NEWLINE_case2.result ; 
        tmp__18 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) append<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>( tmp__16, tmp__17 ); 
        $result = tmp__18; 
      } 
    | NEWLINE_17 { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__19 ; 
        tmp__19 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) empty<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>(  ); 
        $result = tmp__19; 
      } 
; 
stmt returns [ImmediateAST result] :
      local__1_stmt_case0='let' local__2_stmt_case0=NAME_13 '=' local__4_stmt_case0=expr { 
        ImmediateAST tmp__23 ; 
        ImmediateAST tmp__22 ; 
        CommonToken tmp__21 ; 
        CommonToken tmp__20 ; 
        tmp__20 = ( CommonToken ) _localctx.local__1_stmt_case0 ; 
        tmp__21 = ( CommonToken ) _localctx.local__2_stmt_case0 ; 
        tmp__22 = ( ImmediateAST ) _localctx.local__4_stmt_case0.result ; 
        tmp__23 = (ImmediateAST) mkLet( tmp__20, tmp__21.Text, tmp__22 ); 
        $result = tmp__23; 
      } 
    | local__1_stmt_case1=lhs_seq local__2_stmt_case1=expr { 
        ImmediateAST tmp__26 ; 
        ImmediateAST tmp__25 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__24 ; 
        tmp__24 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_stmt_case1.result ; 
        tmp__25 = ( ImmediateAST ) _localctx.local__2_stmt_case1.result ; 
        tmp__26 = (ImmediateAST) mkStoreMany( tmp__24, tmp__25 ); 
        $result = tmp__26; 
      } 
    | local__1_stmt_case2='loop' local__2_stmt_case2=block 'end' { 
        ImmediateAST tmp__31 ; 
        ImmediateAST tmp__30 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__29 ; 
        CommonToken tmp__28 ; 
        CommonToken tmp__27 ; 
        tmp__27 = ( CommonToken ) _localctx.local__1_stmt_case2 ; 
        tmp__28 = ( CommonToken ) _localctx.local__1_stmt_case2 ; 
        tmp__29 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_stmt_case2.result ; 
        tmp__30 = (ImmediateAST) mkBlock( tmp__28, tmp__29 ); 
        tmp__31 = (ImmediateAST) mkLoop( tmp__27, tmp__30 ); 
        $result = tmp__31; 
      } 
    | local__1_stmt_case3='for' local__2_stmt_case3=NAME_13 'in' local__4_stmt_case3=expr local__5_stmt_case3=gen__blockOf_do 'end' { 
        ImmediateAST tmp__36 ; 
        ImmediateAST tmp__35 ; 
        ImmediateAST tmp__34 ; 
        CommonToken tmp__33 ; 
        CommonToken tmp__32 ; 
        tmp__32 = ( CommonToken ) _localctx.local__1_stmt_case3 ; 
        tmp__33 = ( CommonToken ) _localctx.local__2_stmt_case3 ; 
        tmp__34 = ( ImmediateAST ) _localctx.local__4_stmt_case3.result ; 
        tmp__35 = ( ImmediateAST ) _localctx.local__5_stmt_case3.result ; 
        tmp__36 = (ImmediateAST) mkFor( tmp__32, tmp__33.Text, tmp__34, tmp__35 ); 
        $result = tmp__36; 
      } 
    | local__1_stmt_case4='break' { 
        ImmediateAST tmp__38 ; 
        CommonToken tmp__37 ; 
        tmp__37 = ( CommonToken ) _localctx.local__1_stmt_case4 ; 
        tmp__38 = (ImmediateAST) mkBreak( tmp__37 ); 
        $result = tmp__38; 
      } 
    | local__1_stmt_case5='continue' { 
        ImmediateAST tmp__40 ; 
        CommonToken tmp__39 ; 
        tmp__39 = ( CommonToken ) _localctx.local__1_stmt_case5 ; 
        tmp__40 = (ImmediateAST) mkContinue( tmp__39 ); 
        $result = tmp__40; 
      } 
    | local__1_stmt_case6='return' local__2_stmt_case6=expr { 
        ImmediateAST tmp__43 ; 
        ImmediateAST tmp__42 ; 
        CommonToken tmp__41 ; 
        tmp__41 = ( CommonToken ) _localctx.local__1_stmt_case6 ; 
        tmp__42 = ( ImmediateAST ) _localctx.local__2_stmt_case6.result ; 
        tmp__43 = (ImmediateAST) mkReturn( tmp__41, tmp__42 ); 
        $result = tmp__43; 
      } 
    | local__1_stmt_case7='return' { 
        ImmediateAST tmp__45 ; 
        CommonToken tmp__44 ; 
        tmp__44 = ( CommonToken ) _localctx.local__1_stmt_case7 ; 
        tmp__45 = (ImmediateAST) mkReturn( tmp__44, null ); 
        $result = tmp__45; 
      } 
    | local__1_stmt_case8='var' local__2_stmt_case8=gen__seplist__L44__name { 
        ImmediateAST tmp__48 ; 
        System.Collections.Generic.List<string> tmp__47 ; 
        CommonToken tmp__46 ; 
        tmp__46 = ( CommonToken ) _localctx.local__1_stmt_case8 ; 
        tmp__47 = ( System.Collections.Generic.List<string> ) _localctx.local__2_stmt_case8.result ; 
        tmp__48 = (ImmediateAST) mkDecl( tmp__46, tmp__47 ); 
        $result = tmp__48; 
      } 
    | local__1_stmt_case9=ibin { 
        ImmediateAST tmp__49 ; 
        tmp__49 = ( ImmediateAST ) _localctx.local__1_stmt_case9.result ; 
        $result = tmp__49; 
      } 
; 
option returns [(int, int, string, System.Collections.Generic.List<ImmediateAST>) result] :
      local__1_option_case0=NAME_13 local__2_option_case0=gen__nullable_gen__seplist__L44__expr { 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__52 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__51 ; 
        CommonToken tmp__50 ; 
        tmp__50 = ( CommonToken ) _localctx.local__1_option_case0 ; 
        tmp__51 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_option_case0.result ; 
        tmp__52 = ((int, int, string, System.Collections.Generic.List<ImmediateAST>)) mkOptionN( tmp__50, tmp__51 ); 
        $result = tmp__52; 
      } 
    | 'do' local__2_option_case1=expr { 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__54 ; 
        ImmediateAST tmp__53 ; 
        tmp__53 = ( ImmediateAST ) _localctx.local__2_option_case1.result ; 
        tmp__54 = ((int, int, string, System.Collections.Generic.List<ImmediateAST>)) mkDoOption( tmp__53 ); 
        $result = tmp__54; 
      } 
; 
gen__nullable_gen__seplist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__nullable_gen__seplist__L44__expr_case0=gen__seplist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__55 ; 
        tmp__55 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist__L44__expr_case0.result ; 
        $result = tmp__55; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__56 ; 
        tmp__56 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__56; 
      } 
; 
gen__seplist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist__L44__expr_case0=expr { 
        ImmediateAST tmp__58 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__57 ; 
        tmp__58 = ( ImmediateAST ) _localctx.local__1_gen__seplist__L44__expr_case0.result ; 
        tmp__57 = new System.Collections.Generic.List<ImmediateAST> { tmp__58 }; 
        $result = tmp__57; 
      } 
    | local__1_gen__seplist__L44__expr_case1=gen__seplist__L44__expr ',' local__3_gen__seplist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__61 ; 
        ImmediateAST tmp__60 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__59 ; 
        tmp__59 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist__L44__expr_case1.result ; 
        tmp__60 = ( ImmediateAST ) _localctx.local__3_gen__seplist__L44__expr_case1.result ; 
        tmp__61 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__59, tmp__60 ); 
        $result = tmp__61; 
      } 
; 
newline returns [CommonToken result] :
      local__1_newline_case0=NEWLINE_17 { 
        CommonToken tmp__62 ; 
        tmp__62 = ( CommonToken ) _localctx.local__1_newline_case0 ; 
        $result = tmp__62; 
      } 
    | newline local__2_newline_case1=NEWLINE_17 { 
        CommonToken tmp__63 ; 
        tmp__63 = ( CommonToken ) _localctx.local__2_newline_case1 ; 
        $result = tmp__63; 
      } 
; 
atom returns [ImmediateAST result] :
      local__1_atom_case0=atom local__2_atom_case0='.' '[' local__4_atom_case0=expr ']' { 
        ImmediateAST tmp__67 ; 
        ImmediateAST tmp__66 ; 
        ImmediateAST tmp__65 ; 
        CommonToken tmp__64 ; 
        tmp__64 = ( CommonToken ) _localctx.local__2_atom_case0 ; 
        tmp__65 = ( ImmediateAST ) _localctx.local__1_atom_case0.result ; 
        tmp__66 = ( ImmediateAST ) _localctx.local__4_atom_case0.result ; 
        tmp__67 = (ImmediateAST) mkOGet( tmp__64, tmp__65, tmp__66 ); 
        $result = tmp__67; 
      } 
    | local__1_atom_case1=atom local__2_atom_case1='.' local__3_atom_case1=NAME_13 { 
        ImmediateAST tmp__74 ; 
        ImmediateAST tmp__73 ; 
        DObj tmp__72 ; 
        CommonToken tmp__71 ; 
        CommonToken tmp__70 ; 
        ImmediateAST tmp__69 ; 
        CommonToken tmp__68 ; 
        tmp__68 = ( CommonToken ) _localctx.local__2_atom_case1 ; 
        tmp__69 = ( ImmediateAST ) _localctx.local__1_atom_case1.result ; 
        tmp__70 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__71 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__72 = (DObj) mkstr( tmp__71.Text ); 
        tmp__73 = (ImmediateAST) mkVal( tmp__70, tmp__72 ); 
        tmp__74 = (ImmediateAST) mkOGet( tmp__68, tmp__69, tmp__73 ); 
        $result = tmp__74; 
      } 
    | local__1_atom_case2=atom local__2_atom_case2='(' local__3_atom_case2=gen__closelist__L44__expr ')' { 
        ImmediateAST tmp__78 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__77 ; 
        ImmediateAST tmp__76 ; 
        CommonToken tmp__75 ; 
        tmp__75 = ( CommonToken ) _localctx.local__2_atom_case2 ; 
        tmp__76 = ( ImmediateAST ) _localctx.local__1_atom_case2.result ; 
        tmp__77 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__3_atom_case2.result ; 
        tmp__78 = (ImmediateAST) mkApp( tmp__75, tmp__76, tmp__77 ); 
        $result = tmp__78; 
      } 
    | local__1_atom_case3='[' local__2_atom_case3=gen__closelist__L44__expr ']' { 
        ImmediateAST tmp__81 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__80 ; 
        CommonToken tmp__79 ; 
        tmp__79 = ( CommonToken ) _localctx.local__1_atom_case3 ; 
        tmp__80 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case3.result ; 
        tmp__81 = (ImmediateAST) mkList( tmp__79, tmp__80 ); 
        $result = tmp__81; 
      } 
    | local__1_atom_case4='(' local__2_atom_case4=gen__closelist__L44__expr local__3_atom_case4=trailer ')' { 
        ImmediateAST tmp__85 ; 
        bool tmp__84 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__83 ; 
        CommonToken tmp__82 ; 
        tmp__82 = ( CommonToken ) _localctx.local__1_atom_case4 ; 
        tmp__83 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case4.result ; 
        tmp__84 = ( bool ) _localctx.local__3_atom_case4.result ; 
        tmp__85 = (ImmediateAST) mkTuple( tmp__82, tmp__83, tmp__84 ); 
        $result = tmp__85; 
      } 
    | local__1_atom_case5='{' local__2_atom_case5=gen__closelist__L44__pair trailer '}' { 
        ImmediateAST tmp__88 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__87 ; 
        CommonToken tmp__86 ; 
        tmp__86 = ( CommonToken ) _localctx.local__1_atom_case5 ; 
        tmp__87 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case5.result ; 
        tmp__88 = (ImmediateAST) mkDict( tmp__86, tmp__87 ); 
        $result = tmp__88; 
      } 
    | local__1_atom_case6=STR_4 { 
        ImmediateAST tmp__93 ; 
        DObj tmp__92 ; 
        string tmp__91 ; 
        CommonToken tmp__90 ; 
        CommonToken tmp__89 ; 
        tmp__89 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__90 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__91 = (string) unesc( tmp__90.Text ); 
        tmp__92 = (DObj) mkstr( tmp__91 ); 
        tmp__93 = (ImmediateAST) mkVal( tmp__89, tmp__92 ); 
        $result = tmp__93; 
      } 
    | local__1_atom_case7=INT_10 { 
        ImmediateAST tmp__98 ; 
        DObj tmp__97 ; 
        int tmp__96 ; 
        CommonToken tmp__95 ; 
        CommonToken tmp__94 ; 
        tmp__94 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__95 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__96 = 0 ; 
        tmp__97 = (DObj) mkint( tmp__95.Text, tmp__96 ); 
        tmp__98 = (ImmediateAST) mkVal( tmp__94, tmp__97 ); 
        $result = tmp__98; 
      } 
    | local__1_atom_case8=HEX_7 { 
        ImmediateAST tmp__103 ; 
        DObj tmp__102 ; 
        int tmp__101 ; 
        CommonToken tmp__100 ; 
        CommonToken tmp__99 ; 
        tmp__99 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__100 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__101 = 16 ; 
        tmp__102 = (DObj) mkint( tmp__100.Text, tmp__101 ); 
        tmp__103 = (ImmediateAST) mkVal( tmp__99, tmp__102 ); 
        $result = tmp__103; 
      } 
    | local__1_atom_case9=OCT_8 { 
        ImmediateAST tmp__108 ; 
        DObj tmp__107 ; 
        int tmp__106 ; 
        CommonToken tmp__105 ; 
        CommonToken tmp__104 ; 
        tmp__104 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__105 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__106 = 8 ; 
        tmp__107 = (DObj) mkint( tmp__105.Text, tmp__106 ); 
        tmp__108 = (ImmediateAST) mkVal( tmp__104, tmp__107 ); 
        $result = tmp__108; 
      } 
    | local__1_atom_case10=BIN_9 { 
        ImmediateAST tmp__113 ; 
        DObj tmp__112 ; 
        int tmp__111 ; 
        CommonToken tmp__110 ; 
        CommonToken tmp__109 ; 
        tmp__109 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__110 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__111 = 2 ; 
        tmp__112 = (DObj) mkint( tmp__110.Text, tmp__111 ); 
        tmp__113 = (ImmediateAST) mkVal( tmp__109, tmp__112 ); 
        $result = tmp__113; 
      } 
    | local__1_atom_case11=FLOAT_11 { 
        ImmediateAST tmp__117 ; 
        DObj tmp__116 ; 
        CommonToken tmp__115 ; 
        CommonToken tmp__114 ; 
        tmp__114 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__115 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__116 = (DObj) mkfloat( tmp__115.Text ); 
        tmp__117 = (ImmediateAST) mkVal( tmp__114, tmp__116 ); 
        $result = tmp__117; 
      } 
    | local__1_atom_case12='None' { 
        ImmediateAST tmp__120 ; 
        DObj tmp__119 ; 
        CommonToken tmp__118 ; 
        tmp__118 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__119 = (DObj) mknone(  ); 
        tmp__120 = (ImmediateAST) mkVal( tmp__118, tmp__119 ); 
        $result = tmp__120; 
      } 
    | local__1_atom_case13=NAME_13 { 
        ImmediateAST tmp__123 ; 
        CommonToken tmp__122 ; 
        CommonToken tmp__121 ; 
        tmp__121 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__122 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__123 = (ImmediateAST) mkVar( tmp__121, tmp__122.Text ); 
        $result = tmp__123; 
      } 
    | local__1_atom_case14='-' local__2_atom_case14=atom { 
        ImmediateAST tmp__126 ; 
        ImmediateAST tmp__125 ; 
        CommonToken tmp__124 ; 
        tmp__124 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__125 = ( ImmediateAST ) _localctx.local__2_atom_case14.result ; 
        tmp__126 = (ImmediateAST) mkNeg( tmp__124, tmp__125 ); 
        $result = tmp__126; 
      } 
    | local__1_atom_case15='~' local__2_atom_case15=atom { 
        ImmediateAST tmp__129 ; 
        ImmediateAST tmp__128 ; 
        CommonToken tmp__127 ; 
        tmp__127 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__128 = ( ImmediateAST ) _localctx.local__2_atom_case15.result ; 
        tmp__129 = (ImmediateAST) mkInv( tmp__127, tmp__128 ); 
        $result = tmp__129; 
      } 
    | local__1_atom_case16='if' local__2_atom_case16=expr local__3_atom_case16=then local__4_atom_case16=block 'end' { 
        ImmediateAST tmp__135 ; 
        ImmediateAST tmp__134 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__133 ; 
        CommonToken tmp__132 ; 
        ImmediateAST tmp__131 ; 
        CommonToken tmp__130 ; 
        tmp__130 = ( CommonToken ) _localctx.local__1_atom_case16 ; 
        tmp__131 = ( ImmediateAST ) _localctx.local__2_atom_case16.result ; 
        tmp__132 = ( CommonToken ) _localctx.local__3_atom_case16.result ; 
        tmp__133 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case16.result ; 
        tmp__134 = (ImmediateAST) mkBlock( tmp__132, tmp__133 ); 
        tmp__135 = (ImmediateAST) mkIfThen( tmp__130, tmp__131, tmp__134 ); 
        $result = tmp__135; 
      } 
    | local__1_atom_case17='if' local__2_atom_case17=expr local__3_atom_case17=then local__4_atom_case17=block local__5_atom_case17=gen__nullable_gen__list_gen__snd_elif__elifBlock local__6_atom_case17=gen__optional_gen__blockOf_else 'end' { 
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
        tmp__137 = ( ImmediateAST ) _localctx.local__2_atom_case17.result ; 
        tmp__138 = ( CommonToken ) _localctx.local__3_atom_case17.result ; 
        tmp__139 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case17.result ; 
        tmp__140 = (ImmediateAST) mkBlock( tmp__138, tmp__139 ); 
        elif__136 = ( tmp__137 , tmp__140 ); 
        tmp__142 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        elifs__141 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__142, elif__136 ); 
        tmp__144 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__5_atom_case17.result ; 
        elifs__143 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) extend<(ImmediateAST, ImmediateAST)>( elifs__141, tmp__144 ); 
        tmp__145 = ( CommonToken ) _localctx.local__1_atom_case17 ; 
        tmp__146 = ( ImmediateAST ) _localctx.local__6_atom_case17.result ; 
        tmp__147 = (ImmediateAST) mkNestedIf( tmp__145, elifs__141, tmp__146 ); 
        $result = tmp__147; 
      } 
    | local__1_atom_case18='fun' local__2_atom_case18=name '(' local__4_atom_case18=gen__nullable_gen__seplist__L44__name ')' local__6_atom_case18=block 'end' { 
        ImmediateAST tmp__152 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__151 ; 
        System.Collections.Generic.List<string> tmp__150 ; 
        string tmp__149 ; 
        CommonToken tmp__148 ; 
        tmp__148 = ( CommonToken ) _localctx.local__1_atom_case18 ; 
        tmp__149 = ( string ) _localctx.local__2_atom_case18.result ; 
        tmp__150 = ( System.Collections.Generic.List<string> ) _localctx.local__4_atom_case18.result ; 
        tmp__151 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__6_atom_case18.result ; 
        tmp__152 = (ImmediateAST) mkFunc( tmp__148, tmp__149, tmp__150, tmp__151 ); 
        $result = tmp__152; 
      } 
    | local__1_atom_case19='fun' '(' local__3_atom_case19=gen__nullable_gen__seplist__L44__name ')' local__5_atom_case19=block 'end' { 
        ImmediateAST tmp__157 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__156 ; 
        System.Collections.Generic.List<string> tmp__155 ; 
        string tmp__154 ; 
        CommonToken tmp__153 ; 
        tmp__153 = ( CommonToken ) _localctx.local__1_atom_case19 ; 
        tmp__154 = "" ; 
        tmp__155 = ( System.Collections.Generic.List<string> ) _localctx.local__3_atom_case19.result ; 
        tmp__156 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__5_atom_case19.result ; 
        tmp__157 = (ImmediateAST) mkFunc( tmp__153, tmp__154, tmp__155, tmp__156 ); 
        $result = tmp__157; 
      } 
    | local__1_atom_case20='(' local__2_atom_case20=gen__nullable_gen__seplist__L44__name ')' '->' local__5_atom_case20=gen__line_wrap_expr { 
        ImmediateAST tmp__163 ; 
        ImmediateAST tmp__162 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__161 ; 
        System.Collections.Generic.List<string> tmp__160 ; 
        string tmp__159 ; 
        CommonToken tmp__158 ; 
        tmp__158 = ( CommonToken ) _localctx.local__1_atom_case20 ; 
        tmp__159 = "" ; 
        tmp__160 = ( System.Collections.Generic.List<string> ) _localctx.local__2_atom_case20.result ; 
        tmp__162 = ( ImmediateAST ) _localctx.local__5_atom_case20.result ; 
        tmp__161 = new System.Collections.Generic.List<ImmediateAST> { tmp__162 }; 
        tmp__163 = (ImmediateAST) mkFunc( tmp__158, tmp__159, tmp__160, tmp__161 ); 
        $result = tmp__163; 
      } 
    | local__1_atom_case21=NAME_13 '->' local__3_atom_case21=gen__line_wrap_expr { 
        ImmediateAST tmp__170 ; 
        ImmediateAST tmp__169 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__168 ; 
        CommonToken tmp__167 ; 
        System.Collections.Generic.List<string> tmp__166 ; 
        string tmp__165 ; 
        CommonToken tmp__164 ; 
        tmp__164 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__165 = "" ; 
        tmp__167 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__166 = new System.Collections.Generic.List<string> { tmp__167.Text }; 
        tmp__169 = ( ImmediateAST ) _localctx.local__3_atom_case21.result ; 
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
gen__optional_newline returns [CommonToken result] :
      local__1_gen__optional_newline_case0=newline { 
        CommonToken tmp__172 ; 
        tmp__172 = ( CommonToken ) _localctx.local__1_gen__optional_newline_case0.result ; 
        $result = tmp__172; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__nullable_gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__nullable_gen__seplist__L44__name_case0=gen__seplist__L44__name { 
        System.Collections.Generic.List<string> tmp__173 ; 
        tmp__173 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__nullable_gen__seplist__L44__name_case0.result ; 
        $result = tmp__173; 
      } 
    | { 
        System.Collections.Generic.List<string> tmp__174 ; 
        tmp__174 = (System.Collections.Generic.List<string>) empty<string>(  ); 
        $result = tmp__174; 
      } 
; 
gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__seplist__L44__name_case0=name { 
        string tmp__176 ; 
        System.Collections.Generic.List<string> tmp__175 ; 
        tmp__176 = ( string ) _localctx.local__1_gen__seplist__L44__name_case0.result ; 
        tmp__175 = new System.Collections.Generic.List<string> { tmp__176 }; 
        $result = tmp__175; 
      } 
    | local__1_gen__seplist__L44__name_case1=gen__seplist__L44__name ',' local__3_gen__seplist__L44__name_case1=name { 
        System.Collections.Generic.List<string> tmp__179 ; 
        string tmp__178 ; 
        System.Collections.Generic.List<string> tmp__177 ; 
        tmp__177 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__seplist__L44__name_case1.result ; 
        tmp__178 = ( string ) _localctx.local__3_gen__seplist__L44__name_case1.result ; 
        tmp__179 = (System.Collections.Generic.List<string>) append<string>( tmp__177, tmp__178 ); 
        $result = tmp__179; 
      } 
; 
gen__optional_gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__optional_gen__blockOf_else_case0=gen__blockOf_else { 
        ImmediateAST tmp__180 ; 
        tmp__180 = ( ImmediateAST ) _localctx.local__1_gen__optional_gen__blockOf_else_case0.result ; 
        $result = tmp__180; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__blockOf_else_case0='else' local__2_gen__blockOf_else_case0=block { 
        ImmediateAST tmp__183 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__182 ; 
        CommonToken tmp__181 ; 
        tmp__181 = ( CommonToken ) _localctx.local__1_gen__blockOf_else_case0 ; 
        tmp__182 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_else_case0.result ; 
        tmp__183 = (ImmediateAST) mkBlock( tmp__181, tmp__182 ); 
        $result = tmp__183; 
      } 
; 
gen__nullable_gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0=gen__list_gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__184 ; 
        tmp__184 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__184; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__185 ; 
        tmp__185 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__185; 
      } 
; 
gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__list_gen__snd_elif__elifBlock_case0=gen__snd_elif__elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__187 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__186 ; 
        tmp__187 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        tmp__186 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__187 }; 
        $result = tmp__186; 
      } 
    | local__1_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock local__2_gen__list_gen__snd_elif__elifBlock_case1=gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__190 ; 
        (ImmediateAST, ImmediateAST) tmp__189 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__188 ; 
        tmp__188 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__189 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__190 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__188, tmp__189 ); 
        $result = tmp__190; 
      } 
; 
gen__snd_elif__elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      'elif' local__2_gen__snd_elif__elifBlock_case0=elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__191 ; 
        tmp__191 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__191; 
      } 
; 
gen__closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      gen__optional_newline local__2_gen__closelist__L44__pair_case0=gen___closelist__L44__pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__192 ; 
        tmp__192 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_gen__closelist__L44__pair_case0.result ; 
        $result = tmp__192; 
      } 
; 
gen___closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen___closelist__L44__pair_case0=gen___closelist__L44__pair newline { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__193 ; 
        tmp__193 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case0.result ; 
        $result = tmp__193; 
      } 
    | local__1_gen___closelist__L44__pair_case1=gen___closelist__L44__pair ',' newline local__4_gen___closelist__L44__pair_case1=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__196 ; 
        (ImmediateAST, ImmediateAST) tmp__195 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__194 ; 
        tmp__194 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case1.result ; 
        tmp__195 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__4_gen___closelist__L44__pair_case1.result ; 
        tmp__196 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__194, tmp__195 ); 
        $result = tmp__196; 
      } 
    | local__1_gen___closelist__L44__pair_case2=gen___closelist__L44__pair ',' local__3_gen___closelist__L44__pair_case2=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__199 ; 
        (ImmediateAST, ImmediateAST) tmp__198 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__197 ; 
        tmp__197 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case2.result ; 
        tmp__198 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__3_gen___closelist__L44__pair_case2.result ; 
        tmp__199 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__197, tmp__198 ); 
        $result = tmp__199; 
      } 
    | local__1_gen___closelist__L44__pair_case3=pair { 
        (ImmediateAST, ImmediateAST) tmp__201 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__200 ; 
        tmp__201 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen___closelist__L44__pair_case3.result ; 
        tmp__200 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__201 }; 
        $result = tmp__200; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__202 ; 
        tmp__202 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { }; 
        $result = tmp__202; 
      } 
; 
gen__closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_gen__closelist__L44__expr_case0=gen___closelist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__203 ; 
        tmp__203 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__closelist__L44__expr_case0.result ; 
        $result = tmp__203; 
      } 
; 
gen___closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen___closelist__L44__expr_case0=gen___closelist__L44__expr newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__204 ; 
        tmp__204 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case0.result ; 
        $result = tmp__204; 
      } 
    | local__1_gen___closelist__L44__expr_case1=gen___closelist__L44__expr ',' newline local__4_gen___closelist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__207 ; 
        ImmediateAST tmp__206 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__205 ; 
        tmp__205 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case1.result ; 
        tmp__206 = ( ImmediateAST ) _localctx.local__4_gen___closelist__L44__expr_case1.result ; 
        tmp__207 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__205, tmp__206 ); 
        $result = tmp__207; 
      } 
    | local__1_gen___closelist__L44__expr_case2=gen___closelist__L44__expr ',' local__3_gen___closelist__L44__expr_case2=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__210 ; 
        ImmediateAST tmp__209 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__208 ; 
        tmp__208 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case2.result ; 
        tmp__209 = ( ImmediateAST ) _localctx.local__3_gen___closelist__L44__expr_case2.result ; 
        tmp__210 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__208, tmp__209 ); 
        $result = tmp__210; 
      } 
    | local__1_gen___closelist__L44__expr_case3=expr { 
        ImmediateAST tmp__212 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__211 ; 
        tmp__212 = ( ImmediateAST ) _localctx.local__1_gen___closelist__L44__expr_case3.result ; 
        tmp__211 = new System.Collections.Generic.List<ImmediateAST> { tmp__212 }; 
        $result = tmp__211; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__213 ; 
        tmp__213 = new System.Collections.Generic.List<ImmediateAST> { }; 
        $result = tmp__213; 
      } 
; 
pair returns [(ImmediateAST, ImmediateAST) result] :
      local__1_pair_case0=expr gen__line_wrap__L58 local__3_pair_case0=expr { 
        ImmediateAST tmp__216 ; 
        ImmediateAST tmp__215 ; 
        (ImmediateAST, ImmediateAST) tmp__214 ; 
        tmp__215 = ( ImmediateAST ) _localctx.local__1_pair_case0.result ; 
        tmp__216 = ( ImmediateAST ) _localctx.local__3_pair_case0.result ; 
        tmp__214 = ( tmp__215 , tmp__216 ); 
        $result = tmp__214; 
      } 
; 
gen__line_wrap__L58 returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap__L58_case0=':' gen__optional_newline { 
        CommonToken tmp__217 ; 
        tmp__217 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L58_case0 ; 
        $result = tmp__217; 
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
        ImmediateAST tmp__219 ; 
        System.Collections.Generic.List<object> tmp__218 ; 
        tmp__218 = ( System.Collections.Generic.List<object> ) _localctx.local__1_bin_case0.result ; 
        tmp__219 = (ImmediateAST) resolve_binop( tmp__218 ); 
        $result = tmp__219; 
      } 
; 
binseq returns [System.Collections.Generic.List<object> result] :
      local__1_binseq_case0=atom { 
        System.Collections.Generic.List<object> tmp__223 ; 
        object tmp__222 ; 
        ImmediateAST tmp__221 ; 
        System.Collections.Generic.List<object> tmp__220 ; 
        tmp__220 = (System.Collections.Generic.List<object>) empty<object>(  ); 
        tmp__221 = ( ImmediateAST ) _localctx.local__1_binseq_case0.result ; 
        tmp__222 = (object) to_obj<ImmediateAST>( tmp__221 ); 
        tmp__223 = (System.Collections.Generic.List<object>) append<object>( tmp__220, tmp__222 ); 
        $result = tmp__223; 
      } 
    | local__1_binseq_case1=binseq local__2_binseq_case1=binop local__3_binseq_case1=atom { 
        object tmp__229 ; 
        ImmediateAST tmp__228 ; 
        System.Collections.Generic.List<object> tmp__227 ; 
        System.Collections.Generic.List<object> block__224 ; 
        object tmp__226 ; 
        System.Collections.Generic.List<object> tmp__225 ; 
        tmp__225 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__226 = ( object ) _localctx.local__2_binseq_case1.result ; 
        block__224 = (System.Collections.Generic.List<object>) append<object>( tmp__225, tmp__226 ); 
        tmp__227 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__228 = ( ImmediateAST ) _localctx.local__3_binseq_case1.result ; 
        tmp__229 = (object) to_obj<ImmediateAST>( tmp__228 ); 
        block__224 = (System.Collections.Generic.List<object>) append<object>( tmp__227, tmp__229 ); 
        $result = block__224; 
      } 
; 
ibin returns [ImmediateAST result] :
      local__1_ibin_case0=lhs local__2_ibin_case0=ibinop local__3_ibin_case0='=' local__4_ibin_case0=expr { 
        ImmediateAST tmp__234 ; 
        ImmediateAST tmp__233 ; 
        string tmp__232 ; 
        ImmediateAST tmp__231 ; 
        CommonToken tmp__230 ; 
        tmp__230 = ( CommonToken ) _localctx.local__3_ibin_case0 ; 
        tmp__231 = ( ImmediateAST ) _localctx.local__1_ibin_case0.result ; 
        tmp__232 = ( string ) _localctx.local__2_ibin_case0.result ; 
        tmp__233 = ( ImmediateAST ) _localctx.local__4_ibin_case0.result ; 
        tmp__234 = (ImmediateAST) mkIBin( tmp__230, tmp__231, tmp__232, tmp__233 ); 
        $result = tmp__234; 
      } 
; 
ibinop returns [string result] :
      local__1_ibinop_case0=SINGLE_BINOP_2 { 
        CommonToken tmp__235 ; 
        tmp__235 = ( CommonToken ) _localctx.local__1_ibinop_case0 ; 
        $result = tmp__235.Text; 
      } 
    | '-' { 
        string tmp__236 ; 
        tmp__236 = "-" ; 
        $result = tmp__236; 
      } 
; 
binop returns [object result] :
      local__1_binop_case0=SINGLE_BINOP_2 { 
        object tmp__239 ; 
        CommonToken tmp__238 ; 
        CommonToken tmp__237 ; 
        tmp__237 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__238 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__239 = (object) mkop( tmp__237, tmp__238.Text ); 
        $result = tmp__239; 
      } 
    | local__1_binop_case1='not' 'in' { 
        object tmp__242 ; 
        string tmp__241 ; 
        CommonToken tmp__240 ; 
        tmp__240 = ( CommonToken ) _localctx.local__1_binop_case1 ; 
        tmp__241 = "notin" ; 
        tmp__242 = (object) mkop( tmp__240, tmp__241 ); 
        $result = tmp__242; 
      } 
    | local__1_binop_case2='in' { 
        object tmp__245 ; 
        string tmp__244 ; 
        CommonToken tmp__243 ; 
        tmp__243 = ( CommonToken ) _localctx.local__1_binop_case2 ; 
        tmp__244 = "in" ; 
        tmp__245 = (object) mkop( tmp__243, tmp__244 ); 
        $result = tmp__245; 
      } 
    | local__1_binop_case3='-' { 
        object tmp__248 ; 
        string tmp__247 ; 
        CommonToken tmp__246 ; 
        tmp__246 = ( CommonToken ) _localctx.local__1_binop_case3 ; 
        tmp__247 = "-" ; 
        tmp__248 = (object) mkop( tmp__246, tmp__247 ); 
        $result = tmp__248; 
      } 
; 
not returns [ImmediateAST result] :
      local__1_not_case0='not' local__2_not_case0=bin { 
        ImmediateAST tmp__251 ; 
        ImmediateAST tmp__250 ; 
        CommonToken tmp__249 ; 
        tmp__249 = ( CommonToken ) _localctx.local__1_not_case0 ; 
        tmp__250 = ( ImmediateAST ) _localctx.local__2_not_case0.result ; 
        tmp__251 = (ImmediateAST) mkNot( tmp__249, tmp__250 ); 
        $result = tmp__251; 
      } 
    | local__1_not_case1=bin { 
        ImmediateAST tmp__252 ; 
        tmp__252 = ( ImmediateAST ) _localctx.local__1_not_case1.result ; 
        $result = tmp__252; 
      } 
; 
and_expr returns [ImmediateAST result] :
      local__1_and_expr_case0=and_expr local__2_and_expr_case0='and' local__3_and_expr_case0=not { 
        ImmediateAST tmp__256 ; 
        ImmediateAST tmp__255 ; 
        ImmediateAST tmp__254 ; 
        CommonToken tmp__253 ; 
        tmp__253 = ( CommonToken ) _localctx.local__2_and_expr_case0 ; 
        tmp__254 = ( ImmediateAST ) _localctx.local__1_and_expr_case0.result ; 
        tmp__255 = ( ImmediateAST ) _localctx.local__3_and_expr_case0.result ; 
        tmp__256 = (ImmediateAST) mkAnd( tmp__253, tmp__254, tmp__255 ); 
        $result = tmp__256; 
      } 
    | local__1_and_expr_case1=not { 
        ImmediateAST tmp__257 ; 
        tmp__257 = ( ImmediateAST ) _localctx.local__1_and_expr_case1.result ; 
        $result = tmp__257; 
      } 
; 
or_expr returns [ImmediateAST result] :
      local__1_or_expr_case0=or_expr local__2_or_expr_case0='or' local__3_or_expr_case0=and_expr { 
        ImmediateAST tmp__261 ; 
        ImmediateAST tmp__260 ; 
        ImmediateAST tmp__259 ; 
        CommonToken tmp__258 ; 
        tmp__258 = ( CommonToken ) _localctx.local__2_or_expr_case0 ; 
        tmp__259 = ( ImmediateAST ) _localctx.local__1_or_expr_case0.result ; 
        tmp__260 = ( ImmediateAST ) _localctx.local__3_or_expr_case0.result ; 
        tmp__261 = (ImmediateAST) mkAnd( tmp__258, tmp__259, tmp__260 ); 
        $result = tmp__261; 
      } 
    | local__1_or_expr_case1=and_expr { 
        ImmediateAST tmp__262 ; 
        tmp__262 = ( ImmediateAST ) _localctx.local__1_or_expr_case1.result ; 
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


