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
; 
gen__filter_option__NEWLINE returns [System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> result] :
      local__1_gen__filter_option__NEWLINE_case0=gen__filter_option__NEWLINE local__2_gen__filter_option__NEWLINE_case0=option { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__35 ; 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__34 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__33 ; 
        tmp__33 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__1_gen__filter_option__NEWLINE_case0.result ; 
        tmp__34 = ( (int, int, string, System.Collections.Generic.List<ImmediateAST>) ) _localctx.local__2_gen__filter_option__NEWLINE_case0.result ; 
        tmp__35 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) append<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>( tmp__33, tmp__34 ); 
        $result = tmp__35; 
      } 
    | local__1_gen__filter_option__NEWLINE_case1=gen__filter_option__NEWLINE NEWLINE_17 { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__36 ; 
        tmp__36 = ( System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> ) _localctx.local__1_gen__filter_option__NEWLINE_case1.result ; 
        $result = tmp__36; 
      } 
    | local__1_gen__filter_option__NEWLINE_case2=option { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__39 ; 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__38 ; 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__37 ; 
        tmp__37 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) empty<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>(  ); 
        tmp__38 = ( (int, int, string, System.Collections.Generic.List<ImmediateAST>) ) _localctx.local__1_gen__filter_option__NEWLINE_case2.result ; 
        tmp__39 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) append<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>( tmp__37, tmp__38 ); 
        $result = tmp__39; 
      } 
    | NEWLINE_17 { 
        System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)> tmp__40 ; 
        tmp__40 = (System.Collections.Generic.List<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>) empty<(int, int, string, System.Collections.Generic.List<ImmediateAST>)>(  ); 
        $result = tmp__40; 
      } 
; 
option returns [(int, int, string, System.Collections.Generic.List<ImmediateAST>) result] :
      local__1_option_case0=NAME_13 { 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__42 ; 
        CommonToken tmp__41 ; 
        tmp__41 = ( CommonToken ) _localctx.local__1_option_case0 ; 
        tmp__42 = ((int, int, string, System.Collections.Generic.List<ImmediateAST>)) mkOption0( tmp__41 ); 
        $result = tmp__42; 
      } 
    | local__1_option_case1=NAME_13 local__2_option_case1=gen__seplist__L44__expr { 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__45 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__44 ; 
        CommonToken tmp__43 ; 
        tmp__43 = ( CommonToken ) _localctx.local__1_option_case1 ; 
        tmp__44 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_option_case1.result ; 
        tmp__45 = ((int, int, string, System.Collections.Generic.List<ImmediateAST>)) mkOptionN( tmp__43, tmp__44 ); 
        $result = tmp__45; 
      } 
    | 'do' local__2_option_case2=expr { 
        (int, int, string, System.Collections.Generic.List<ImmediateAST>) tmp__47 ; 
        ImmediateAST tmp__46 ; 
        tmp__46 = ( ImmediateAST ) _localctx.local__2_option_case2.result ; 
        tmp__47 = ((int, int, string, System.Collections.Generic.List<ImmediateAST>)) mkDoOption( tmp__46 ); 
        $result = tmp__47; 
      } 
; 
gen__seplist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist__L44__expr_case0=expr { 
        ImmediateAST tmp__49 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__48 ; 
        tmp__49 = ( ImmediateAST ) _localctx.local__1_gen__seplist__L44__expr_case0.result ; 
        tmp__48 = new System.Collections.Generic.List<ImmediateAST> { tmp__49 }; 
        $result = tmp__48; 
      } 
    | local__1_gen__seplist__L44__expr_case1=gen__seplist__L44__expr ',' local__3_gen__seplist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__52 ; 
        ImmediateAST tmp__51 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__50 ; 
        tmp__50 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist__L44__expr_case1.result ; 
        tmp__51 = ( ImmediateAST ) _localctx.local__3_gen__seplist__L44__expr_case1.result ; 
        tmp__52 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__50, tmp__51 ); 
        $result = tmp__52; 
      } 
; 
atom returns [ImmediateAST result] :
      local__1_atom_case0=atom local__2_atom_case0='.' '[' local__4_atom_case0=expr ']' { 
        ImmediateAST tmp__56 ; 
        ImmediateAST tmp__55 ; 
        ImmediateAST tmp__54 ; 
        CommonToken tmp__53 ; 
        tmp__53 = ( CommonToken ) _localctx.local__2_atom_case0 ; 
        tmp__54 = ( ImmediateAST ) _localctx.local__1_atom_case0.result ; 
        tmp__55 = ( ImmediateAST ) _localctx.local__4_atom_case0.result ; 
        tmp__56 = (ImmediateAST) mkOGet( tmp__53, tmp__54, tmp__55 ); 
        $result = tmp__56; 
      } 
    | local__1_atom_case1=atom local__2_atom_case1='.' local__3_atom_case1=NAME_13 { 
        ImmediateAST tmp__63 ; 
        ImmediateAST tmp__62 ; 
        DObj tmp__61 ; 
        CommonToken tmp__60 ; 
        CommonToken tmp__59 ; 
        ImmediateAST tmp__58 ; 
        CommonToken tmp__57 ; 
        tmp__57 = ( CommonToken ) _localctx.local__2_atom_case1 ; 
        tmp__58 = ( ImmediateAST ) _localctx.local__1_atom_case1.result ; 
        tmp__59 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__60 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__61 = (DObj) mkstr( tmp__60.Text ); 
        tmp__62 = (ImmediateAST) mkVal( tmp__59, tmp__61 ); 
        tmp__63 = (ImmediateAST) mkOGet( tmp__57, tmp__58, tmp__62 ); 
        $result = tmp__63; 
      } 
    | local__1_atom_case2=atom local__2_atom_case2='(' local__3_atom_case2=gen__closelist__L44__expr ')' { 
        ImmediateAST tmp__67 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__66 ; 
        ImmediateAST tmp__65 ; 
        CommonToken tmp__64 ; 
        tmp__64 = ( CommonToken ) _localctx.local__2_atom_case2 ; 
        tmp__65 = ( ImmediateAST ) _localctx.local__1_atom_case2.result ; 
        tmp__66 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__3_atom_case2.result ; 
        tmp__67 = (ImmediateAST) mkApp( tmp__64, tmp__65, tmp__66 ); 
        $result = tmp__67; 
      } 
    | local__1_atom_case3='[' local__2_atom_case3=gen__closelist__L44__expr ']' { 
        ImmediateAST tmp__70 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__69 ; 
        CommonToken tmp__68 ; 
        tmp__68 = ( CommonToken ) _localctx.local__1_atom_case3 ; 
        tmp__69 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case3.result ; 
        tmp__70 = (ImmediateAST) mkList( tmp__68, tmp__69 ); 
        $result = tmp__70; 
      } 
    | local__1_atom_case4='(' local__2_atom_case4=gen__closelist__L44__expr local__3_atom_case4=trailer ')' { 
        ImmediateAST tmp__74 ; 
        bool tmp__73 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__72 ; 
        CommonToken tmp__71 ; 
        tmp__71 = ( CommonToken ) _localctx.local__1_atom_case4 ; 
        tmp__72 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case4.result ; 
        tmp__73 = ( bool ) _localctx.local__3_atom_case4.result ; 
        tmp__74 = (ImmediateAST) mkTuple( tmp__71, tmp__72, tmp__73 ); 
        $result = tmp__74; 
      } 
    | local__1_atom_case5='{' local__2_atom_case5=gen__closelist__L44__pair trailer '}' { 
        ImmediateAST tmp__77 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__76 ; 
        CommonToken tmp__75 ; 
        tmp__75 = ( CommonToken ) _localctx.local__1_atom_case5 ; 
        tmp__76 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case5.result ; 
        tmp__77 = (ImmediateAST) mkDict( tmp__75, tmp__76 ); 
        $result = tmp__77; 
      } 
    | local__1_atom_case6=STR_4 { 
        ImmediateAST tmp__82 ; 
        DObj tmp__81 ; 
        string tmp__80 ; 
        CommonToken tmp__79 ; 
        CommonToken tmp__78 ; 
        tmp__78 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__79 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__80 = (string) unesc( tmp__79.Text ); 
        tmp__81 = (DObj) mkstr( tmp__80 ); 
        tmp__82 = (ImmediateAST) mkVal( tmp__78, tmp__81 ); 
        $result = tmp__82; 
      } 
    | local__1_atom_case7=INT_10 { 
        ImmediateAST tmp__87 ; 
        DObj tmp__86 ; 
        int tmp__85 ; 
        CommonToken tmp__84 ; 
        CommonToken tmp__83 ; 
        tmp__83 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__84 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__85 = 0 ; 
        tmp__86 = (DObj) mkint( tmp__84.Text, tmp__85 ); 
        tmp__87 = (ImmediateAST) mkVal( tmp__83, tmp__86 ); 
        $result = tmp__87; 
      } 
    | local__1_atom_case8=HEX_7 { 
        ImmediateAST tmp__92 ; 
        DObj tmp__91 ; 
        int tmp__90 ; 
        CommonToken tmp__89 ; 
        CommonToken tmp__88 ; 
        tmp__88 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__89 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__90 = 16 ; 
        tmp__91 = (DObj) mkint( tmp__89.Text, tmp__90 ); 
        tmp__92 = (ImmediateAST) mkVal( tmp__88, tmp__91 ); 
        $result = tmp__92; 
      } 
    | local__1_atom_case9=OCT_8 { 
        ImmediateAST tmp__97 ; 
        DObj tmp__96 ; 
        int tmp__95 ; 
        CommonToken tmp__94 ; 
        CommonToken tmp__93 ; 
        tmp__93 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__94 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__95 = 8 ; 
        tmp__96 = (DObj) mkint( tmp__94.Text, tmp__95 ); 
        tmp__97 = (ImmediateAST) mkVal( tmp__93, tmp__96 ); 
        $result = tmp__97; 
      } 
    | local__1_atom_case10=BIN_9 { 
        ImmediateAST tmp__102 ; 
        DObj tmp__101 ; 
        int tmp__100 ; 
        CommonToken tmp__99 ; 
        CommonToken tmp__98 ; 
        tmp__98 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__99 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__100 = 2 ; 
        tmp__101 = (DObj) mkint( tmp__99.Text, tmp__100 ); 
        tmp__102 = (ImmediateAST) mkVal( tmp__98, tmp__101 ); 
        $result = tmp__102; 
      } 
    | local__1_atom_case11=FLOAT_11 { 
        ImmediateAST tmp__106 ; 
        DObj tmp__105 ; 
        CommonToken tmp__104 ; 
        CommonToken tmp__103 ; 
        tmp__103 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__104 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__105 = (DObj) mkfloat( tmp__104.Text ); 
        tmp__106 = (ImmediateAST) mkVal( tmp__103, tmp__105 ); 
        $result = tmp__106; 
      } 
    | local__1_atom_case12='None' { 
        ImmediateAST tmp__109 ; 
        DObj tmp__108 ; 
        CommonToken tmp__107 ; 
        tmp__107 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__108 = (DObj) mknone(  ); 
        tmp__109 = (ImmediateAST) mkVal( tmp__107, tmp__108 ); 
        $result = tmp__109; 
      } 
    | local__1_atom_case13=NAME_13 { 
        ImmediateAST tmp__112 ; 
        CommonToken tmp__111 ; 
        CommonToken tmp__110 ; 
        tmp__110 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__111 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__112 = (ImmediateAST) mkVar( tmp__110, tmp__111.Text ); 
        $result = tmp__112; 
      } 
    | local__1_atom_case14='-' local__2_atom_case14=atom { 
        ImmediateAST tmp__115 ; 
        ImmediateAST tmp__114 ; 
        CommonToken tmp__113 ; 
        tmp__113 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__114 = ( ImmediateAST ) _localctx.local__2_atom_case14.result ; 
        tmp__115 = (ImmediateAST) mkNeg( tmp__113, tmp__114 ); 
        $result = tmp__115; 
      } 
    | local__1_atom_case15='~' local__2_atom_case15=atom { 
        ImmediateAST tmp__118 ; 
        ImmediateAST tmp__117 ; 
        CommonToken tmp__116 ; 
        tmp__116 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__117 = ( ImmediateAST ) _localctx.local__2_atom_case15.result ; 
        tmp__118 = (ImmediateAST) mkInv( tmp__116, tmp__117 ); 
        $result = tmp__118; 
      } 
    | local__1_atom_case16='if' local__2_atom_case16=expr local__3_atom_case16=then local__4_atom_case16=block 'end' { 
        ImmediateAST tmp__124 ; 
        ImmediateAST tmp__123 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__122 ; 
        CommonToken tmp__121 ; 
        ImmediateAST tmp__120 ; 
        CommonToken tmp__119 ; 
        tmp__119 = ( CommonToken ) _localctx.local__1_atom_case16 ; 
        tmp__120 = ( ImmediateAST ) _localctx.local__2_atom_case16.result ; 
        tmp__121 = ( CommonToken ) _localctx.local__3_atom_case16.result ; 
        tmp__122 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case16.result ; 
        tmp__123 = (ImmediateAST) mkBlock( tmp__121, tmp__122 ); 
        tmp__124 = (ImmediateAST) mkIfThen( tmp__119, tmp__120, tmp__123 ); 
        $result = tmp__124; 
      } 
    | local__1_atom_case17='if' local__2_atom_case17=expr local__3_atom_case17=then local__4_atom_case17=block local__5_atom_case17=gen__nullable_gen__list_gen__snd_elif__elifBlock local__6_atom_case17=gen__optional_gen__blockOf_else 'end' { 
        ImmediateAST tmp__136 ; 
        ImmediateAST tmp__135 ; 
        CommonToken tmp__134 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__132 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__133 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__130 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__131 ; 
        ImmediateAST tmp__129 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__128 ; 
        CommonToken tmp__127 ; 
        ImmediateAST tmp__126 ; 
        (ImmediateAST, ImmediateAST) elif__125 ; 
        tmp__126 = ( ImmediateAST ) _localctx.local__2_atom_case17.result ; 
        tmp__127 = ( CommonToken ) _localctx.local__3_atom_case17.result ; 
        tmp__128 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case17.result ; 
        tmp__129 = (ImmediateAST) mkBlock( tmp__127, tmp__128 ); 
        elif__125 = ( tmp__126 , tmp__129 ); 
        tmp__131 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        elifs__130 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__131, elif__125 ); 
        tmp__133 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__5_atom_case17.result ; 
        elifs__132 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) extend<(ImmediateAST, ImmediateAST)>( elifs__130, tmp__133 ); 
        tmp__134 = ( CommonToken ) _localctx.local__1_atom_case17 ; 
        tmp__135 = ( ImmediateAST ) _localctx.local__6_atom_case17.result ; 
        tmp__136 = (ImmediateAST) mkNestedIf( tmp__134, elifs__130, tmp__135 ); 
        $result = tmp__136; 
      } 
    | local__1_atom_case18='fun' local__2_atom_case18=name '(' local__4_atom_case18=gen__nullable_gen__seplist__L44__name ')' local__6_atom_case18=block 'end' { 
        ImmediateAST tmp__141 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__140 ; 
        System.Collections.Generic.List<string> tmp__139 ; 
        string tmp__138 ; 
        CommonToken tmp__137 ; 
        tmp__137 = ( CommonToken ) _localctx.local__1_atom_case18 ; 
        tmp__138 = ( string ) _localctx.local__2_atom_case18.result ; 
        tmp__139 = ( System.Collections.Generic.List<string> ) _localctx.local__4_atom_case18.result ; 
        tmp__140 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__6_atom_case18.result ; 
        tmp__141 = (ImmediateAST) mkFunc( tmp__137, tmp__138, tmp__139, tmp__140 ); 
        $result = tmp__141; 
      } 
    | local__1_atom_case19='fun' '(' local__3_atom_case19=gen__nullable_gen__seplist__L44__name ')' local__5_atom_case19=block 'end' { 
        ImmediateAST tmp__146 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__145 ; 
        System.Collections.Generic.List<string> tmp__144 ; 
        string tmp__143 ; 
        CommonToken tmp__142 ; 
        tmp__142 = ( CommonToken ) _localctx.local__1_atom_case19 ; 
        tmp__143 = "" ; 
        tmp__144 = ( System.Collections.Generic.List<string> ) _localctx.local__3_atom_case19.result ; 
        tmp__145 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__5_atom_case19.result ; 
        tmp__146 = (ImmediateAST) mkFunc( tmp__142, tmp__143, tmp__144, tmp__145 ); 
        $result = tmp__146; 
      } 
    | local__1_atom_case20='(' local__2_atom_case20=gen__nullable_gen__seplist__L44__name ')' '->' local__5_atom_case20=gen__line_wrap_expr { 
        ImmediateAST tmp__152 ; 
        ImmediateAST tmp__151 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__150 ; 
        System.Collections.Generic.List<string> tmp__149 ; 
        string tmp__148 ; 
        CommonToken tmp__147 ; 
        tmp__147 = ( CommonToken ) _localctx.local__1_atom_case20 ; 
        tmp__148 = "" ; 
        tmp__149 = ( System.Collections.Generic.List<string> ) _localctx.local__2_atom_case20.result ; 
        tmp__151 = ( ImmediateAST ) _localctx.local__5_atom_case20.result ; 
        tmp__150 = new System.Collections.Generic.List<ImmediateAST> { tmp__151 }; 
        tmp__152 = (ImmediateAST) mkFunc( tmp__147, tmp__148, tmp__149, tmp__150 ); 
        $result = tmp__152; 
      } 
    | local__1_atom_case21=NAME_13 '->' local__3_atom_case21=gen__line_wrap_expr { 
        ImmediateAST tmp__159 ; 
        ImmediateAST tmp__158 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__157 ; 
        CommonToken tmp__156 ; 
        System.Collections.Generic.List<string> tmp__155 ; 
        string tmp__154 ; 
        CommonToken tmp__153 ; 
        tmp__153 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__154 = "" ; 
        tmp__156 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__155 = new System.Collections.Generic.List<string> { tmp__156.Text }; 
        tmp__158 = ( ImmediateAST ) _localctx.local__3_atom_case21.result ; 
        tmp__157 = new System.Collections.Generic.List<ImmediateAST> { tmp__158 }; 
        tmp__159 = (ImmediateAST) mkFunc( tmp__153, tmp__154, tmp__155, tmp__157 ); 
        $result = tmp__159; 
      } 
; 
gen__line_wrap_expr returns [ImmediateAST result] :
      gen__optional_NEWLINE local__2_gen__line_wrap_expr_case0=expr gen__optional_NEWLINE { 
        ImmediateAST tmp__160 ; 
        tmp__160 = ( ImmediateAST ) _localctx.local__2_gen__line_wrap_expr_case0.result ; 
        $result = tmp__160; 
      } 
; 
gen__optional_NEWLINE returns [CommonToken result] :
      { 
        $result = null; 
      } 
    | local__1_gen__optional_NEWLINE_case1=NEWLINE_17 { 
        CommonToken tmp__161 ; 
        tmp__161 = ( CommonToken ) _localctx.local__1_gen__optional_NEWLINE_case1 ; 
        $result = tmp__161; 
      } 
; 
gen__nullable_gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      { 
        System.Collections.Generic.List<string> tmp__162 ; 
        tmp__162 = (System.Collections.Generic.List<string>) empty<string>(  ); 
        $result = tmp__162; 
      } 
    | local__1_gen__nullable_gen__seplist__L44__name_case1=gen__seplist__L44__name { 
        System.Collections.Generic.List<string> tmp__163 ; 
        tmp__163 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__nullable_gen__seplist__L44__name_case1.result ; 
        $result = tmp__163; 
      } 
; 
gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__seplist__L44__name_case0=name { 
        string tmp__165 ; 
        System.Collections.Generic.List<string> tmp__164 ; 
        tmp__165 = ( string ) _localctx.local__1_gen__seplist__L44__name_case0.result ; 
        tmp__164 = new System.Collections.Generic.List<string> { tmp__165 }; 
        $result = tmp__164; 
      } 
    | local__1_gen__seplist__L44__name_case1=gen__seplist__L44__name ',' local__3_gen__seplist__L44__name_case1=name { 
        System.Collections.Generic.List<string> tmp__168 ; 
        string tmp__167 ; 
        System.Collections.Generic.List<string> tmp__166 ; 
        tmp__166 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__seplist__L44__name_case1.result ; 
        tmp__167 = ( string ) _localctx.local__3_gen__seplist__L44__name_case1.result ; 
        tmp__168 = (System.Collections.Generic.List<string>) append<string>( tmp__166, tmp__167 ); 
        $result = tmp__168; 
      } 
; 
gen__optional_gen__blockOf_else returns [ImmediateAST result] :
      { 
        $result = null; 
      } 
    | local__1_gen__optional_gen__blockOf_else_case1=gen__blockOf_else { 
        ImmediateAST tmp__169 ; 
        tmp__169 = ( ImmediateAST ) _localctx.local__1_gen__optional_gen__blockOf_else_case1.result ; 
        $result = tmp__169; 
      } 
; 
gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__blockOf_else_case0='else' local__2_gen__blockOf_else_case0=block { 
        ImmediateAST tmp__172 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__171 ; 
        CommonToken tmp__170 ; 
        tmp__170 = ( CommonToken ) _localctx.local__1_gen__blockOf_else_case0 ; 
        tmp__171 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_else_case0.result ; 
        tmp__172 = (ImmediateAST) mkBlock( tmp__170, tmp__171 ); 
        $result = tmp__172; 
      } 
; 
gen__nullable_gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__173 ; 
        tmp__173 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__173; 
      } 
    | local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__174 ; 
        tmp__174 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        $result = tmp__174; 
      } 
; 
gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__list_gen__snd_elif__elifBlock_case0=gen__snd_elif__elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__176 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__175 ; 
        tmp__176 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        tmp__175 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__176 }; 
        $result = tmp__175; 
      } 
    | local__1_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock local__2_gen__list_gen__snd_elif__elifBlock_case1=gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__179 ; 
        (ImmediateAST, ImmediateAST) tmp__178 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__177 ; 
        tmp__177 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__178 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__179 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__177, tmp__178 ); 
        $result = tmp__179; 
      } 
; 
gen__snd_elif__elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      'elif' local__2_gen__snd_elif__elifBlock_case0=elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__180 ; 
        tmp__180 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__180; 
      } 
; 
gen__closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      gen__optional_NEWLINE local__2_gen__closelist__L44__pair_case0=gen___closelist__L44__pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__181 ; 
        tmp__181 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_gen__closelist__L44__pair_case0.result ; 
        $result = tmp__181; 
      } 
; 
gen___closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen___closelist__L44__pair_case0=gen___closelist__L44__pair NEWLINE_17 { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__182 ; 
        tmp__182 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case0.result ; 
        $result = tmp__182; 
      } 
    | local__1_gen___closelist__L44__pair_case1=gen___closelist__L44__pair ',' NEWLINE_17 local__4_gen___closelist__L44__pair_case1=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__185 ; 
        (ImmediateAST, ImmediateAST) tmp__184 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__183 ; 
        tmp__183 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case1.result ; 
        tmp__184 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__4_gen___closelist__L44__pair_case1.result ; 
        tmp__185 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__183, tmp__184 ); 
        $result = tmp__185; 
      } 
    | local__1_gen___closelist__L44__pair_case2=gen___closelist__L44__pair ',' local__3_gen___closelist__L44__pair_case2=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__188 ; 
        (ImmediateAST, ImmediateAST) tmp__187 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__186 ; 
        tmp__186 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case2.result ; 
        tmp__187 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__3_gen___closelist__L44__pair_case2.result ; 
        tmp__188 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__186, tmp__187 ); 
        $result = tmp__188; 
      } 
    | local__1_gen___closelist__L44__pair_case3=pair { 
        (ImmediateAST, ImmediateAST) tmp__190 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__189 ; 
        tmp__190 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen___closelist__L44__pair_case3.result ; 
        tmp__189 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__190 }; 
        $result = tmp__189; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__191 ; 
        tmp__191 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { }; 
        $result = tmp__191; 
      } 
; 
gen__closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_NEWLINE local__2_gen__closelist__L44__expr_case0=gen___closelist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__192 ; 
        tmp__192 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__closelist__L44__expr_case0.result ; 
        $result = tmp__192; 
      } 
; 
gen___closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen___closelist__L44__expr_case0=gen___closelist__L44__expr NEWLINE_17 { 
        System.Collections.Generic.List<ImmediateAST> tmp__193 ; 
        tmp__193 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case0.result ; 
        $result = tmp__193; 
      } 
    | local__1_gen___closelist__L44__expr_case1=gen___closelist__L44__expr ',' NEWLINE_17 local__4_gen___closelist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__196 ; 
        ImmediateAST tmp__195 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__194 ; 
        tmp__194 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case1.result ; 
        tmp__195 = ( ImmediateAST ) _localctx.local__4_gen___closelist__L44__expr_case1.result ; 
        tmp__196 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__194, tmp__195 ); 
        $result = tmp__196; 
      } 
    | local__1_gen___closelist__L44__expr_case2=gen___closelist__L44__expr ',' local__3_gen___closelist__L44__expr_case2=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__199 ; 
        ImmediateAST tmp__198 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__197 ; 
        tmp__197 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case2.result ; 
        tmp__198 = ( ImmediateAST ) _localctx.local__3_gen___closelist__L44__expr_case2.result ; 
        tmp__199 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__197, tmp__198 ); 
        $result = tmp__199; 
      } 
    | local__1_gen___closelist__L44__expr_case3=expr { 
        ImmediateAST tmp__201 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__200 ; 
        tmp__201 = ( ImmediateAST ) _localctx.local__1_gen___closelist__L44__expr_case3.result ; 
        tmp__200 = new System.Collections.Generic.List<ImmediateAST> { tmp__201 }; 
        $result = tmp__200; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__202 ; 
        tmp__202 = new System.Collections.Generic.List<ImmediateAST> { }; 
        $result = tmp__202; 
      } 
; 
pair returns [(ImmediateAST, ImmediateAST) result] :
      local__1_pair_case0=expr gen__line_wrap__L58 local__3_pair_case0=expr { 
        ImmediateAST tmp__205 ; 
        ImmediateAST tmp__204 ; 
        (ImmediateAST, ImmediateAST) tmp__203 ; 
        tmp__204 = ( ImmediateAST ) _localctx.local__1_pair_case0.result ; 
        tmp__205 = ( ImmediateAST ) _localctx.local__3_pair_case0.result ; 
        tmp__203 = ( tmp__204 , tmp__205 ); 
        $result = tmp__203; 
      } 
; 
gen__line_wrap__L58 returns [CommonToken result] :
      gen__optional_NEWLINE local__2_gen__line_wrap__L58_case0=':' gen__optional_NEWLINE { 
        CommonToken tmp__206 ; 
        tmp__206 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L58_case0 ; 
        $result = tmp__206; 
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
        ImmediateAST tmp__208 ; 
        System.Collections.Generic.List<object> tmp__207 ; 
        tmp__207 = ( System.Collections.Generic.List<object> ) _localctx.local__1_bin_case0.result ; 
        tmp__208 = (ImmediateAST) resolve_binop( tmp__207 ); 
        $result = tmp__208; 
      } 
; 
binseq returns [System.Collections.Generic.List<object> result] :
      local__1_binseq_case0=atom { 
        System.Collections.Generic.List<object> tmp__212 ; 
        object tmp__211 ; 
        ImmediateAST tmp__210 ; 
        System.Collections.Generic.List<object> tmp__209 ; 
        tmp__209 = (System.Collections.Generic.List<object>) empty<object>(  ); 
        tmp__210 = ( ImmediateAST ) _localctx.local__1_binseq_case0.result ; 
        tmp__211 = (object) to_obj<ImmediateAST>( tmp__210 ); 
        tmp__212 = (System.Collections.Generic.List<object>) append<object>( tmp__209, tmp__211 ); 
        $result = tmp__212; 
      } 
    | local__1_binseq_case1=binseq local__2_binseq_case1=binop local__3_binseq_case1=atom { 
        object tmp__218 ; 
        ImmediateAST tmp__217 ; 
        System.Collections.Generic.List<object> tmp__216 ; 
        System.Collections.Generic.List<object> block__213 ; 
        object tmp__215 ; 
        System.Collections.Generic.List<object> tmp__214 ; 
        tmp__214 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__215 = ( object ) _localctx.local__2_binseq_case1.result ; 
        block__213 = (System.Collections.Generic.List<object>) append<object>( tmp__214, tmp__215 ); 
        tmp__216 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__217 = ( ImmediateAST ) _localctx.local__3_binseq_case1.result ; 
        tmp__218 = (object) to_obj<ImmediateAST>( tmp__217 ); 
        block__213 = (System.Collections.Generic.List<object>) append<object>( tmp__216, tmp__218 ); 
        $result = block__213; 
      } 
; 
binop returns [object result] :
      local__1_binop_case0=SINGLE_BINOP_2 { 
        object tmp__221 ; 
        CommonToken tmp__220 ; 
        CommonToken tmp__219 ; 
        tmp__219 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__220 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__221 = (object) mkop( tmp__219, tmp__220.Text ); 
        $result = tmp__221; 
      } 
    | local__1_binop_case1='not' 'in' { 
        object tmp__224 ; 
        string tmp__223 ; 
        CommonToken tmp__222 ; 
        tmp__222 = ( CommonToken ) _localctx.local__1_binop_case1 ; 
        tmp__223 = "notin" ; 
        tmp__224 = (object) mkop( tmp__222, tmp__223 ); 
        $result = tmp__224; 
      } 
    | local__1_binop_case2='in' { 
        object tmp__227 ; 
        string tmp__226 ; 
        CommonToken tmp__225 ; 
        tmp__225 = ( CommonToken ) _localctx.local__1_binop_case2 ; 
        tmp__226 = "in" ; 
        tmp__227 = (object) mkop( tmp__225, tmp__226 ); 
        $result = tmp__227; 
      } 
    | local__1_binop_case3='-' { 
        object tmp__230 ; 
        string tmp__229 ; 
        CommonToken tmp__228 ; 
        tmp__228 = ( CommonToken ) _localctx.local__1_binop_case3 ; 
        tmp__229 = "-" ; 
        tmp__230 = (object) mkop( tmp__228, tmp__229 ); 
        $result = tmp__230; 
      } 
; 
not returns [ImmediateAST result] :
      local__1_not_case0='not' local__2_not_case0=bin { 
        ImmediateAST tmp__233 ; 
        ImmediateAST tmp__232 ; 
        CommonToken tmp__231 ; 
        tmp__231 = ( CommonToken ) _localctx.local__1_not_case0 ; 
        tmp__232 = ( ImmediateAST ) _localctx.local__2_not_case0.result ; 
        tmp__233 = (ImmediateAST) mkNot( tmp__231, tmp__232 ); 
        $result = tmp__233; 
      } 
    | local__1_not_case1=bin { 
        ImmediateAST tmp__234 ; 
        tmp__234 = ( ImmediateAST ) _localctx.local__1_not_case1.result ; 
        $result = tmp__234; 
      } 
; 
and_expr returns [ImmediateAST result] :
      local__1_and_expr_case0=and_expr local__2_and_expr_case0='and' local__3_and_expr_case0=not { 
        ImmediateAST tmp__238 ; 
        ImmediateAST tmp__237 ; 
        ImmediateAST tmp__236 ; 
        CommonToken tmp__235 ; 
        tmp__235 = ( CommonToken ) _localctx.local__2_and_expr_case0 ; 
        tmp__236 = ( ImmediateAST ) _localctx.local__1_and_expr_case0.result ; 
        tmp__237 = ( ImmediateAST ) _localctx.local__3_and_expr_case0.result ; 
        tmp__238 = (ImmediateAST) mkAnd( tmp__235, tmp__236, tmp__237 ); 
        $result = tmp__238; 
      } 
    | local__1_and_expr_case1=not { 
        ImmediateAST tmp__239 ; 
        tmp__239 = ( ImmediateAST ) _localctx.local__1_and_expr_case1.result ; 
        $result = tmp__239; 
      } 
; 
or_expr returns [ImmediateAST result] :
      local__1_or_expr_case0=or_expr local__2_or_expr_case0='or' local__3_or_expr_case0=and_expr { 
        ImmediateAST tmp__243 ; 
        ImmediateAST tmp__242 ; 
        ImmediateAST tmp__241 ; 
        CommonToken tmp__240 ; 
        tmp__240 = ( CommonToken ) _localctx.local__2_or_expr_case0 ; 
        tmp__241 = ( ImmediateAST ) _localctx.local__1_or_expr_case0.result ; 
        tmp__242 = ( ImmediateAST ) _localctx.local__3_or_expr_case0.result ; 
        tmp__243 = (ImmediateAST) mkAnd( tmp__240, tmp__241, tmp__242 ); 
        $result = tmp__243; 
      } 
    | local__1_or_expr_case1=and_expr { 
        ImmediateAST tmp__244 ; 
        tmp__244 = ( ImmediateAST ) _localctx.local__1_or_expr_case1.result ; 
        $result = tmp__244; 
      } 
; 
expr returns [ImmediateAST result] :
      local__1_expr_case0=gen__seplist_gen__line_wrap__L124_L62__or_expr { 
        ImmediateAST tmp__246 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__245 ; 
        tmp__245 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_expr_case0.result ; 
        tmp__246 = (ImmediateAST) mkPipeline( tmp__245 ); 
        $result = tmp__246; 
      } 
; 
gen__seplist_gen__line_wrap__L124_L62__or_expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case0=or_expr { 
        ImmediateAST tmp__248 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__247 ; 
        tmp__248 = ( ImmediateAST ) _localctx.local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case0.result ; 
        tmp__247 = new System.Collections.Generic.List<ImmediateAST> { tmp__248 }; 
        $result = tmp__247; 
      } 
    | local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1=gen__seplist_gen__line_wrap__L124_L62__or_expr gen__line_wrap__L124_L62 local__3_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1=or_expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__251 ; 
        ImmediateAST tmp__250 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__249 ; 
        tmp__249 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1.result ; 
        tmp__250 = ( ImmediateAST ) _localctx.local__3_gen__seplist_gen__line_wrap__L124_L62__or_expr_case1.result ; 
        tmp__251 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__249, tmp__250 ); 
        $result = tmp__251; 
      } 
; 
gen__line_wrap__L124_L62 returns [CommonToken result] :
      gen__optional_NEWLINE local__2_gen__line_wrap__L124_L62_case0='|>' gen__optional_NEWLINE { 
        CommonToken tmp__252 ; 
        tmp__252 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L124_L62_case0 ; 
        $result = tmp__252; 
      } 
; 
block returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_block_case0=gen__filter_stmt__NEWLINE { 
        System.Collections.Generic.List<ImmediateAST> tmp__253 ; 
        tmp__253 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_block_case0.result ; 
        $result = tmp__253; 
      } 
; 
gen__filter_stmt__NEWLINE returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__filter_stmt__NEWLINE_case0=gen__filter_stmt__NEWLINE local__2_gen__filter_stmt__NEWLINE_case0=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__256 ; 
        ImmediateAST tmp__255 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__254 ; 
        tmp__254 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__NEWLINE_case0.result ; 
        tmp__255 = ( ImmediateAST ) _localctx.local__2_gen__filter_stmt__NEWLINE_case0.result ; 
        tmp__256 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__254, tmp__255 ); 
        $result = tmp__256; 
      } 
    | local__1_gen__filter_stmt__NEWLINE_case1=gen__filter_stmt__NEWLINE NEWLINE_17 { 
        System.Collections.Generic.List<ImmediateAST> tmp__257 ; 
        tmp__257 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__NEWLINE_case1.result ; 
        $result = tmp__257; 
      } 
    | local__1_gen__filter_stmt__NEWLINE_case2=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__260 ; 
        ImmediateAST tmp__259 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__258 ; 
        tmp__258 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__259 = ( ImmediateAST ) _localctx.local__1_gen__filter_stmt__NEWLINE_case2.result ; 
        tmp__260 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__258, tmp__259 ); 
        $result = tmp__260; 
      } 
    | NEWLINE_17 { 
        System.Collections.Generic.List<ImmediateAST> tmp__261 ; 
        tmp__261 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
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
      gen__optional_NEWLINE local__2_do_case0='do' { 
        CommonToken tmp__276 ; 
        tmp__276 = ( CommonToken ) _localctx.local__2_do_case0 ; 
        $result = tmp__276; 
      } 
; 
then returns [CommonToken result] :
      gen__optional_NEWLINE local__2_then_case0='then' { 
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
      { 
        System.Collections.Generic.List<ImmediateAST> tmp__288 ; 
        tmp__288 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__288; 
      } 
    | local__1_lhs_seq_case1=lhs_seq local__2_lhs_seq_case1=lhs '=' { 
        System.Collections.Generic.List<ImmediateAST> tmp__291 ; 
        ImmediateAST tmp__290 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__289 ; 
        tmp__289 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_lhs_seq_case1.result ; 
        tmp__290 = ( ImmediateAST ) _localctx.local__2_lhs_seq_case1.result ; 
        tmp__291 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__289, tmp__290 ); 
        $result = tmp__291; 
      } 
; 
start returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_NEWLINE local__2_start_case0=gen__nullable_gen__seplist_NEWLINE__stmt gen__optional_NEWLINE EOF { 
        System.Collections.Generic.List<ImmediateAST> tmp__292 ; 
        tmp__292 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_start_case0.result ; 
        $result = tmp__292; 
      } 
; 
gen__nullable_gen__seplist_NEWLINE__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      { 
        System.Collections.Generic.List<ImmediateAST> tmp__293 ; 
        tmp__293 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__293; 
      } 
    | local__1_gen__nullable_gen__seplist_NEWLINE__stmt_case1=gen__seplist_NEWLINE__stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__294 ; 
        tmp__294 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist_NEWLINE__stmt_case1.result ; 
        $result = tmp__294; 
      } 
; 
gen__seplist_NEWLINE__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_NEWLINE__stmt_case0=stmt { 
        ImmediateAST tmp__296 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__295 ; 
        tmp__296 = ( ImmediateAST ) _localctx.local__1_gen__seplist_NEWLINE__stmt_case0.result ; 
        tmp__295 = new System.Collections.Generic.List<ImmediateAST> { tmp__296 }; 
        $result = tmp__295; 
      } 
    | local__1_gen__seplist_NEWLINE__stmt_case1=gen__seplist_NEWLINE__stmt NEWLINE_17 local__3_gen__seplist_NEWLINE__stmt_case1=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__299 ; 
        ImmediateAST tmp__298 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__297 ; 
        tmp__297 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_NEWLINE__stmt_case1.result ; 
        tmp__298 = ( ImmediateAST ) _localctx.local__3_gen__seplist_NEWLINE__stmt_case1.result ; 
        tmp__299 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__297, tmp__298 ); 
        $result = tmp__299; 
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


