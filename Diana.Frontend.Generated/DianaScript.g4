grammar DianaScript;
options { language = CSharp; }
pipe returns [ImmediateAST result] :
      gen__line_wrap__L124_L62 local__2_pipe_case0=or_expr { 
        ImmediateAST tmp__1 ; 
        tmp__1 = ( ImmediateAST ) _localctx.local__2_pipe_case0.result ; 
        $result = tmp__1; 
      } 
; 
gen__line_wrap__L124_L62 returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap__L124_L62_case0='|>' gen__optional_newline { 
        CommonToken tmp__2 ; 
        tmp__2 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L124_L62_case0 ; 
        $result = tmp__2; 
      } 
; 
gen__optional_newline returns [CommonToken result] :
      local__1_gen__optional_newline_case0=newline { 
        CommonToken tmp__3 ; 
        tmp__3 = ( CommonToken ) _localctx.local__1_gen__optional_newline_case0.result ; 
        $result = tmp__3; 
      } 
    | { 
        $result = null; 
      } 
; 
expr returns [ImmediateAST result] :
      '__META' local__2_expr_case0=INT_10 ':' local__4_expr_case0=INT_10 ':' local__6_expr_case0=INT_10 'in' local__8_expr_case0=expr { 
        ImmediateAST tmp__8 ; 
        ImmediateAST tmp__7 ; 
        CommonToken tmp__6 ; 
        CommonToken tmp__5 ; 
        CommonToken tmp__4 ; 
        tmp__4 = ( CommonToken ) _localctx.local__2_expr_case0 ; 
        tmp__5 = ( CommonToken ) _localctx.local__4_expr_case0 ; 
        tmp__6 = ( CommonToken ) _localctx.local__6_expr_case0 ; 
        tmp__7 = ( ImmediateAST ) _localctx.local__8_expr_case0.result ; 
        tmp__8 = (ImmediateAST) mkMeta( tmp__4.Text, tmp__5.Text, tmp__6.Text, tmp__7 ); 
        $result = tmp__8; 
      } 
    | local__1_expr_case1=or_expr local__2_expr_case1=gen__list_pipe { 
        ImmediateAST tmp__11 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__10 ; 
        ImmediateAST tmp__9 ; 
        tmp__9 = ( ImmediateAST ) _localctx.local__1_expr_case1.result ; 
        tmp__10 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_expr_case1.result ; 
        tmp__11 = (ImmediateAST) mkPipeline( tmp__9, tmp__10 ); 
        $result = tmp__11; 
      } 
    | local__1_expr_case2=NAME_13 '{' local__3_expr_case2=gen__filter_option__gen__or___L59__newline '}' { 
        ImmediateAST tmp__18 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__17 ; 
        ImmediateAST tmp__16 ; 
        CommonToken tmp__15 ; 
        CommonToken tmp__14 ; 
        string tmp__13 ; 
        CommonToken tmp__12 ; 
        tmp__12 = ( CommonToken ) _localctx.local__1_expr_case2 ; 
        tmp__13 = "" ; 
        tmp__14 = ( CommonToken ) _localctx.local__1_expr_case2 ; 
        tmp__15 = ( CommonToken ) _localctx.local__1_expr_case2 ; 
        tmp__16 = (ImmediateAST) mkVar( tmp__14, tmp__15.Text ); 
        tmp__17 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__3_expr_case2.result ; 
        tmp__18 = (ImmediateAST) mkWorkflow( tmp__12, tmp__13, tmp__16, tmp__17 ); 
        $result = tmp__18; 
      } 
    | local__1_expr_case3=NAME_13 'as' local__3_expr_case3=NAME_13 '{' local__5_expr_case3=gen__filter_option__gen__or___L59__newline '}' { 
        ImmediateAST tmp__25 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__24 ; 
        ImmediateAST tmp__23 ; 
        CommonToken tmp__22 ; 
        CommonToken tmp__21 ; 
        CommonToken tmp__20 ; 
        CommonToken tmp__19 ; 
        tmp__19 = ( CommonToken ) _localctx.local__1_expr_case3 ; 
        tmp__20 = ( CommonToken ) _localctx.local__3_expr_case3 ; 
        tmp__21 = ( CommonToken ) _localctx.local__1_expr_case3 ; 
        tmp__22 = ( CommonToken ) _localctx.local__1_expr_case3 ; 
        tmp__23 = (ImmediateAST) mkVar( tmp__21, tmp__22.Text ); 
        tmp__24 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__5_expr_case3.result ; 
        tmp__25 = (ImmediateAST) mkWorkflow( tmp__19, tmp__20.Text, tmp__23, tmp__24 ); 
        $result = tmp__25; 
      } 
    | local__1_expr_case4=or_expr { 
        ImmediateAST tmp__26 ; 
        tmp__26 = ( ImmediateAST ) _localctx.local__1_expr_case4.result ; 
        $result = tmp__26; 
      } 
; 
gen__filter_option__gen__or___L59__newline returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__filter_option__gen__or___L59__newline_case0=gen__filter_option__gen__or___L59__newline local__2_gen__filter_option__gen__or___L59__newline_case0=option { 
        System.Collections.Generic.List<ImmediateAST> tmp__29 ; 
        ImmediateAST tmp__28 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__27 ; 
        tmp__27 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_option__gen__or___L59__newline_case0.result ; 
        tmp__28 = ( ImmediateAST ) _localctx.local__2_gen__filter_option__gen__or___L59__newline_case0.result ; 
        tmp__29 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__27, tmp__28 ); 
        $result = tmp__29; 
      } 
    | local__1_gen__filter_option__gen__or___L59__newline_case1=gen__filter_option__gen__or___L59__newline gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__30 ; 
        tmp__30 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_option__gen__or___L59__newline_case1.result ; 
        $result = tmp__30; 
      } 
    | local__1_gen__filter_option__gen__or___L59__newline_case2=option { 
        System.Collections.Generic.List<ImmediateAST> tmp__33 ; 
        ImmediateAST tmp__32 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__31 ; 
        tmp__31 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__32 = ( ImmediateAST ) _localctx.local__1_gen__filter_option__gen__or___L59__newline_case2.result ; 
        tmp__33 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__31, tmp__32 ); 
        $result = tmp__33; 
      } 
    | gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__34 ; 
        tmp__34 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__34; 
      } 
; 
gen__or___L59__newline returns [int result] :
      ';' { 
        int tmp__35 ; 
        tmp__35 = 0 ; 
        $result = tmp__35; 
      } 
    | newline { 
        int tmp__36 ; 
        tmp__36 = 0 ; 
        $result = tmp__36; 
      } 
; 
gen__list_pipe returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__list_pipe_case0=pipe { 
        ImmediateAST tmp__38 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__37 ; 
        tmp__38 = ( ImmediateAST ) _localctx.local__1_gen__list_pipe_case0.result ; 
        tmp__37 = new System.Collections.Generic.List<ImmediateAST> { tmp__38 }; 
        $result = tmp__37; 
      } 
    | local__1_gen__list_pipe_case1=gen__list_pipe local__2_gen__list_pipe_case1=pipe { 
        System.Collections.Generic.List<ImmediateAST> tmp__41 ; 
        ImmediateAST tmp__40 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__39 ; 
        tmp__39 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__list_pipe_case1.result ; 
        tmp__40 = ( ImmediateAST ) _localctx.local__2_gen__list_pipe_case1.result ; 
        tmp__41 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__39, tmp__40 ); 
        $result = tmp__41; 
      } 
; 
option returns [ImmediateAST result] :
      local__1_option_case0=NAME_13 local__2_option_case0=gen__nullable_gen__seplist__L44__expr { 
        ImmediateAST tmp__45 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__44 ; 
        CommonToken tmp__43 ; 
        CommonToken tmp__42 ; 
        tmp__42 = ( CommonToken ) _localctx.local__1_option_case0 ; 
        tmp__43 = ( CommonToken ) _localctx.local__1_option_case0 ; 
        tmp__44 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_option_case0.result ; 
        tmp__45 = (ImmediateAST) mkOption( tmp__42, tmp__43.Text, tmp__44 ); 
        $result = tmp__45; 
      } 
; 
gen__nullable_gen__seplist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__nullable_gen__seplist__L44__expr_case0=gen__seplist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__46 ; 
        tmp__46 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist__L44__expr_case0.result ; 
        $result = tmp__46; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__47 ; 
        tmp__47 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
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
stmt returns [ImmediateAST result] :
      local__1_stmt_case0='raise' local__2_stmt_case0=expr { 
        ImmediateAST tmp__55 ; 
        ImmediateAST tmp__54 ; 
        CommonToken tmp__53 ; 
        tmp__53 = ( CommonToken ) _localctx.local__1_stmt_case0 ; 
        tmp__54 = ( ImmediateAST ) _localctx.local__2_stmt_case0.result ; 
        tmp__55 = (ImmediateAST) mkRaise( tmp__53, tmp__54 ); 
        $result = tmp__55; 
      } 
    | local__1_stmt_case1='__SETMETA' local__2_stmt_case1=INT_10 local__3_stmt_case1=STR_4 { 
        ImmediateAST tmp__59 ; 
        CommonToken tmp__58 ; 
        CommonToken tmp__57 ; 
        CommonToken tmp__56 ; 
        tmp__56 = ( CommonToken ) _localctx.local__1_stmt_case1 ; 
        tmp__57 = ( CommonToken ) _localctx.local__2_stmt_case1 ; 
        tmp__58 = ( CommonToken ) _localctx.local__3_stmt_case1 ; 
        tmp__59 = (ImmediateAST) mkSetMeta( tmp__56, tmp__57.Text, tmp__58.Text ); 
        $result = tmp__59; 
      } 
    | '__META' local__2_stmt_case2=INT_10 ':' local__4_stmt_case2=INT_10 ':' local__6_stmt_case2=INT_10 'do' local__8_stmt_case2=stmt { 
        ImmediateAST tmp__64 ; 
        ImmediateAST tmp__63 ; 
        CommonToken tmp__62 ; 
        CommonToken tmp__61 ; 
        CommonToken tmp__60 ; 
        tmp__60 = ( CommonToken ) _localctx.local__2_stmt_case2 ; 
        tmp__61 = ( CommonToken ) _localctx.local__4_stmt_case2 ; 
        tmp__62 = ( CommonToken ) _localctx.local__6_stmt_case2 ; 
        tmp__63 = ( ImmediateAST ) _localctx.local__8_stmt_case2.result ; 
        tmp__64 = (ImmediateAST) mkMeta( tmp__60.Text, tmp__61.Text, tmp__62.Text, tmp__63 ); 
        $result = tmp__64; 
      } 
    | local__1_stmt_case3=gen__line_wrap_begin local__2_stmt_case3=block gen__line_wrap_end { 
        ImmediateAST tmp__67 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__66 ; 
        CommonToken tmp__65 ; 
        tmp__65 = ( CommonToken ) _localctx.local__1_stmt_case3.result ; 
        tmp__66 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_stmt_case3.result ; 
        tmp__67 = (ImmediateAST) mkBlock( tmp__65, tmp__66 ); 
        $result = tmp__67; 
      } 
    | local__1_stmt_case4='var' local__2_stmt_case4=gen__seplist__L44__name { 
        ImmediateAST tmp__70 ; 
        System.Collections.Generic.List<string> tmp__69 ; 
        CommonToken tmp__68 ; 
        tmp__68 = ( CommonToken ) _localctx.local__1_stmt_case4 ; 
        tmp__69 = ( System.Collections.Generic.List<string> ) _localctx.local__2_stmt_case4.result ; 
        tmp__70 = (ImmediateAST) mkDecl( tmp__68, tmp__69 ); 
        $result = tmp__70; 
      } 
    | local__1_stmt_case5=lhs_seq local__2_stmt_case5=expr { 
        ImmediateAST tmp__73 ; 
        ImmediateAST tmp__72 ; 
        System.Collections.Generic.List<(ImmediateAST, string)> tmp__71 ; 
        tmp__71 = ( System.Collections.Generic.List<(ImmediateAST, string)> ) _localctx.local__1_stmt_case5.result ; 
        tmp__72 = ( ImmediateAST ) _localctx.local__2_stmt_case5.result ; 
        tmp__73 = (ImmediateAST) mkStoreMany( tmp__71, tmp__72 ); 
        $result = tmp__73; 
      } 
    | local__1_stmt_case6='loop' local__2_stmt_case6=block 'end' { 
        ImmediateAST tmp__78 ; 
        ImmediateAST tmp__77 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__76 ; 
        CommonToken tmp__75 ; 
        CommonToken tmp__74 ; 
        tmp__74 = ( CommonToken ) _localctx.local__1_stmt_case6 ; 
        tmp__75 = ( CommonToken ) _localctx.local__1_stmt_case6 ; 
        tmp__76 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_stmt_case6.result ; 
        tmp__77 = (ImmediateAST) mkBlock( tmp__75, tmp__76 ); 
        tmp__78 = (ImmediateAST) mkLoop( tmp__74, tmp__77 ); 
        $result = tmp__78; 
      } 
    | local__1_stmt_case7='while' local__2_stmt_case7=expr local__3_stmt_case7=gen__blockOf_do 'end' { 
        ImmediateAST tmp__82 ; 
        ImmediateAST tmp__81 ; 
        ImmediateAST tmp__80 ; 
        CommonToken tmp__79 ; 
        tmp__79 = ( CommonToken ) _localctx.local__1_stmt_case7 ; 
        tmp__80 = ( ImmediateAST ) _localctx.local__2_stmt_case7.result ; 
        tmp__81 = ( ImmediateAST ) _localctx.local__3_stmt_case7.result ; 
        tmp__82 = (ImmediateAST) mkWhile( tmp__79, tmp__80, tmp__81 ); 
        $result = tmp__82; 
      } 
    | local__1_stmt_case8='for' local__2_stmt_case8=NAME_13 'in' local__4_stmt_case8=expr local__5_stmt_case8=gen__blockOf_do 'end' { 
        ImmediateAST tmp__87 ; 
        ImmediateAST tmp__86 ; 
        ImmediateAST tmp__85 ; 
        CommonToken tmp__84 ; 
        CommonToken tmp__83 ; 
        tmp__83 = ( CommonToken ) _localctx.local__1_stmt_case8 ; 
        tmp__84 = ( CommonToken ) _localctx.local__2_stmt_case8 ; 
        tmp__85 = ( ImmediateAST ) _localctx.local__4_stmt_case8.result ; 
        tmp__86 = ( ImmediateAST ) _localctx.local__5_stmt_case8.result ; 
        tmp__87 = (ImmediateAST) mkFor( tmp__83, tmp__84.Text, tmp__85, tmp__86 ); 
        $result = tmp__87; 
      } 
    | local__1_stmt_case9=expr { 
        ImmediateAST tmp__88 ; 
        tmp__88 = ( ImmediateAST ) _localctx.local__1_stmt_case9.result ; 
        $result = tmp__88; 
      } 
; 
gen__line_wrap_end returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap_end_case0='end' gen__optional_newline { 
        CommonToken tmp__89 ; 
        tmp__89 = ( CommonToken ) _localctx.local__2_gen__line_wrap_end_case0 ; 
        $result = tmp__89; 
      } 
; 
gen__line_wrap_begin returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap_begin_case0='begin' gen__optional_newline { 
        CommonToken tmp__90 ; 
        tmp__90 = ( CommonToken ) _localctx.local__2_gen__line_wrap_begin_case0 ; 
        $result = tmp__90; 
      } 
; 
newline returns [CommonToken result] :
      local__1_newline_case0=NEWLINE_17 { 
        CommonToken tmp__91 ; 
        tmp__91 = ( CommonToken ) _localctx.local__1_newline_case0 ; 
        $result = tmp__91; 
      } 
    | newline local__2_newline_case1=NEWLINE_17 { 
        CommonToken tmp__92 ; 
        tmp__92 = ( CommonToken ) _localctx.local__2_newline_case1 ; 
        $result = tmp__92; 
      } 
; 
atom returns [ImmediateAST result] :
      local__1_atom_case0=atom local__2_atom_case0='.' '[' local__4_atom_case0=expr ']' { 
        ImmediateAST tmp__96 ; 
        ImmediateAST tmp__95 ; 
        ImmediateAST tmp__94 ; 
        CommonToken tmp__93 ; 
        tmp__93 = ( CommonToken ) _localctx.local__2_atom_case0 ; 
        tmp__94 = ( ImmediateAST ) _localctx.local__1_atom_case0.result ; 
        tmp__95 = ( ImmediateAST ) _localctx.local__4_atom_case0.result ; 
        tmp__96 = (ImmediateAST) mkOGet( tmp__93, tmp__94, tmp__95 ); 
        $result = tmp__96; 
      } 
    | local__1_atom_case1=atom local__2_atom_case1='.' local__3_atom_case1=NAME_13 { 
        ImmediateAST tmp__103 ; 
        ImmediateAST tmp__102 ; 
        DObj tmp__101 ; 
        CommonToken tmp__100 ; 
        CommonToken tmp__99 ; 
        ImmediateAST tmp__98 ; 
        CommonToken tmp__97 ; 
        tmp__97 = ( CommonToken ) _localctx.local__2_atom_case1 ; 
        tmp__98 = ( ImmediateAST ) _localctx.local__1_atom_case1.result ; 
        tmp__99 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__100 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__101 = (DObj) mkstr( tmp__100.Text ); 
        tmp__102 = (ImmediateAST) mkVal( tmp__99, tmp__101 ); 
        tmp__103 = (ImmediateAST) mkOGet( tmp__97, tmp__98, tmp__102 ); 
        $result = tmp__103; 
      } 
    | ':' local__2_atom_case2=NAME_13 { 
        ImmediateAST tmp__106 ; 
        CommonToken tmp__105 ; 
        CommonToken tmp__104 ; 
        tmp__104 = ( CommonToken ) _localctx.local__2_atom_case2 ; 
        tmp__105 = ( CommonToken ) _localctx.local__2_atom_case2 ; 
        tmp__106 = (ImmediateAST) mkSymbol( tmp__104, tmp__105.Text ); 
        $result = tmp__106; 
      } 
    | ':' local__2_atom_case3=STR_4 { 
        ImmediateAST tmp__110 ; 
        string tmp__109 ; 
        CommonToken tmp__108 ; 
        CommonToken tmp__107 ; 
        tmp__107 = ( CommonToken ) _localctx.local__2_atom_case3 ; 
        tmp__108 = ( CommonToken ) _localctx.local__2_atom_case3 ; 
        tmp__109 = (string) unesc( tmp__108.Text ); 
        tmp__110 = (ImmediateAST) mkSymbol( tmp__107, tmp__109 ); 
        $result = tmp__110; 
      } 
    | local__1_atom_case4=atom local__2_atom_case4='(' local__3_atom_case4=gen__closelist__L44__expr ')' { 
        ImmediateAST tmp__114 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__113 ; 
        ImmediateAST tmp__112 ; 
        CommonToken tmp__111 ; 
        tmp__111 = ( CommonToken ) _localctx.local__2_atom_case4 ; 
        tmp__112 = ( ImmediateAST ) _localctx.local__1_atom_case4.result ; 
        tmp__113 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__3_atom_case4.result ; 
        tmp__114 = (ImmediateAST) mkApp( tmp__111, tmp__112, tmp__113 ); 
        $result = tmp__114; 
      } 
    | local__1_atom_case5='[' local__2_atom_case5=gen__closelist__L44__expr ']' { 
        ImmediateAST tmp__117 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__116 ; 
        CommonToken tmp__115 ; 
        tmp__115 = ( CommonToken ) _localctx.local__1_atom_case5 ; 
        tmp__116 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case5.result ; 
        tmp__117 = (ImmediateAST) mkList( tmp__115, tmp__116 ); 
        $result = tmp__117; 
      } 
    | local__1_atom_case6='(' local__2_atom_case6=gen__closelist__L44__expr local__3_atom_case6=trailer ')' { 
        ImmediateAST tmp__121 ; 
        bool tmp__120 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__119 ; 
        CommonToken tmp__118 ; 
        tmp__118 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__119 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case6.result ; 
        tmp__120 = ( bool ) _localctx.local__3_atom_case6.result ; 
        tmp__121 = (ImmediateAST) mkTuple( tmp__118, tmp__119, tmp__120 ); 
        $result = tmp__121; 
      } 
    | local__1_atom_case7='{' local__2_atom_case7=gen__closelist__L44__pair trailer '}' { 
        ImmediateAST tmp__124 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__123 ; 
        CommonToken tmp__122 ; 
        tmp__122 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__123 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case7.result ; 
        tmp__124 = (ImmediateAST) mkDict( tmp__122, tmp__123 ); 
        $result = tmp__124; 
      } 
    | local__1_atom_case8='{' local__2_atom_case8=gen__closelist__L44__expr '}' { 
        ImmediateAST tmp__127 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__126 ; 
        CommonToken tmp__125 ; 
        tmp__125 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__126 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_atom_case8.result ; 
        tmp__127 = (ImmediateAST) mkSet( tmp__125, tmp__126 ); 
        $result = tmp__127; 
      } 
    | local__1_atom_case9=STR_4 { 
        ImmediateAST tmp__132 ; 
        DObj tmp__131 ; 
        string tmp__130 ; 
        CommonToken tmp__129 ; 
        CommonToken tmp__128 ; 
        tmp__128 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__129 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__130 = (string) unesc( tmp__129.Text ); 
        tmp__131 = (DObj) mkstr( tmp__130 ); 
        tmp__132 = (ImmediateAST) mkVal( tmp__128, tmp__131 ); 
        $result = tmp__132; 
      } 
    | local__1_atom_case10=INT_10 { 
        ImmediateAST tmp__137 ; 
        DObj tmp__136 ; 
        int tmp__135 ; 
        CommonToken tmp__134 ; 
        CommonToken tmp__133 ; 
        tmp__133 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__134 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__135 = 0 ; 
        tmp__136 = (DObj) mkint( tmp__134.Text, tmp__135 ); 
        tmp__137 = (ImmediateAST) mkVal( tmp__133, tmp__136 ); 
        $result = tmp__137; 
      } 
    | local__1_atom_case11=HEX_7 { 
        ImmediateAST tmp__142 ; 
        DObj tmp__141 ; 
        int tmp__140 ; 
        CommonToken tmp__139 ; 
        CommonToken tmp__138 ; 
        tmp__138 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__139 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__140 = 16 ; 
        tmp__141 = (DObj) mkint( tmp__139.Text, tmp__140 ); 
        tmp__142 = (ImmediateAST) mkVal( tmp__138, tmp__141 ); 
        $result = tmp__142; 
      } 
    | local__1_atom_case12=OCT_8 { 
        ImmediateAST tmp__147 ; 
        DObj tmp__146 ; 
        int tmp__145 ; 
        CommonToken tmp__144 ; 
        CommonToken tmp__143 ; 
        tmp__143 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__144 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__145 = 8 ; 
        tmp__146 = (DObj) mkint( tmp__144.Text, tmp__145 ); 
        tmp__147 = (ImmediateAST) mkVal( tmp__143, tmp__146 ); 
        $result = tmp__147; 
      } 
    | local__1_atom_case13=BIN_9 { 
        ImmediateAST tmp__152 ; 
        DObj tmp__151 ; 
        int tmp__150 ; 
        CommonToken tmp__149 ; 
        CommonToken tmp__148 ; 
        tmp__148 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__149 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__150 = 2 ; 
        tmp__151 = (DObj) mkint( tmp__149.Text, tmp__150 ); 
        tmp__152 = (ImmediateAST) mkVal( tmp__148, tmp__151 ); 
        $result = tmp__152; 
      } 
    | local__1_atom_case14=FLOAT_11 { 
        ImmediateAST tmp__156 ; 
        DObj tmp__155 ; 
        CommonToken tmp__154 ; 
        CommonToken tmp__153 ; 
        tmp__153 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__154 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__155 = (DObj) mkfloat( tmp__154.Text ); 
        tmp__156 = (ImmediateAST) mkVal( tmp__153, tmp__155 ); 
        $result = tmp__156; 
      } 
    | local__1_atom_case15='None' { 
        ImmediateAST tmp__159 ; 
        DObj tmp__158 ; 
        CommonToken tmp__157 ; 
        tmp__157 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__158 = (DObj) mknone(  ); 
        tmp__159 = (ImmediateAST) mkVal( tmp__157, tmp__158 ); 
        $result = tmp__159; 
      } 
    | local__1_atom_case16=NAME_13 { 
        ImmediateAST tmp__162 ; 
        CommonToken tmp__161 ; 
        CommonToken tmp__160 ; 
        tmp__160 = ( CommonToken ) _localctx.local__1_atom_case16 ; 
        tmp__161 = ( CommonToken ) _localctx.local__1_atom_case16 ; 
        tmp__162 = (ImmediateAST) mkVar( tmp__160, tmp__161.Text ); 
        $result = tmp__162; 
      } 
    | local__1_atom_case17='-' local__2_atom_case17=atom { 
        ImmediateAST tmp__165 ; 
        ImmediateAST tmp__164 ; 
        CommonToken tmp__163 ; 
        tmp__163 = ( CommonToken ) _localctx.local__1_atom_case17 ; 
        tmp__164 = ( ImmediateAST ) _localctx.local__2_atom_case17.result ; 
        tmp__165 = (ImmediateAST) mkNeg( tmp__163, tmp__164 ); 
        $result = tmp__165; 
      } 
    | local__1_atom_case18='~' local__2_atom_case18=atom { 
        ImmediateAST tmp__168 ; 
        ImmediateAST tmp__167 ; 
        CommonToken tmp__166 ; 
        tmp__166 = ( CommonToken ) _localctx.local__1_atom_case18 ; 
        tmp__167 = ( ImmediateAST ) _localctx.local__2_atom_case18.result ; 
        tmp__168 = (ImmediateAST) mkInv( tmp__166, tmp__167 ); 
        $result = tmp__168; 
      } 
    | local__1_atom_case19='if' local__2_atom_case19=expr local__3_atom_case19=then local__4_atom_case19=block 'end' { 
        ImmediateAST tmp__174 ; 
        ImmediateAST tmp__173 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__172 ; 
        CommonToken tmp__171 ; 
        ImmediateAST tmp__170 ; 
        CommonToken tmp__169 ; 
        tmp__169 = ( CommonToken ) _localctx.local__1_atom_case19 ; 
        tmp__170 = ( ImmediateAST ) _localctx.local__2_atom_case19.result ; 
        tmp__171 = ( CommonToken ) _localctx.local__3_atom_case19.result ; 
        tmp__172 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case19.result ; 
        tmp__173 = (ImmediateAST) mkBlock( tmp__171, tmp__172 ); 
        tmp__174 = (ImmediateAST) mkIfThen( tmp__169, tmp__170, tmp__173 ); 
        $result = tmp__174; 
      } 
    | local__1_atom_case20='if' local__2_atom_case20=expr local__3_atom_case20=then local__4_atom_case20=block local__5_atom_case20=gen__nullable_gen__list_gen__snd_elif__elifBlock local__6_atom_case20=gen__optional_gen__blockOf_else 'end' { 
        ImmediateAST tmp__186 ; 
        ImmediateAST tmp__185 ; 
        CommonToken tmp__184 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__182 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__183 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> elifs__180 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__181 ; 
        ImmediateAST tmp__179 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__178 ; 
        CommonToken tmp__177 ; 
        ImmediateAST tmp__176 ; 
        (ImmediateAST, ImmediateAST) elif__175 ; 
        tmp__176 = ( ImmediateAST ) _localctx.local__2_atom_case20.result ; 
        tmp__177 = ( CommonToken ) _localctx.local__3_atom_case20.result ; 
        tmp__178 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__4_atom_case20.result ; 
        tmp__179 = (ImmediateAST) mkBlock( tmp__177, tmp__178 ); 
        elif__175 = ( tmp__176 , tmp__179 ); 
        tmp__181 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        elifs__180 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__181, elif__175 ); 
        tmp__183 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__5_atom_case20.result ; 
        elifs__182 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) extend<(ImmediateAST, ImmediateAST)>( elifs__180, tmp__183 ); 
        tmp__184 = ( CommonToken ) _localctx.local__1_atom_case20 ; 
        tmp__185 = ( ImmediateAST ) _localctx.local__6_atom_case20.result ; 
        tmp__186 = (ImmediateAST) mkNestedIf( tmp__184, elifs__180, tmp__185 ); 
        $result = tmp__186; 
      } 
    | local__1_atom_case21='fun' local__2_atom_case21=name '(' local__4_atom_case21=gen__nullable_gen__seplist__L44__name ')' local__6_atom_case21=block 'end' { 
        ImmediateAST tmp__191 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__190 ; 
        System.Collections.Generic.List<string> tmp__189 ; 
        string tmp__188 ; 
        CommonToken tmp__187 ; 
        tmp__187 = ( CommonToken ) _localctx.local__1_atom_case21 ; 
        tmp__188 = ( string ) _localctx.local__2_atom_case21.result ; 
        tmp__189 = ( System.Collections.Generic.List<string> ) _localctx.local__4_atom_case21.result ; 
        tmp__190 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__6_atom_case21.result ; 
        tmp__191 = (ImmediateAST) mkFunc( tmp__187, tmp__188, tmp__189, tmp__190 ); 
        $result = tmp__191; 
      } 
    | local__1_atom_case22='fun' '(' local__3_atom_case22=gen__nullable_gen__seplist__L44__name ')' local__5_atom_case22=block 'end' { 
        ImmediateAST tmp__196 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__195 ; 
        System.Collections.Generic.List<string> tmp__194 ; 
        string tmp__193 ; 
        CommonToken tmp__192 ; 
        tmp__192 = ( CommonToken ) _localctx.local__1_atom_case22 ; 
        tmp__193 = "" ; 
        tmp__194 = ( System.Collections.Generic.List<string> ) _localctx.local__3_atom_case22.result ; 
        tmp__195 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__5_atom_case22.result ; 
        tmp__196 = (ImmediateAST) mkFunc( tmp__192, tmp__193, tmp__194, tmp__195 ); 
        $result = tmp__196; 
      } 
    | local__1_atom_case23='(' local__2_atom_case23=gen__nullable_gen__seplist__L44__name ')' '->' local__5_atom_case23=gen__line_wrap_expr { 
        ImmediateAST tmp__202 ; 
        ImmediateAST tmp__201 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__200 ; 
        System.Collections.Generic.List<string> tmp__199 ; 
        string tmp__198 ; 
        CommonToken tmp__197 ; 
        tmp__197 = ( CommonToken ) _localctx.local__1_atom_case23 ; 
        tmp__198 = "" ; 
        tmp__199 = ( System.Collections.Generic.List<string> ) _localctx.local__2_atom_case23.result ; 
        tmp__201 = ( ImmediateAST ) _localctx.local__5_atom_case23.result ; 
        tmp__200 = new System.Collections.Generic.List<ImmediateAST> { tmp__201 }; 
        tmp__202 = (ImmediateAST) mkFunc( tmp__197, tmp__198, tmp__199, tmp__200 ); 
        $result = tmp__202; 
      } 
    | local__1_atom_case24=NAME_13 '->' local__3_atom_case24=gen__line_wrap_expr { 
        ImmediateAST tmp__209 ; 
        ImmediateAST tmp__208 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__207 ; 
        CommonToken tmp__206 ; 
        System.Collections.Generic.List<string> tmp__205 ; 
        string tmp__204 ; 
        CommonToken tmp__203 ; 
        tmp__203 = ( CommonToken ) _localctx.local__1_atom_case24 ; 
        tmp__204 = "" ; 
        tmp__206 = ( CommonToken ) _localctx.local__1_atom_case24 ; 
        tmp__205 = new System.Collections.Generic.List<string> { tmp__206.Text }; 
        tmp__208 = ( ImmediateAST ) _localctx.local__3_atom_case24.result ; 
        tmp__207 = new System.Collections.Generic.List<ImmediateAST> { tmp__208 }; 
        tmp__209 = (ImmediateAST) mkFunc( tmp__203, tmp__204, tmp__205, tmp__207 ); 
        $result = tmp__209; 
      } 
    | local__1_atom_case25='break' { 
        ImmediateAST tmp__211 ; 
        CommonToken tmp__210 ; 
        tmp__210 = ( CommonToken ) _localctx.local__1_atom_case25 ; 
        tmp__211 = (ImmediateAST) mkBreak( tmp__210 ); 
        $result = tmp__211; 
      } 
    | local__1_atom_case26='continue' { 
        ImmediateAST tmp__213 ; 
        CommonToken tmp__212 ; 
        tmp__212 = ( CommonToken ) _localctx.local__1_atom_case26 ; 
        tmp__213 = (ImmediateAST) mkContinue( tmp__212 ); 
        $result = tmp__213; 
      } 
    | local__1_atom_case27='return' local__2_atom_case27=expr { 
        ImmediateAST tmp__216 ; 
        ImmediateAST tmp__215 ; 
        CommonToken tmp__214 ; 
        tmp__214 = ( CommonToken ) _localctx.local__1_atom_case27 ; 
        tmp__215 = ( ImmediateAST ) _localctx.local__2_atom_case27.result ; 
        tmp__216 = (ImmediateAST) mkReturn( tmp__214, tmp__215 ); 
        $result = tmp__216; 
      } 
    | local__1_atom_case28='return' { 
        ImmediateAST tmp__218 ; 
        CommonToken tmp__217 ; 
        tmp__217 = ( CommonToken ) _localctx.local__1_atom_case28 ; 
        tmp__218 = (ImmediateAST) mkReturn( tmp__217, null ); 
        $result = tmp__218; 
      } 
; 
gen__line_wrap_expr returns [ImmediateAST result] :
      gen__optional_newline local__2_gen__line_wrap_expr_case0=expr gen__optional_newline { 
        ImmediateAST tmp__219 ; 
        tmp__219 = ( ImmediateAST ) _localctx.local__2_gen__line_wrap_expr_case0.result ; 
        $result = tmp__219; 
      } 
; 
gen__nullable_gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__nullable_gen__seplist__L44__name_case0=gen__seplist__L44__name { 
        System.Collections.Generic.List<string> tmp__220 ; 
        tmp__220 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__nullable_gen__seplist__L44__name_case0.result ; 
        $result = tmp__220; 
      } 
    | { 
        System.Collections.Generic.List<string> tmp__221 ; 
        tmp__221 = (System.Collections.Generic.List<string>) empty<string>(  ); 
        $result = tmp__221; 
      } 
; 
gen__seplist__L44__name returns [System.Collections.Generic.List<string> result] :
      local__1_gen__seplist__L44__name_case0=name { 
        string tmp__223 ; 
        System.Collections.Generic.List<string> tmp__222 ; 
        tmp__223 = ( string ) _localctx.local__1_gen__seplist__L44__name_case0.result ; 
        tmp__222 = new System.Collections.Generic.List<string> { tmp__223 }; 
        $result = tmp__222; 
      } 
    | local__1_gen__seplist__L44__name_case1=gen__seplist__L44__name ',' local__3_gen__seplist__L44__name_case1=name { 
        System.Collections.Generic.List<string> tmp__226 ; 
        string tmp__225 ; 
        System.Collections.Generic.List<string> tmp__224 ; 
        tmp__224 = ( System.Collections.Generic.List<string> ) _localctx.local__1_gen__seplist__L44__name_case1.result ; 
        tmp__225 = ( string ) _localctx.local__3_gen__seplist__L44__name_case1.result ; 
        tmp__226 = (System.Collections.Generic.List<string>) append<string>( tmp__224, tmp__225 ); 
        $result = tmp__226; 
      } 
; 
gen__optional_gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__optional_gen__blockOf_else_case0=gen__blockOf_else { 
        ImmediateAST tmp__227 ; 
        tmp__227 = ( ImmediateAST ) _localctx.local__1_gen__optional_gen__blockOf_else_case0.result ; 
        $result = tmp__227; 
      } 
    | { 
        $result = null; 
      } 
; 
gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__blockOf_else_case0='else' local__2_gen__blockOf_else_case0=block { 
        ImmediateAST tmp__230 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__229 ; 
        CommonToken tmp__228 ; 
        tmp__228 = ( CommonToken ) _localctx.local__1_gen__blockOf_else_case0 ; 
        tmp__229 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_else_case0.result ; 
        tmp__230 = (ImmediateAST) mkBlock( tmp__228, tmp__229 ); 
        $result = tmp__230; 
      } 
; 
gen__nullable_gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0=gen__list_gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__231 ; 
        tmp__231 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__231; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__232 ; 
        tmp__232 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__232; 
      } 
; 
gen__list_gen__snd_elif__elifBlock returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__list_gen__snd_elif__elifBlock_case0=gen__snd_elif__elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__234 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__233 ; 
        tmp__234 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        tmp__233 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__234 }; 
        $result = tmp__233; 
      } 
    | local__1_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock local__2_gen__list_gen__snd_elif__elifBlock_case1=gen__snd_elif__elifBlock { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__237 ; 
        (ImmediateAST, ImmediateAST) tmp__236 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__235 ; 
        tmp__235 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__236 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__237 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__235, tmp__236 ); 
        $result = tmp__237; 
      } 
; 
gen__snd_elif__elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      'elif' local__2_gen__snd_elif__elifBlock_case0=elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__238 ; 
        tmp__238 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__238; 
      } 
; 
gen__closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      gen__optional_newline local__2_gen__closelist__L44__pair_case0=gen___closelist__L44__pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__239 ; 
        tmp__239 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_gen__closelist__L44__pair_case0.result ; 
        $result = tmp__239; 
      } 
; 
gen___closelist__L44__pair returns [System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen___closelist__L44__pair_case0=gen___closelist__L44__pair newline { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__240 ; 
        tmp__240 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case0.result ; 
        $result = tmp__240; 
      } 
    | local__1_gen___closelist__L44__pair_case1=gen___closelist__L44__pair ',' newline local__4_gen___closelist__L44__pair_case1=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__243 ; 
        (ImmediateAST, ImmediateAST) tmp__242 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__241 ; 
        tmp__241 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case1.result ; 
        tmp__242 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__4_gen___closelist__L44__pair_case1.result ; 
        tmp__243 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__241, tmp__242 ); 
        $result = tmp__243; 
      } 
    | local__1_gen___closelist__L44__pair_case2=gen___closelist__L44__pair ',' local__3_gen___closelist__L44__pair_case2=pair { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__246 ; 
        (ImmediateAST, ImmediateAST) tmp__245 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__244 ; 
        tmp__244 = ( System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen___closelist__L44__pair_case2.result ; 
        tmp__245 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__3_gen___closelist__L44__pair_case2.result ; 
        tmp__246 = (System.Collections.Generic.List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__244, tmp__245 ); 
        $result = tmp__246; 
      } 
    | local__1_gen___closelist__L44__pair_case3=pair { 
        (ImmediateAST, ImmediateAST) tmp__248 ; 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__247 ; 
        tmp__248 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen___closelist__L44__pair_case3.result ; 
        tmp__247 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { tmp__248 }; 
        $result = tmp__247; 
      } 
    | { 
        System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> tmp__249 ; 
        tmp__249 = new System.Collections.Generic.List<(ImmediateAST, ImmediateAST)> { }; 
        $result = tmp__249; 
      } 
; 
gen__closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_gen__closelist__L44__expr_case0=gen___closelist__L44__expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__250 ; 
        tmp__250 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__closelist__L44__expr_case0.result ; 
        $result = tmp__250; 
      } 
; 
gen___closelist__L44__expr returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen___closelist__L44__expr_case0=gen___closelist__L44__expr newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__251 ; 
        tmp__251 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case0.result ; 
        $result = tmp__251; 
      } 
    | local__1_gen___closelist__L44__expr_case1=gen___closelist__L44__expr ',' newline local__4_gen___closelist__L44__expr_case1=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__254 ; 
        ImmediateAST tmp__253 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__252 ; 
        tmp__252 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case1.result ; 
        tmp__253 = ( ImmediateAST ) _localctx.local__4_gen___closelist__L44__expr_case1.result ; 
        tmp__254 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__252, tmp__253 ); 
        $result = tmp__254; 
      } 
    | local__1_gen___closelist__L44__expr_case2=gen___closelist__L44__expr ',' local__3_gen___closelist__L44__expr_case2=expr { 
        System.Collections.Generic.List<ImmediateAST> tmp__257 ; 
        ImmediateAST tmp__256 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__255 ; 
        tmp__255 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__expr_case2.result ; 
        tmp__256 = ( ImmediateAST ) _localctx.local__3_gen___closelist__L44__expr_case2.result ; 
        tmp__257 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__255, tmp__256 ); 
        $result = tmp__257; 
      } 
    | local__1_gen___closelist__L44__expr_case3=expr { 
        ImmediateAST tmp__259 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__258 ; 
        tmp__259 = ( ImmediateAST ) _localctx.local__1_gen___closelist__L44__expr_case3.result ; 
        tmp__258 = new System.Collections.Generic.List<ImmediateAST> { tmp__259 }; 
        $result = tmp__258; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__260 ; 
        tmp__260 = new System.Collections.Generic.List<ImmediateAST> { }; 
        $result = tmp__260; 
      } 
; 
pair returns [(ImmediateAST, ImmediateAST) result] :
      local__1_pair_case0=expr gen__line_wrap__L58 local__3_pair_case0=expr { 
        ImmediateAST tmp__263 ; 
        ImmediateAST tmp__262 ; 
        (ImmediateAST, ImmediateAST) tmp__261 ; 
        tmp__262 = ( ImmediateAST ) _localctx.local__1_pair_case0.result ; 
        tmp__263 = ( ImmediateAST ) _localctx.local__3_pair_case0.result ; 
        tmp__261 = ( tmp__262 , tmp__263 ); 
        $result = tmp__261; 
      } 
; 
gen__line_wrap__L58 returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap__L58_case0=':' gen__optional_newline { 
        CommonToken tmp__264 ; 
        tmp__264 = ( CommonToken ) _localctx.local__2_gen__line_wrap__L58_case0 ; 
        $result = tmp__264; 
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
        ImmediateAST tmp__266 ; 
        System.Collections.Generic.List<object> tmp__265 ; 
        tmp__265 = ( System.Collections.Generic.List<object> ) _localctx.local__1_bin_case0.result ; 
        tmp__266 = (ImmediateAST) resolve_binop( tmp__265 ); 
        $result = tmp__266; 
      } 
; 
binseq returns [System.Collections.Generic.List<object> result] :
      local__1_binseq_case0=atom { 
        System.Collections.Generic.List<object> tmp__270 ; 
        object tmp__269 ; 
        ImmediateAST tmp__268 ; 
        System.Collections.Generic.List<object> tmp__267 ; 
        tmp__267 = (System.Collections.Generic.List<object>) empty<object>(  ); 
        tmp__268 = ( ImmediateAST ) _localctx.local__1_binseq_case0.result ; 
        tmp__269 = (object) to_obj<ImmediateAST>( tmp__268 ); 
        tmp__270 = (System.Collections.Generic.List<object>) append<object>( tmp__267, tmp__269 ); 
        $result = tmp__270; 
      } 
    | local__1_binseq_case1=binseq local__2_binseq_case1=binop local__3_binseq_case1=atom { 
        object tmp__276 ; 
        ImmediateAST tmp__275 ; 
        System.Collections.Generic.List<object> tmp__274 ; 
        System.Collections.Generic.List<object> block__271 ; 
        object tmp__273 ; 
        System.Collections.Generic.List<object> tmp__272 ; 
        tmp__272 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__273 = ( object ) _localctx.local__2_binseq_case1.result ; 
        block__271 = (System.Collections.Generic.List<object>) append<object>( tmp__272, tmp__273 ); 
        tmp__274 = ( System.Collections.Generic.List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__275 = ( ImmediateAST ) _localctx.local__3_binseq_case1.result ; 
        tmp__276 = (object) to_obj<ImmediateAST>( tmp__275 ); 
        block__271 = (System.Collections.Generic.List<object>) append<object>( tmp__274, tmp__276 ); 
        $result = block__271; 
      } 
; 
ibinop returns [string result] :
      local__1_ibinop_case0=SINGLE_BINOP_2 { 
        CommonToken tmp__277 ; 
        tmp__277 = ( CommonToken ) _localctx.local__1_ibinop_case0 ; 
        $result = tmp__277.Text; 
      } 
    | '-' { 
        string tmp__278 ; 
        tmp__278 = "-" ; 
        $result = tmp__278; 
      } 
; 
binop returns [object result] :
      local__1_binop_case0=SINGLE_BINOP_2 { 
        object tmp__281 ; 
        CommonToken tmp__280 ; 
        CommonToken tmp__279 ; 
        tmp__279 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__280 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__281 = (object) mkop( tmp__279, tmp__280.Text ); 
        $result = tmp__281; 
      } 
    | local__1_binop_case1='not' 'in' { 
        object tmp__284 ; 
        string tmp__283 ; 
        CommonToken tmp__282 ; 
        tmp__282 = ( CommonToken ) _localctx.local__1_binop_case1 ; 
        tmp__283 = "notin" ; 
        tmp__284 = (object) mkop( tmp__282, tmp__283 ); 
        $result = tmp__284; 
      } 
    | local__1_binop_case2='in' { 
        object tmp__287 ; 
        string tmp__286 ; 
        CommonToken tmp__285 ; 
        tmp__285 = ( CommonToken ) _localctx.local__1_binop_case2 ; 
        tmp__286 = "in" ; 
        tmp__287 = (object) mkop( tmp__285, tmp__286 ); 
        $result = tmp__287; 
      } 
    | local__1_binop_case3='-' { 
        object tmp__290 ; 
        string tmp__289 ; 
        CommonToken tmp__288 ; 
        tmp__288 = ( CommonToken ) _localctx.local__1_binop_case3 ; 
        tmp__289 = "-" ; 
        tmp__290 = (object) mkop( tmp__288, tmp__289 ); 
        $result = tmp__290; 
      } 
; 
not returns [ImmediateAST result] :
      local__1_not_case0=gen__line_wrap_not local__2_not_case0=not { 
        ImmediateAST tmp__293 ; 
        ImmediateAST tmp__292 ; 
        CommonToken tmp__291 ; 
        tmp__291 = ( CommonToken ) _localctx.local__1_not_case0.result ; 
        tmp__292 = ( ImmediateAST ) _localctx.local__2_not_case0.result ; 
        tmp__293 = (ImmediateAST) mkNot( tmp__291, tmp__292 ); 
        $result = tmp__293; 
      } 
    | local__1_not_case1=bin { 
        ImmediateAST tmp__294 ; 
        tmp__294 = ( ImmediateAST ) _localctx.local__1_not_case1.result ; 
        $result = tmp__294; 
      } 
; 
gen__line_wrap_not returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap_not_case0='not' gen__optional_newline { 
        CommonToken tmp__295 ; 
        tmp__295 = ( CommonToken ) _localctx.local__2_gen__line_wrap_not_case0 ; 
        $result = tmp__295; 
      } 
; 
and_expr returns [ImmediateAST result] :
      local__1_and_expr_case0=and_expr local__2_and_expr_case0=gen__line_wrap_and local__3_and_expr_case0=not { 
        ImmediateAST tmp__299 ; 
        ImmediateAST tmp__298 ; 
        ImmediateAST tmp__297 ; 
        CommonToken tmp__296 ; 
        tmp__296 = ( CommonToken ) _localctx.local__2_and_expr_case0.result ; 
        tmp__297 = ( ImmediateAST ) _localctx.local__1_and_expr_case0.result ; 
        tmp__298 = ( ImmediateAST ) _localctx.local__3_and_expr_case0.result ; 
        tmp__299 = (ImmediateAST) mkAnd( tmp__296, tmp__297, tmp__298 ); 
        $result = tmp__299; 
      } 
    | local__1_and_expr_case1=not { 
        ImmediateAST tmp__300 ; 
        tmp__300 = ( ImmediateAST ) _localctx.local__1_and_expr_case1.result ; 
        $result = tmp__300; 
      } 
; 
gen__line_wrap_and returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap_and_case0='and' gen__optional_newline { 
        CommonToken tmp__301 ; 
        tmp__301 = ( CommonToken ) _localctx.local__2_gen__line_wrap_and_case0 ; 
        $result = tmp__301; 
      } 
; 
or_expr returns [ImmediateAST result] :
      local__1_or_expr_case0=or_expr local__2_or_expr_case0=gen__line_wrap_or local__3_or_expr_case0=and_expr { 
        ImmediateAST tmp__305 ; 
        ImmediateAST tmp__304 ; 
        ImmediateAST tmp__303 ; 
        CommonToken tmp__302 ; 
        tmp__302 = ( CommonToken ) _localctx.local__2_or_expr_case0.result ; 
        tmp__303 = ( ImmediateAST ) _localctx.local__1_or_expr_case0.result ; 
        tmp__304 = ( ImmediateAST ) _localctx.local__3_or_expr_case0.result ; 
        tmp__305 = (ImmediateAST) mkOr( tmp__302, tmp__303, tmp__304 ); 
        $result = tmp__305; 
      } 
    | local__1_or_expr_case1=and_expr { 
        ImmediateAST tmp__306 ; 
        tmp__306 = ( ImmediateAST ) _localctx.local__1_or_expr_case1.result ; 
        $result = tmp__306; 
      } 
; 
gen__line_wrap_or returns [CommonToken result] :
      gen__optional_newline local__2_gen__line_wrap_or_case0='or' gen__optional_newline { 
        CommonToken tmp__307 ; 
        tmp__307 = ( CommonToken ) _localctx.local__2_gen__line_wrap_or_case0 ; 
        $result = tmp__307; 
      } 
; 
block returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_block_case0=gen__filter_stmt__gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__308 ; 
        tmp__308 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_block_case0.result ; 
        $result = tmp__308; 
      } 
; 
gen__filter_stmt__gen__or___L59__newline returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__filter_stmt__gen__or___L59__newline_case0=gen__filter_stmt__gen__or___L59__newline local__2_gen__filter_stmt__gen__or___L59__newline_case0=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__311 ; 
        ImmediateAST tmp__310 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__309 ; 
        tmp__309 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case0.result ; 
        tmp__310 = ( ImmediateAST ) _localctx.local__2_gen__filter_stmt__gen__or___L59__newline_case0.result ; 
        tmp__311 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__309, tmp__310 ); 
        $result = tmp__311; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__newline_case1=gen__filter_stmt__gen__or___L59__newline gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__312 ; 
        tmp__312 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case1.result ; 
        $result = tmp__312; 
      } 
    | local__1_gen__filter_stmt__gen__or___L59__newline_case2=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__315 ; 
        ImmediateAST tmp__314 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__313 ; 
        tmp__313 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__314 = ( ImmediateAST ) _localctx.local__1_gen__filter_stmt__gen__or___L59__newline_case2.result ; 
        tmp__315 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__313, tmp__314 ); 
        $result = tmp__315; 
      } 
    | gen__or___L59__newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__316 ; 
        tmp__316 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__316; 
      } 
; 
lhs3 returns [ImmediateAST result] :
      local__1_lhs3_case0=NAME_13 { 
        ImmediateAST tmp__319 ; 
        CommonToken tmp__318 ; 
        CommonToken tmp__317 ; 
        tmp__317 = ( CommonToken ) _localctx.local__1_lhs3_case0 ; 
        tmp__318 = ( CommonToken ) _localctx.local__1_lhs3_case0 ; 
        tmp__319 = (ImmediateAST) mkVar( tmp__317, tmp__318.Text ); 
        $result = tmp__319; 
      } 
; 
lhs2 returns [ImmediateAST result] :
      local__1_lhs2_case0='(' local__2_lhs2_case0=gen__closelist__L44__gen__or_lhs3__lhs2 local__3_lhs2_case0=trailer ')' { 
        ImmediateAST tmp__323 ; 
        bool tmp__322 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__321 ; 
        CommonToken tmp__320 ; 
        tmp__320 = ( CommonToken ) _localctx.local__1_lhs2_case0 ; 
        tmp__321 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_lhs2_case0.result ; 
        tmp__322 = ( bool ) _localctx.local__3_lhs2_case0.result ; 
        tmp__323 = (ImmediateAST) mkTuple( tmp__320, tmp__321, tmp__322 ); 
        $result = tmp__323; 
      } 
    | local__1_lhs2_case1='var' local__2_lhs2_case1=NAME_13 { 
        ImmediateAST tmp__327 ; 
        CommonToken tmp__326 ; 
        System.Collections.Generic.List<string> tmp__325 ; 
        CommonToken tmp__324 ; 
        tmp__324 = ( CommonToken ) _localctx.local__1_lhs2_case1 ; 
        tmp__326 = ( CommonToken ) _localctx.local__2_lhs2_case1 ; 
        tmp__325 = new System.Collections.Generic.List<string> { tmp__326.Text }; 
        tmp__327 = (ImmediateAST) mkDecl( tmp__324, tmp__325 ); 
        $result = tmp__327; 
      } 
; 
gen__closelist__L44__gen__or_lhs3__lhs2 returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_gen__closelist__L44__gen__or_lhs3__lhs2_case0=gen___closelist__L44__gen__or_lhs3__lhs2 { 
        System.Collections.Generic.List<ImmediateAST> tmp__328 ; 
        tmp__328 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__closelist__L44__gen__or_lhs3__lhs2_case0.result ; 
        $result = tmp__328; 
      } 
; 
gen___closelist__L44__gen__or_lhs3__lhs2 returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen___closelist__L44__gen__or_lhs3__lhs2_case0=gen___closelist__L44__gen__or_lhs3__lhs2 newline { 
        System.Collections.Generic.List<ImmediateAST> tmp__329 ; 
        tmp__329 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__gen__or_lhs3__lhs2_case0.result ; 
        $result = tmp__329; 
      } 
    | local__1_gen___closelist__L44__gen__or_lhs3__lhs2_case1=gen___closelist__L44__gen__or_lhs3__lhs2 ',' newline local__4_gen___closelist__L44__gen__or_lhs3__lhs2_case1=gen__or_lhs3__lhs2 { 
        System.Collections.Generic.List<ImmediateAST> tmp__332 ; 
        ImmediateAST tmp__331 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__330 ; 
        tmp__330 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__gen__or_lhs3__lhs2_case1.result ; 
        tmp__331 = ( ImmediateAST ) _localctx.local__4_gen___closelist__L44__gen__or_lhs3__lhs2_case1.result ; 
        tmp__332 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__330, tmp__331 ); 
        $result = tmp__332; 
      } 
    | local__1_gen___closelist__L44__gen__or_lhs3__lhs2_case2=gen___closelist__L44__gen__or_lhs3__lhs2 ',' local__3_gen___closelist__L44__gen__or_lhs3__lhs2_case2=gen__or_lhs3__lhs2 { 
        System.Collections.Generic.List<ImmediateAST> tmp__335 ; 
        ImmediateAST tmp__334 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__333 ; 
        tmp__333 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen___closelist__L44__gen__or_lhs3__lhs2_case2.result ; 
        tmp__334 = ( ImmediateAST ) _localctx.local__3_gen___closelist__L44__gen__or_lhs3__lhs2_case2.result ; 
        tmp__335 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__333, tmp__334 ); 
        $result = tmp__335; 
      } 
    | local__1_gen___closelist__L44__gen__or_lhs3__lhs2_case3=gen__or_lhs3__lhs2 { 
        ImmediateAST tmp__337 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__336 ; 
        tmp__337 = ( ImmediateAST ) _localctx.local__1_gen___closelist__L44__gen__or_lhs3__lhs2_case3.result ; 
        tmp__336 = new System.Collections.Generic.List<ImmediateAST> { tmp__337 }; 
        $result = tmp__336; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__338 ; 
        tmp__338 = new System.Collections.Generic.List<ImmediateAST> { }; 
        $result = tmp__338; 
      } 
; 
gen__or_lhs3__lhs2 returns [ImmediateAST result] :
      local__1_gen__or_lhs3__lhs2_case0=lhs3 { 
        ImmediateAST tmp__339 ; 
        tmp__339 = ( ImmediateAST ) _localctx.local__1_gen__or_lhs3__lhs2_case0.result ; 
        $result = tmp__339; 
      } 
    | local__1_gen__or_lhs3__lhs2_case1=lhs2 { 
        ImmediateAST tmp__340 ; 
        tmp__340 = ( ImmediateAST ) _localctx.local__1_gen__or_lhs3__lhs2_case1.result ; 
        $result = tmp__340; 
      } 
; 
lhs returns [ImmediateAST result] :
      local__1_lhs_case0=NAME_13 { 
        ImmediateAST tmp__343 ; 
        CommonToken tmp__342 ; 
        CommonToken tmp__341 ; 
        tmp__341 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__342 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__343 = (ImmediateAST) mkVar( tmp__341, tmp__342.Text ); 
        $result = tmp__343; 
      } 
    | local__1_lhs_case1=atom local__2_lhs_case1='.' '[' local__4_lhs_case1=expr ']' { 
        ImmediateAST tmp__347 ; 
        ImmediateAST tmp__346 ; 
        ImmediateAST tmp__345 ; 
        CommonToken tmp__344 ; 
        tmp__344 = ( CommonToken ) _localctx.local__2_lhs_case1 ; 
        tmp__345 = ( ImmediateAST ) _localctx.local__1_lhs_case1.result ; 
        tmp__346 = ( ImmediateAST ) _localctx.local__4_lhs_case1.result ; 
        tmp__347 = (ImmediateAST) mkOGet( tmp__344, tmp__345, tmp__346 ); 
        $result = tmp__347; 
      } 
    | local__1_lhs_case2=atom local__2_lhs_case2='.' local__3_lhs_case2=NAME_13 { 
        ImmediateAST tmp__354 ; 
        ImmediateAST tmp__353 ; 
        DObj tmp__352 ; 
        CommonToken tmp__351 ; 
        CommonToken tmp__350 ; 
        ImmediateAST tmp__349 ; 
        CommonToken tmp__348 ; 
        tmp__348 = ( CommonToken ) _localctx.local__2_lhs_case2 ; 
        tmp__349 = ( ImmediateAST ) _localctx.local__1_lhs_case2.result ; 
        tmp__350 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__351 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__352 = (DObj) mkstr( tmp__351.Text ); 
        tmp__353 = (ImmediateAST) mkVal( tmp__350, tmp__352 ); 
        tmp__354 = (ImmediateAST) mkOGet( tmp__348, tmp__349, tmp__353 ); 
        $result = tmp__354; 
      } 
; 
do returns [CommonToken result] :
      gen__optional_newline local__2_do_case0='do' { 
        CommonToken tmp__355 ; 
        tmp__355 = ( CommonToken ) _localctx.local__2_do_case0 ; 
        $result = tmp__355; 
      } 
; 
then returns [CommonToken result] :
      gen__optional_newline local__2_then_case0='then' { 
        CommonToken tmp__356 ; 
        tmp__356 = ( CommonToken ) _localctx.local__2_then_case0 ; 
        $result = tmp__356; 
      } 
; 
gen__blockOf_do returns [ImmediateAST result] :
      local__1_gen__blockOf_do_case0=do local__2_gen__blockOf_do_case0=block { 
        ImmediateAST tmp__359 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__358 ; 
        CommonToken tmp__357 ; 
        tmp__357 = ( CommonToken ) _localctx.local__1_gen__blockOf_do_case0.result ; 
        tmp__358 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_do_case0.result ; 
        tmp__359 = (ImmediateAST) mkBlock( tmp__357, tmp__358 ); 
        $result = tmp__359; 
      } 
; 
name returns [string result] :
      local__1_name_case0=NAME_13 { 
        CommonToken tmp__360 ; 
        tmp__360 = ( CommonToken ) _localctx.local__1_name_case0 ; 
        $result = tmp__360.Text; 
      } 
; 
elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      local__1_elifBlock_case0=expr local__2_elifBlock_case0=gen__blockOf_then { 
        ImmediateAST tmp__363 ; 
        ImmediateAST tmp__362 ; 
        (ImmediateAST, ImmediateAST) tmp__361 ; 
        tmp__362 = ( ImmediateAST ) _localctx.local__1_elifBlock_case0.result ; 
        tmp__363 = ( ImmediateAST ) _localctx.local__2_elifBlock_case0.result ; 
        tmp__361 = ( tmp__362 , tmp__363 ); 
        $result = tmp__361; 
      } 
; 
gen__blockOf_then returns [ImmediateAST result] :
      local__1_gen__blockOf_then_case0=then local__2_gen__blockOf_then_case0=block { 
        ImmediateAST tmp__366 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__365 ; 
        CommonToken tmp__364 ; 
        tmp__364 = ( CommonToken ) _localctx.local__1_gen__blockOf_then_case0.result ; 
        tmp__365 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_gen__blockOf_then_case0.result ; 
        tmp__366 = (ImmediateAST) mkBlock( tmp__364, tmp__365 ); 
        $result = tmp__366; 
      } 
; 
lhs_seq returns [System.Collections.Generic.List<(ImmediateAST, string)> result] :
      local__1_lhs_seq_case0=lhs_seq local__2_lhs_seq_case0=lhs local__3_lhs_seq_case0=gen__optional_ibinop '=' { 
        System.Collections.Generic.List<(ImmediateAST, string)> tmp__371 ; 
        string tmp__370 ; 
        ImmediateAST tmp__369 ; 
        (ImmediateAST, string) tmp__368 ; 
        System.Collections.Generic.List<(ImmediateAST, string)> tmp__367 ; 
        tmp__367 = ( System.Collections.Generic.List<(ImmediateAST, string)> ) _localctx.local__1_lhs_seq_case0.result ; 
        tmp__369 = ( ImmediateAST ) _localctx.local__2_lhs_seq_case0.result ; 
        tmp__370 = ( string ) _localctx.local__3_lhs_seq_case0.result ; 
        tmp__368 = ( tmp__369 , tmp__370 ); 
        tmp__371 = (System.Collections.Generic.List<(ImmediateAST, string)>) append<(ImmediateAST, string)>( tmp__367, tmp__368 ); 
        $result = tmp__371; 
      } 
    | local__1_lhs_seq_case1=lhs local__2_lhs_seq_case1=gen__optional_ibinop '=' { 
        string tmp__375 ; 
        ImmediateAST tmp__374 ; 
        (ImmediateAST, string) tmp__373 ; 
        System.Collections.Generic.List<(ImmediateAST, string)> tmp__372 ; 
        tmp__374 = ( ImmediateAST ) _localctx.local__1_lhs_seq_case1.result ; 
        tmp__375 = ( string ) _localctx.local__2_lhs_seq_case1.result ; 
        tmp__373 = ( tmp__374 , tmp__375 ); 
        tmp__372 = new System.Collections.Generic.List<(ImmediateAST, string)> { tmp__373 }; 
        $result = tmp__372; 
      } 
    | local__1_lhs_seq_case2=lhs2 '=' { 
        ImmediateAST tmp__378 ; 
        (ImmediateAST, string) tmp__377 ; 
        System.Collections.Generic.List<(ImmediateAST, string)> tmp__376 ; 
        tmp__378 = ( ImmediateAST ) _localctx.local__1_lhs_seq_case2.result ; 
        tmp__377 = ( tmp__378 , null ); 
        tmp__376 = new System.Collections.Generic.List<(ImmediateAST, string)> { tmp__377 }; 
        $result = tmp__376; 
      } 
    | local__1_lhs_seq_case3=lhs_seq local__2_lhs_seq_case3=lhs2 '=' { 
        System.Collections.Generic.List<(ImmediateAST, string)> tmp__382 ; 
        ImmediateAST tmp__381 ; 
        (ImmediateAST, string) tmp__380 ; 
        System.Collections.Generic.List<(ImmediateAST, string)> tmp__379 ; 
        tmp__379 = ( System.Collections.Generic.List<(ImmediateAST, string)> ) _localctx.local__1_lhs_seq_case3.result ; 
        tmp__381 = ( ImmediateAST ) _localctx.local__2_lhs_seq_case3.result ; 
        tmp__380 = ( tmp__381 , null ); 
        tmp__382 = (System.Collections.Generic.List<(ImmediateAST, string)>) append<(ImmediateAST, string)>( tmp__379, tmp__380 ); 
        $result = tmp__382; 
      } 
; 
gen__optional_ibinop returns [string result] :
      local__1_gen__optional_ibinop_case0=ibinop { 
        string tmp__383 ; 
        tmp__383 = ( string ) _localctx.local__1_gen__optional_ibinop_case0.result ; 
        $result = tmp__383; 
      } 
    | { 
        $result = null; 
      } 
; 
start returns [System.Collections.Generic.List<ImmediateAST> result] :
      gen__optional_newline local__2_start_case0=gen__nullable_gen__seplist_newline__stmt gen__optional_newline EOF { 
        System.Collections.Generic.List<ImmediateAST> tmp__384 ; 
        tmp__384 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__2_start_case0.result ; 
        $result = tmp__384; 
      } 
; 
gen__nullable_gen__seplist_newline__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__nullable_gen__seplist_newline__stmt_case0=gen__seplist_newline__stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__385 ; 
        tmp__385 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist_newline__stmt_case0.result ; 
        $result = tmp__385; 
      } 
    | { 
        System.Collections.Generic.List<ImmediateAST> tmp__386 ; 
        tmp__386 = (System.Collections.Generic.List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__386; 
      } 
; 
gen__seplist_newline__stmt returns [System.Collections.Generic.List<ImmediateAST> result] :
      local__1_gen__seplist_newline__stmt_case0=stmt { 
        ImmediateAST tmp__388 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__387 ; 
        tmp__388 = ( ImmediateAST ) _localctx.local__1_gen__seplist_newline__stmt_case0.result ; 
        tmp__387 = new System.Collections.Generic.List<ImmediateAST> { tmp__388 }; 
        $result = tmp__387; 
      } 
    | local__1_gen__seplist_newline__stmt_case1=gen__seplist_newline__stmt newline local__3_gen__seplist_newline__stmt_case1=stmt { 
        System.Collections.Generic.List<ImmediateAST> tmp__391 ; 
        ImmediateAST tmp__390 ; 
        System.Collections.Generic.List<ImmediateAST> tmp__389 ; 
        tmp__389 = ( System.Collections.Generic.List<ImmediateAST> ) _localctx.local__1_gen__seplist_newline__stmt_case1.result ; 
        tmp__390 = ( ImmediateAST ) _localctx.local__3_gen__seplist_newline__stmt_case1.result ; 
        tmp__391 = (System.Collections.Generic.List<ImmediateAST>) append<ImmediateAST>( tmp__389, tmp__390 ); 
        $result = tmp__391; 
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
fragment UCODE_12 : [\u0061-\u007A]|[\u0041-\u005A]|'_'|[\u4e00-\u9fa5]|'☆';
NAME_13 : UCODE_12 (DIGIT_6|UCODE_12)*;
WS_INLINE_14 : (' '|'\t')+ -> skip;
fragment CR_15 : '\r';
fragment LF_16 : '\n';
NEWLINE_17 : (CR_15? LF_16)+ (WS_INLINE_14|(CR_15? LF_16))*;


