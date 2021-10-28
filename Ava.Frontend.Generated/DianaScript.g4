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
    | local__1_stmt_case10=ibin { 
        ImmediateAST tmp__36 ; 
        tmp__36 = ( ImmediateAST ) _localctx.local__1_stmt_case10.result ; 
        $result = tmp__36; 
      } 
; 
gen__filter_option__NEWLINE returns [System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> result] :
      local__1_gen__filter_option__NEWLINE_case0=gen__filter_option__NEWLINE local__2_gen__filter_option__NEWLINE_case0=option { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__39 ; 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__38 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__37 ; 
        tmp__37 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__1_gen__filter_option__NEWLINE_case0.result ; 
        tmp__38 = ( (int, int, string, System.Collections.Generic.List<ImmediateAST>) ) _localctx.local__2_gen__filter_option__NEWLINE_case0.result ; 
        tmp__39 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) append<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>( tmp__37, tmp__38 ); 
        $result = tmp__39; 
      } 
    | local__1_gen__filter_option__NEWLINE_case1=gen__filter_option__NEWLINE NEWLINE_17 { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__40 ; 
        tmp__40 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__1_gen__filter_option__NEWLINE_case1.result ; 
        $result = tmp__40; 
      } 
    | local__1_gen__filter_option__NEWLINE_case2=option { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__43 ; 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__42 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__41 ; 
        tmp__41 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) empty<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>(  ); 
        tmp__42 = ( (int, int, string, System.Collections.Generic.List<ImmediateAST>) ) _localctx.local__1_gen__filter_option__NEWLINE_case2.result ; 
        tmp__43 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) append<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>( tmp__41, tmp__42 ); 
        $result = tmp__43; 
      } 
    | NEWLINE_17 { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__44 ; 
        tmp__44 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) empty<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>(  ); 
        $result = tmp__44; 
      } 
; 
option returns [(int, int, string, System.Collections.Generic.List<ImmediateAST>) result] :
      local__1_option_case0=NAME_13 local__2_option_case0=gen__nullable_gen__seplist__L44__expr { 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__47 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__46 ; 
        CommonToken tmp__45 ; 
        tmp__45 = ( CommonToken ) _localctx.local__1_option_case0 ; 
        tmp__46 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_option_case0.result ; 
        tmp__47 = ((int, int, string, System.Collections.Generic.List<ImmediateAST>)) mkOptionN( tmp__45, tmp__46 ); 
        $result = tmp__47; 
      } 
    | 'do' local__2_option_case1=expr { 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__49 ; 
        ImmediateAST tmp__48 ; 
        tmp__48 = ( ImmediateAST ) _localctx.local__2_option_case1.result ; 
        tmp__49 = ((int, int, string, System.Collections.Generic.List<ImmediateAST>)) mkDoOption( tmp__48 ); 
        $result = tmp__49; 
      } 
; 
gen__nullable_gen__seplist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__nullable_gen__seplist__L44__expr_case0=gen__seplist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__50 ; 
        tmp__50 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist__L44__expr_case0.result ; 
        $result = tmp__50; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__51 ; 
        tmp__51 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__51; 
      } 
; 
gen__seplist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist__L44__expr_case0=expr { 
        ImmediateAST tmp__53 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__52 ; 
        tmp__53 = ( ImmediateAST ) _localctx.local__1_gen__seplist__L44__expr_case0.result ; 
        tmp__52 = new System.Collections.Generic.List<ImmediateAST> { tmp__53 }; 
        $result = tmp__52; 
      } 
    | local__1_gen__seplist__L44__expr_case1=gen__seplist__L44__expr ',' local__3_gen__seplist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__56 ; 
        ImmediateAST tmp__55 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__54 ; 
        tmp__54 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist__L44__expr_case1.result ; 
        tmp__55 = ( ImmediateAST ) _localctx.local__3_gen__seplist__L44__expr_case1.result ; 
        tmp__56 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__54, tmp__55 ); 
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
    | local__1_atom_case6=STR_4 { 
        ImmediateAST tmp__86 ; 
        DObj tmp__85 ; 
        string tmp__84 ; 
        CommonToken tmp__83 ; 
        CommonToken tmp__82 ; 
        tmp__82 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__83 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__84 = (string) unesc( tmp__83.Text ); 
        tmp__85 = (DObj) mkstr( tmp__84 ); 
        tmp__86 = (ImmediateAST) mkVal( tmp__82, tmp__85 ); 
        $result = tmp__86; 
      } 
    | local__1_atom_case7=INT_10 { 
        ImmediateAST tmp__91 ; 
        DObj tmp__90 ; 
        int tmp__89 ; 
        CommonToken tmp__88 ; 
        CommonToken tmp__87 ; 
        tmp__87 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__88 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__89 = 0 ; 
        tmp__90 = (DObj) mkint( tmp__88.Text, tmp__89 ); 
        tmp__91 = (ImmediateAST) mkVal( tmp__87, tmp__90 ); 
        $result = tmp__91; 
      } 
    | local__1_atom_case8=HEX_7 { 
        ImmediateAST tmp__96 ; 
        DObj tmp__95 ; 
        int tmp__94 ; 
        CommonToken tmp__93 ; 
        CommonToken tmp__92 ; 
        tmp__92 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__93 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__94 = 16 ; 
        tmp__95 = (DObj) mkint( tmp__93.Text, tmp__94 ); 
        tmp__96 = (ImmediateAST) mkVal( tmp__92, tmp__95 ); 
        $result = tmp__96; 
      } 
    | local__1_atom_case9=OCT_8 { 
        ImmediateAST tmp__101 ; 
        DObj tmp__100 ; 
        int tmp__99 ; 
        CommonToken tmp__98 ; 
        CommonToken tmp__97 ; 
        tmp__97 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__98 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__99 = 8 ; 
        tmp__100 = (DObj) mkint( tmp__98.Text, tmp__99 ); 
        tmp__101 = (ImmediateAST) mkVal( tmp__97, tmp__100 ); 
        $result = tmp__101; 
      } 
    | local__1_atom_case10=BIN_9 { 
        ImmediateAST tmp__106 ; 
        DObj tmp__105 ; 
        int tmp__104 ; 
        CommonToken tmp__103 ; 
        CommonToken tmp__102 ; 
        tmp__102 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__103 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__104 = 2 ; 
        tmp__105 = (DObj) mkint( tmp__103.Text, tmp__104 ); 
        tmp__106 = (ImmediateAST) mkVal( tmp__102, tmp__105 ); 
        $result = tmp__106; 
      } 
    | local__1_atom_case11=FLOAT_11 { 
        ImmediateAST tmp__110 ; 
        DObj tmp__109 ; 
        CommonToken tmp__108 ; 
        CommonToken tmp__107 ; 
        tmp__107 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__108 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__109 = (DObj) mkfloat( tmp__108.Text ); 
        tmp__110 = (ImmediateAST) mkVal( tmp__107, tmp__109 ); 
        $result = tmp__110; 
      } 
    | local__1_atom_case12='None' { 
        ImmediateAST tmp__113 ; 
        DObj tmp__112 ; 
        CommonToken tmp__111 ; 
        tmp__111 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__112 = (DObj) mknone(  ); 
        tmp__113 = (ImmediateAST) mkVal( tmp__111, tmp__112 ); 
        $result = tmp__113; 
      } 
    | local__1_atom_case13=NAME_13 { 
        ImmediateAST tmp__116 ; 
        CommonToken tmp__115 ; 
        CommonToken tmp__114 ; 
        tmp__114 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__115 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__116 = (ImmediateAST) mkVar( tmp__114, tmp__115.Text ); 
        $result = tmp__116; 
      } 
    | local__1_atom_case14='-' local__2_atom_case14=atom { 
        ImmediateAST tmp__119 ; 
        ImmediateAST tmp__118 ; 
        CommonToken tmp__117 ; 
        tmp__117 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__118 = ( ImmediateAST ) _localctx.local__2_atom_case14.result ; 
        tmp__119 = (ImmediateAST) mkNeg( tmp__117, tmp__118 ); 
        $result = tmp__119; 
      } 
    | local__1_atom_case15='~' local__2_atom_case15=atom { 
        ImmediateAST tmp__122 ; 
        ImmediateAST tmp__121 ; 
        CommonToken tmp__120 ; 
        tmp__120 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__121 = ( ImmediateAST ) _localctx.local__2_atom_case15.result ; 
        tmp__122 = (ImmediateAST) mkInv( tmp__120, tmp__121 ); 
        $result = tmp__122; 
      } 
    | local__1_atom_case16='if' local__2_atom_case16=expr local__3_atom_case16=then local__4_atom_case16=block 'end' { 
        ImmediateAST tmp__128 ; 
        ImmediateAST tmp__127 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__126 ; 
        CommonToken tmp__125 ; 
        ImmediateAST tmp__124 ; 
        CommonToken tmp__123 ; 
        tmp__123 = ( CommonToken ) _localctx.local__1_atom_case16 ; 
        tmp__124 = ( ImmediateAST ) _localctx.local__2_atom_case16.result ; 
        tmp__125 = ( CommonToken ) _localctx.local__3_atom_case16.result ; 
        tmp__126 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case16.result ; 
        tmp__127 = (ImmediateAST) mkBlock( tmp__125, tmp__126 ); 
        tmp__128 = (ImmediateAST) mkIfThen( tmp__123, tmp__124, tmp__127 ); 
        $result = tmp__128; 
      } 
    | local__1_atom_case17='if' local__2_atom_case17=expr local__3_atom_case17=then local__4_atom_case17=block local__5_atom_case17=gen__nullable_gen__list_gen__snd_elif__elifBlock local__6_atom_case17=gen__optional_gen__blockOf_else 'end' { 
        ImmediateAST tmp__140 ; 
        ImmediateAST tmp__139 ; 
        CommonToken tmp__138 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__136 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__137 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__134 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__135 ; 
        ImmediateAST tmp__133 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__132 ; 
        CommonToken tmp__131 ; 
        ImmediateAST tmp__130 ; 
        (ImmediateAST, ImmediateAST) elif__129 ; 
        tmp__130 = ( ImmediateAST ) _localctx.local__2_atom_case17.result ; 
        tmp__131 = ( CommonToken ) _localctx.local__3_atom_case17.result ; 
        tmp__132 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case17.result ; 
        tmp__133 = (ImmediateAST) mkBlock( tmp__131, tmp__132 ); 
        elif__129 = ( tmp__130 , tmp__133 ); 
        tmp__135 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        elifs__134 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__135, elif__129 ); 
        tmp__137 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__5_atom_case17.result ; 
        elifs__136 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) extend<(ImmediateAST, ImmediateAST)>( elifs__134, tmp__137 ); 
        tmp__138 = ( CommonToken ) _localctx.local__1_atom_case17 ; 
        tmp__139 = ( ImmediateAST ) _localctx.local__6_atom_case17.result ; 
        tmp__140 = (ImmediateAST) mkNestedIf( tmp__138, elifs__134, tmp__139 ); 
        $result = tmp__140; 
      } 
    | local__1_atom_case18='fun' local__2_atom_case18=name '(' local__4_atom_case18=gen__nullable_gen__seplist__L44__name ')' local__6_atom_case18=block 'end' { 
        ImmediateAST tmp__145 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__144 ; 
        System.Collections.Generic.List<string> tmp__143 ; 
        string tmp__142 ; 
        CommonToken tmp__141 ; 
        tmp__141 = ( CommonToken ) _localctx.local__1_atom_case18 ; 
        tmp__142 = ( string ) _localctx.local__2_atom_case18.result ; 
        tmp__143 = ( System.Collections.Generic.List<string> ) _localctx.local__4_atom_case18.result ; 
        tmp__144 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__6_atom_case18.result ; 
        tmp__145 = (ImmediateAST) mkFunc( tmp__141, tmp__142, tmp__143, tmp__144 ); 
        $result = tmp__145; 
      } 
    | local__1_atom_case19='fun' '(' local__3_atom_case19=gen__nullable_gen__seplist__L44__name ')' local__5_atom_case19=block 'end' { 
        ImmediateAST tmp__150 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__149 ; 
        System.Collections.Generic.List<string> tmp__148 ; 
        string tmp__147 ; 
        CommonToken tmp__146 ; 
        tmp__146 = ( CommonToken ) _localctx.local__1_atom_case19 ; 
        tmp__147 = "" ; 
        tmp__148 = ( System.Collections.Generic.List<string> ) _localctx.local__3_atom_case19.result ; 
        tmp__149 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__5_atom_case19.result ; 
        tmp__150 = (ImmediateAST) mkFunc( tmp__146, tmp__147, tmp__148, tmp__149 ); 
        $result = tmp__150; 
      } 
    | local__1_atom_case20='(' local__2_atom_case20=gen__nullable_gen__seplist__L44__name ')' '->' local__5_atom_case20=gen__line_wrap_expr { 
        ImmediateAST tmp__156 ; 
        ImmediateAST tmp__155 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__154 ; 
        System.Collections.Generic.List<string> tmp__153 ; 
        string tmp__152 ; 
        CommonToken tmp__151 ; 
        tmp__151 = ( CommonToken ) _localctx.local__1_atom_case20 ; 
        tmp__152 = "" ; 
        tmp__153 = ( System.Collections.Generic.List<string> ) _localctx.local__2_atom_case20.result ; 
        tmp__155 = ( ImmediateAST ) _localctx.local__5_atom_case20.result ; 
        tmp__154 = new System.Collections.Generic.List<ImmediateAST> { tmp__155 }; 
        tmp__156 = (ImmediateAST) mkFunc( tmp__151, tmp__152, tmp__153, tmp__154 ); 
        $result = tmp__156; 
      } 
    | local__1_atom_case21=NAME_13 '->' local__3_atom_case21=gen__line_wrap_expr { 
        ImmediateAST tmp__163 ; 
        ImmediateAST tmp__162 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__161 ; 
        CommonToken tmp__160 ; 
        System.Collections.Generic.List<string> tmp__159 ; 
        string tmp__158 ; 
        CommonToken tmp__157 ; 
        tmp__157 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__158 = "" ; 
        tmp__160 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__159 = new System.Collections.Generic.List<string> { tmp__160.Text }; 
        tmp__162 = ( ImmediateAST ) _localctx.local__3_atom_case21.result ; 
        tmp__161 = new System.Collections.Generic.List<ImmediateAST> { tmp__162 }; 
        tmp__163 = (ImmediateAST) mkFunc( tmp__157, tmp__158, tmp__159, tmp__161 ); 
        $result = tmp__163; 
      } 
; 
gen__line_wrap_expr returns [ImmediateAST result] :
      gen__optional_NEWLINE local__2_gen__line_wrap_expr_case0=expr gen__optional_NEWLINE { 
        ImmediateAST tmp__164 ; 
        tmp__164 = ( ImmediateAST ) _localctx.local__2_gen__line_wrap_expr_case0.result ; 
        $result = tmp__164; 
      } 
; 
gen__optional_NEWLINE returns [CommonToken result] :
      local__1_gen__optional_NEWLINE_case0=NEWLINE_17 { 
        CommonToken tmp__165 ; 
        tmp__165 = ( CommonToken ) _localctx.local__1_gen__optional_NEWLINE_case0 ; 
        $result = tmp__165; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__nullable_gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__nullable_gen__seplist__L44__name_case0=gen__seplist__L44__name { 
        System.Collections.Generic.List<string> tmp__166 ; 
        tmp__166 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__nullable_gen__seplist__L44__name_case0.result ; 
        $result = tmp__166; 
      } 
    | { 
        System.Collections.Generic.List<string> tmp__167 ; 
        tmp__167 = (System.Collections.Generic.List<string>) empty<string>(  ); 
        $result = tmp__167; 
      } 
; 
gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__seplist__L44__name_case0=name { 
        string tmp__169 ; 
        System.Collections.Generic.List<string> tmp__168 ; 
        tmp__169 = ( string ) _localctx.local__1_gen__seplist__L44__name_case0.result ; 
        tmp__168 = new System.Collections.Generic.List<string> { tmp__169 }; 
        $result = tmp__168; 
      } 
    | local__1_gen__seplist__L44__name_case1=gen__seplist__L44__name ',' local__3_gen__seplist__L44__name_case1=name { 
        System.Collections.Generic.List<string> tmp__172 ; 
        string tmp__171 ; 
        System.Collections.Generic.List<string> tmp__170 ; 
        tmp__170 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__seplist__L44__name_case1.result ; 
        tmp__171 = ( string ) _localctx.local__3_gen__seplist__L44__name_case1.result ; 
        tmp__172 = (System.Collections.Generic.List<string>) append<string>( tmp__170, tmp__171 ); 
        $result = tmp__172; 
      } 
; 
gen__optional_gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__optional_gen__blockOf_else_case0=gen__blockOf_else { 
        ImmediateAST tmp__173 ; 
        tmp__173 = ( ImmediateAST ) _localctx.local__1_gen__optional_gen__blockOf_else_case0.result ; 
        $result = tmp__173; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__blockOf_else_case0='else' local__2_gen__blockOf_else_case0=block { 
        ImmediateAST tmp__176 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__175 ; 
        CommonToken tmp__174 ; 
        tmp__174 = ( CommonToken ) _localctx.local__1_gen__blockOf_else_case0 ; 
        tmp__175 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_else_case0.result ; 
        tmp__176 = (ImmediateAST) mkBlock( tmp__174, tmp__175 ); 
        $result = tmp__176; 
      } 
; 
gen__nullable_gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0=gen__list_gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__177 ; 
        tmp__177 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__177; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__178 ; 
        tmp__178 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__178; 
      } 
; 
gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__list_gen__snd_elif__elifBlock_case0=gen__snd_elif__elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__180 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__179 ; 
        tmp__180 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        tmp__179 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__180 }; 
        $result = tmp__179; 
      } 
    | local__1_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock local__2_gen__list_gen__snd_elif__elifBlock_case1=gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__183 ; 
        (ImmediateAST, ImmediateAST) tmp__182 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__181 ; 
        tmp__181 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__182 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__183 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__181, tmp__182 ); 
        $result = tmp__183; 
      } 
; 
gen__snd_elif__elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      'elif' local__2_gen__snd_elif__elifBlock_case0=elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__184 ; 
        tmp__184 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__184; 
      } 
; 
gen__closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      gen__optional_NEWLINE local__2_gen__closelist__L44__pair_case0=gen___closelist__L44__pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__185 ; 
        tmp__185 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_gen__closelist__L44__pair_case0.result ; 
        $result = tmp__185; 
      } 
; 
gen___closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen___closelist__L44__pair_case0=gen___closelist__L44__pair NEWLINE_17 { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__186 ; 
        tmp__186 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case0.result ; 
        $result = tmp__186; 
      } 
    | local__1_gen___closelist__L44__pair_case1=gen___closelist__L44__pair ',' NEWLINE_17 local__4_gen___closelist__L44__pair_case1=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__189 ; 
        (ImmediateAST, ImmediateAST) tmp__188 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__187 ; 
        tmp__187 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case1.result ; 
        tmp__188 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__4_gen___closelist__L44__pair_case1.result ; 
        tmp__189 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__187, tmp__188 ); 
        $result = tmp__189; 
      } 
    | local__1_gen___closelist__L44__pair_case2=gen___closelist__L44__pair ',' local__3_gen___closelist__L44__pair_case2=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__192 ; 
        (ImmediateAST, ImmediateAST) tmp__191 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__190 ; 
        tmp__190 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case2.result ; 
        tmp__191 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__3_gen___closelist__L44__pair_case2.result ; 
        tmp__192 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__190, tmp__191 ); 
        $result = tmp__192; 
      } 
    | local__1_gen___closelist__L44__pair_case3=pair { 
        (ImmediateAST, ImmediateAST) tmp__194 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__193 ; 
        tmp__194 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen___closelist__L44__pair_case3.result ; 
        tmp__193 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__194 }; 
        $result = tmp__193; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__195 ; 
        tmp__195 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { }; 
        $result = tmp__195; 
      } 
; 
gen__closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_NEWLINE local__2_gen__closelist__L44__expr_case0=gen___closelist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__196 ; 
        tmp__196 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__closelist__L44__expr_case0.result ; 
        $result = tmp__196; 
      } 
; 
gen___closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen___closelist__L44__expr_case0=gen___closelist__L44__expr NEWLINE_17 { 
        System.Collections.Generic.List<ImmediateAST> tmp__197 ; 
        tmp__197 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case0.result ; 
        $result = tmp__197; 
      } 
    | local__1_gen___closelist__L44__expr_case1=gen___closelist__L44__expr ',' NEWLINE_17 local__4_gen___closelist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__200 ; 
        ImmediateAST tmp__199 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__198 ; 
        tmp__198 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case1.result ; 
        tmp__199 = ( ImmediateAST ) _localctx.local__4_gen___closelist__L44__expr_case1.result ; 
        tmp__200 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__198, tmp__199 ); 
        $result = tmp__200; 
      } 
    | local__1_gen___closelist__L44__expr_case2=gen___closelist__L44__expr ',' local__3_gen___closelist__L44__expr_case2=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__203 ; 
        ImmediateAST tmp__202 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__201 ; 
        tmp__201 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case2.result ; 
        tmp__202 = ( ImmediateAST ) _localctx.local__3_gen___closelist__L44__expr_case2.result ; 
        tmp__203 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__201, tmp__202 ); 
        $result = tmp__203; 
      } 
    | local__1_gen___closelist__L44__expr_case3=expr { 
        ImmediateAST tmp__205 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__204 ; 
        tmp__205 = ( ImmediateAST ) _localctx.local__1_gen___closelist__L44__expr_case3.result ; 
        tmp__204 = new System.Collections.Generic.List<ImmediateAST> { tmp__205 }; 
        $result = tmp__204; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__206 ; 
        tmp__206 = new System.Collections.Generic.List<ImmediateAST> { }; 
        $result = tmp__206; 
      } 
; 
pair returns [(ImmediateAST, ImmediateAST) result] :
      local__1_pair_case0=expr gen__line_wrap__L58 local__3_pair_case0=expr { 
        ImmediateAST tmp__209 ; 
        ImmediateAST tmp__208 ; 
        (ImmediateAST, ImmediateAST) tmp__207 ; 
        tmp__208 = ( ImmediateAST ) _localctx.local__1_pair_case0.result ; 
        tmp__209 = ( ImmediateAST ) _localctx.local__3_pair_case0.result ; 
        tmp__207 = ( tmp__208 , tmp__209 ); 
        $result = tmp__207; 
      } 
; 
gen__line_wrap__L58 returns [CommonToken result] :
      gen__optional_NEWLINE local__2_gen__line_wrap__L58_case0=':' gen__optional_NEWLINE { 
        CommonToken tmp__210 ; 
        tmp__210 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L58_case0 ; 
        $result = tmp__210; 
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
        ImmediateAST tmp__212 ; 
        System.Collections.Generic.List<object> tmp__211 ; 
        tmp__211 = ( System.Collections.Generic.List<object> ) _localctx.local__1_bin_case0.result ; 
        tmp__212 = (ImmediateAST) resolve_binop( tmp__211 ); 
        $result = tmp__212; 
      } 
; 
binseq returns [System.Collections.Generic.List<object> result] :
      local__1_binseq_case0=atom { 
        System.Collections.Generic.List<object> tmp__216 ; 
        object tmp__215 ; 
        ImmediateAST tmp__214 ; 
        System.Collections.Generic.List<object> tmp__213 ; 
        tmp__213 = (System.Collections.Generic.List<object>) empty<object>(  ); 
        tmp__214 = ( ImmediateAST ) _localctx.local__1_binseq_case0.result ; 
        tmp__215 = (object) to_obj<ImmediateAST>( tmp__214 ); 
        tmp__216 = (System.Collections.Generic.List<object>) append<object>( tmp__213, tmp__215 ); 
        $result = tmp__216; 
      } 
    | local__1_binseq_case1=binseq local__2_binseq_case1=binop local__3_binseq_case1=atom { 
        object tmp__222 ; 
        ImmediateAST tmp__221 ; 
        System.Collections.Generic.List<object> tmp__220 ; 
        System.Collections.Generic.List<object> block__217 ; 
        object tmp__219 ; 
        System.Collections.Generic.List<object> tmp__218 ; 
        tmp__218 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__219 = ( object ) _localctx.local__2_binseq_case1.result ; 
        block__217 = (System.Collections.Generic.List<object>) append<object>( tmp__218, tmp__219 ); 
        tmp__220 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__221 = ( ImmediateAST ) _localctx.local__3_binseq_case1.result ; 
        tmp__222 = (object) to_obj<ImmediateAST>( tmp__221 ); 
        block__217 = (System.Collections.Generic.List<object>) append<object>( tmp__220, tmp__222 ); 
        $result = block__217; 
      } 
; 
ibin returns [ImmediateAST result] :
      local__1_ibin_case0=lhs local__2_ibin_case0=ibinop local__3_ibin_case0='=' local__4_ibin_case0=expr { 
        ImmediateAST tmp__227 ; 
        ImmediateAST tmp__226 ; 
        string tmp__225 ; 
        ImmediateAST tmp__224 ; 
        CommonToken tmp__223 ; 
        tmp__223 = ( CommonToken ) _localctx.local__3_ibin_case0 ; 
        tmp__224 = ( ImmediateAST ) _localctx.local__1_ibin_case0.result ; 
        tmp__225 = ( string ) _localctx.local__2_ibin_case0.result ; 
        tmp__226 = ( ImmediateAST ) _localctx.local__4_ibin_case0.result ; 
        tmp__227 = (ImmediateAST) mkIBin( tmp__223, tmp__224, tmp__225, tmp__226 ); 
        $result = tmp__227; 
      } 
; 
ibinop returns [string result] :
      local__1_ibinop_case0=SINGLE_BINOP_2 { 
        CommonToken tmp__228 ; 
        tmp__228 = ( CommonToken ) _localctx.local__1_ibinop_case0 ; 
        $result = tmp__228.Text; 
      } 
    | '-' { 
        string tmp__229 ; 
        tmp__229 = "-" ; 
        $result = tmp__229; 
      } 
; 
binop returns [object result] :
      local__1_binop_case0=SINGLE_BINOP_2 { 
        object tmp__232 ; 
        CommonToken tmp__231 ; 
        CommonToken tmp__230 ; 
        tmp__230 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__231 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__232 = (object) mkop( tmp__230, tmp__231.Text ); 
        $result = tmp__232; 
      } 
    | local__1_binop_case1='not' 'in' { 
        object tmp__235 ; 
        string tmp__234 ; 
        CommonToken tmp__233 ; 
        tmp__233 = ( CommonToken ) _localctx.local__1_binop_case1 ; 
        tmp__234 = "notin" ; 
        tmp__235 = (object) mkop( tmp__233, tmp__234 ); 
        $result = tmp__235; 
      } 
    | local__1_binop_case2='in' { 
        object tmp__238 ; 
        string tmp__237 ; 
        CommonToken tmp__236 ; 
        tmp__236 = ( CommonToken ) _localctx.local__1_binop_case2 ; 
        tmp__237 = "in" ; 
        tmp__238 = (object) mkop( tmp__236, tmp__237 ); 
        $result = tmp__238; 
      } 
    | local__1_binop_case3='-' { 
        object tmp__241 ; 
        string tmp__240 ; 
        CommonToken tmp__239 ; 
        tmp__239 = ( CommonToken ) _localctx.local__1_binop_case3 ; 
        tmp__240 = "-" ; 
        tmp__241 = (object) mkop( tmp__239, tmp__240 ); 
        $result = tmp__241; 
      } 
; 
not returns [ImmediateAST result] :
      local__1_not_case0='not' local__2_not_case0=bin { 
        ImmediateAST tmp__244 ; 
        ImmediateAST tmp__243 ; 
        CommonToken tmp__242 ; 
        tmp__242 = ( CommonToken ) _localctx.local__1_not_case0 ; 
        tmp__243 = ( ImmediateAST ) _localctx.local__2_not_case0.result ; 
        tmp__244 = (ImmediateAST) mkNot( tmp__242, tmp__243 ); 
        $result = tmp__244; 
      } 
    | local__1_not_case1=bin { 
        ImmediateAST tmp__245 ; 
        tmp__245 = ( ImmediateAST ) _localctx.local__1_not_case1.result ; 
        $result = tmp__245; 
      } 
; 
and_expr returns [ImmediateAST result] :
      local__1_and_expr_case0=and_expr local__2_and_expr_case0='and' local__3_and_expr_case0=not { 
        ImmediateAST tmp__249 ; 
        ImmediateAST tmp__248 ; 
        ImmediateAST tmp__247 ; 
        CommonToken tmp__246 ; 
        tmp__246 = ( CommonToken ) _localctx.local__2_and_expr_case0 ; 
        tmp__247 = ( ImmediateAST ) _localctx.local__1_and_expr_case0.result ; 
        tmp__248 = ( ImmediateAST ) _localctx.local__3_and_expr_case0.result ; 
        tmp__249 = (ImmediateAST) mkAnd( tmp__246, tmp__247, tmp__248 ); 
        $result = tmp__249; 
      } 
    | local__1_and_expr_case1=not { 
        ImmediateAST tmp__250 ; 
        tmp__250 = ( ImmediateAST ) _localctx.local__1_and_expr_case1.result ; 
        $result = tmp__250; 
      } 
; 
or_expr returns [ImmediateAST result] :
      local__1_or_expr_case0=or_expr local__2_or_expr_case0='or' local__3_or_expr_case0=and_expr { 
        ImmediateAST tmp__254 ; 
        ImmediateAST tmp__253 ; 
        ImmediateAST tmp__252 ; 
        CommonToken tmp__251 ; 
        tmp__251 = ( CommonToken ) _localctx.local__2_or_expr_case0 ; 
        tmp__252 = ( ImmediateAST ) _localctx.local__1_or_expr_case0.result ; 
        tmp__253 = ( ImmediateAST ) _localctx.local__3_or_expr_case0.result ; 
        tmp__254 = (ImmediateAST) mkAnd( tmp__251, tmp__252, tmp__253 ); 
        $result = tmp__254; 
      } 
    | local__1_or_expr_case1=and_expr { 
        ImmediateAST tmp__255 ; 
        tmp__255 = ( ImmediateAST ) _localctx.local__1_or_expr_case1.result ; 
        $result = tmp__255; 
      } 
; 
expr returns [ImmediateAST result] :
      local__1_expr_case0=gen__seplist_gen__line_wrap__L124_L62__or_expr { 
        ImmediateAST tmp__257 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__256 ; 
        tmp__256 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_expr_case0.result ; 
        tmp__257 = (ImmediateAST) mkPipeline( tmp__256 ); 
        $result = tmp__257; 
      } 
; 
gen__seplist_gen__line_wrap__L124_L62__or_expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case0=or_expr { 
        ImmediateAST tmp__259 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__258 ; 
        tmp__259 = ( ImmediateAST ) _localctx.local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case0.result ; 
        tmp__258 = new System.Collections.Generic.List<ImmediateAST> { tmp__259 }; 
        $result = tmp__258; 
      } 
    | local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1=gen__seplist_gen__line_wrap__L124_L62__or_expr gen__line_wrap__L124_L62 local__3_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1=or_expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__262 ; 
        ImmediateAST tmp__261 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__260 ; 
        tmp__260 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1.result ; 
        tmp__261 = ( ImmediateAST ) _localctx.local__3_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1.result ; 
        tmp__262 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__260, tmp__261 ); 
        $result = tmp__262; 
      } 
; 
gen__line_wrap__L124_L62 returns [CommonToken result] :
      gen__optional_NEWLINE local__2_gen__line_wrap__L124_L62_case0='|>' gen__optional_NEWLINE { 
        CommonToken tmp__263 ; 
        tmp__263 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L124_L62_case0 ; 
        $result = tmp__263; 
      } 
; 
block returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_block_case0=gen__filter_stmt__gen__or___L59__NEWLINE { 
        System.Collections.Generic.List<ImmediateAST> tmp__264 ; 
        tmp__264 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_block_case0.result ; 
        $result = tmp__264; 
      } 
; 
gen__filter_stmt__gen__or___L59__NEWLINE returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case0=gen__filter_stmt__gen__or___L59__NEWLINE local__2_gen__filter_stmt__gen__or___L59__NEWLINE_case0=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__267 ; 
        ImmediateAST tmp__266 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__265 ; 
        tmp__265 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case0.result ; 
        tmp__266 = ( ImmediateAST ) _localctx.local__2_gen__filter_stmt__gen__or___L59__NEWLINE_case0.result ; 
        tmp__267 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__265, tmp__266 ); 
        $result = tmp__267; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case1=gen__filter_stmt__gen__or___L59__NEWLINE gen__or___L59__NEWLINE { 
        System.Collections.Generic.List<ImmediateAST> tmp__268 ; 
        tmp__268 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case1.result ; 
        $result = tmp__268; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case2=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__271 ; 
        ImmediateAST tmp__270 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__269 ; 
        tmp__269 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__270 = ( ImmediateAST ) _localctx.local__1_gen__filter_stmt__gen__or___L59__NEWLINE_case2.result ; 
        tmp__271 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__269, tmp__270 ); 
        $result = tmp__271; 
      } 
    | gen__or___L59__NEWLINE { 
        System.Collections.Generic.List<ImmediateAST> tmp__272 ; 
        tmp__272 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__272; 
      } 
; 
gen__or___L59__NEWLINE returns [int result] :
      ';' { 
        int tmp__273 ; 
        tmp__273 = 0 ; 
        $result = tmp__273; 
      } 
    | NEWLINE_17 { 
        int tmp__274 ; 
        tmp__274 = 0 ; 
        $result = tmp__274; 
      } 
; 
lhs returns [ImmediateAST result] :
      local__1_lhs_case0=NAME_13 { 
        ImmediateAST tmp__277 ; 
        CommonToken tmp__276 ; 
        CommonToken tmp__275 ; 
        tmp__275 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__276 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__277 = (ImmediateAST) mkVar( tmp__275, tmp__276.Text ); 
        $result = tmp__277; 
      } 
    | local__1_lhs_case1=atom local__2_lhs_case1='.' '[' local__4_lhs_case1=expr ']' { 
        ImmediateAST tmp__281 ; 
        ImmediateAST tmp__280 ; 
        ImmediateAST tmp__279 ; 
        CommonToken tmp__278 ; 
        tmp__278 = ( CommonToken ) _localctx.local__2_lhs_case1 ; 
        tmp__279 = ( ImmediateAST ) _localctx.local__1_lhs_case1.result ; 
        tmp__280 = ( ImmediateAST ) _localctx.local__4_lhs_case1.result ; 
        tmp__281 = (ImmediateAST) mkOGet( tmp__278, tmp__279, tmp__280 ); 
        $result = tmp__281; 
      } 
    | local__1_lhs_case2=atom local__2_lhs_case2='.' local__3_lhs_case2=NAME_13 { 
        ImmediateAST tmp__288 ; 
        ImmediateAST tmp__287 ; 
        DObj tmp__286 ; 
        CommonToken tmp__285 ; 
        CommonToken tmp__284 ; 
        ImmediateAST tmp__283 ; 
        CommonToken tmp__282 ; 
        tmp__282 = ( CommonToken ) _localctx.local__2_lhs_case2 ; 
        tmp__283 = ( ImmediateAST ) _localctx.local__1_lhs_case2.result ; 
        tmp__284 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__285 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__286 = (DObj) mkstr( tmp__285.Text ); 
        tmp__287 = (ImmediateAST) mkVal( tmp__284, tmp__286 ); 
        tmp__288 = (ImmediateAST) mkOGet( tmp__282, tmp__283, tmp__287 ); 
        $result = tmp__288; 
      } 
; 
do returns [CommonToken result] :
      gen__optional_NEWLINE local__2_do_case0='do' { 
        CommonToken tmp__289 ; 
        tmp__289 = ( CommonToken ) _localctx.local__2_do_case0 ; 
        $result = tmp__289; 
      } 
; 
then returns [CommonToken result] :
      gen__optional_NEWLINE local__2_then_case0='then' { 
        CommonToken tmp__290 ; 
        tmp__290 = ( CommonToken ) _localctx.local__2_then_case0 ; 
        $result = tmp__290; 
      } 
; 
gen__blockOf_do returns [ImmediateAST result] :
      local__1_gen__blockOf_do_case0=do local__2_gen__blockOf_do_case0=block { 
        ImmediateAST tmp__293 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__292 ; 
        CommonToken tmp__291 ; 
        tmp__291 = ( CommonToken ) _localctx.local__1_gen__blockOf_do_case0.result ; 
        tmp__292 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_do_case0.result ; 
        tmp__293 = (ImmediateAST) mkBlock( tmp__291, tmp__292 ); 
        $result = tmp__293; 
      } 
; 
name returns [string result] :
      local__1_name_case0=NAME_13 { 
        CommonToken tmp__294 ; 
        tmp__294 = ( CommonToken ) _localctx.local__1_name_case0 ; 
        $result = tmp__294.Text; 
      } 
; 
elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      local__1_elifBlock_case0=expr local__2_elifBlock_case0=gen__blockOf_then { 
        ImmediateAST tmp__297 ; 
        ImmediateAST tmp__296 ; 
        (ImmediateAST, ImmediateAST) tmp__295 ; 
        tmp__296 = ( ImmediateAST ) _localctx.local__1_elifBlock_case0.result ; 
        tmp__297 = ( ImmediateAST ) _localctx.local__2_elifBlock_case0.result ; 
        tmp__295 = ( tmp__296 , tmp__297 ); 
        $result = tmp__295; 
      } 
; 
gen__blockOf_then returns [ImmediateAST result] :
      local__1_gen__blockOf_then_case0=then local__2_gen__blockOf_then_case0=block { 
        ImmediateAST tmp__300 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__299 ; 
        CommonToken tmp__298 ; 
        tmp__298 = ( CommonToken ) _localctx.local__1_gen__blockOf_then_case0.result ; 
        tmp__299 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_then_case0.result ; 
        tmp__300 = (ImmediateAST) mkBlock( tmp__298, tmp__299 ); 
        $result = tmp__300; 
      } 
; 
lhs_seq returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_lhs_seq_case0=lhs_seq local__2_lhs_seq_case0=lhs '=' { 
        System.Collections.Generic.List<ImmediateAST> tmp__303 ; 
        ImmediateAST tmp__302 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__301 ; 
        tmp__301 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_lhs_seq_case0.result ; 
        tmp__302 = ( ImmediateAST ) _localctx.local__2_lhs_seq_case0.result ; 
        tmp__303 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__301, tmp__302 ); 
        $result = tmp__303; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__304 ; 
        tmp__304 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__304; 
      } 
; 
start returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_NEWLINE local__2_start_case0=gen__nullable_gen__seplist_NEWLINE__stmt gen__optional_NEWLINE EOF { 
        System.Collections.Generic.List<ImmediateAST> tmp__305 ; 
        tmp__305 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_start_case0.result ; 
        $result = tmp__305; 
      } 
; 
gen__nullable_gen__seplist_NEWLINE__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__nullable_gen__seplist_NEWLINE__stmt_case0=gen__seplist_NEWLINE__stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__306 ; 
        tmp__306 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist_NEWLINE__stmt_case0.result ; 
        $result = tmp__306; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__307 ; 
        tmp__307 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__307; 
      } 
; 
gen__seplist_NEWLINE__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_NEWLINE__stmt_case0=stmt { 
        ImmediateAST tmp__309 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__308 ; 
        tmp__309 = ( ImmediateAST ) _localctx.local__1_gen__seplist_NEWLINE__stmt_case0.result ; 
        tmp__308 = new System.Collections.Generic.List<ImmediateAST> { tmp__309 }; 
        $result = tmp__308; 
      } 
    | local__1_gen__seplist_NEWLINE__stmt_case1=gen__seplist_NEWLINE__stmt NEWLINE_17 local__3_gen__seplist_NEWLINE__stmt_case1=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__312 ; 
        ImmediateAST tmp__311 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__310 ; 
        tmp__310 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_NEWLINE__stmt_case1.result ; 
        tmp__311 = ( ImmediateAST ) _localctx.local__3_gen__seplist_NEWLINE__stmt_case1.result ; 
        tmp__312 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__310, tmp__311 ); 
        $result = tmp__312; 
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


