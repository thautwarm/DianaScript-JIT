grammar DianaScript;
options { language = CSharp; }
atom returns [ImmediateAST result] :
      local__1_atom_case0=atom local__2_atom_case0='.' '[' local__4_atom_case0=expr ']' { 
        ImmediateAST tmp__4 ; 
        ImmediateAST tmp__3 ; 
        ImmediateAST tmp__2 ; 
        CommonToken tmp__1 ; 
        tmp__1 = ( CommonToken ) _localctx.local__2_atom_case0 ; 
        tmp__2 = ( ImmediateAST ) _localctx.local__1_atom_case0.result ; 
        tmp__3 = ( ImmediateAST ) _localctx.local__4_atom_case0.result ; 
        tmp__4 = (ImmediateAST) mkOGet( tmp__1, tmp__2, tmp__3 ); 
        $result = tmp__4; 
      } 
    | local__1_atom_case1=atom local__2_atom_case1='.' local__3_atom_case1=NAME_13 { 
        ImmediateAST tmp__11 ; 
        ImmediateAST tmp__10 ; 
        DObj tmp__9 ; 
        CommonToken tmp__8 ; 
        CommonToken tmp__7 ; 
        ImmediateAST tmp__6 ; 
        CommonToken tmp__5 ; 
        tmp__5 = ( CommonToken ) _localctx.local__2_atom_case1 ; 
        tmp__6 = ( ImmediateAST ) _localctx.local__1_atom_case1.result ; 
        tmp__7 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__8 = ( CommonToken ) _localctx.local__3_atom_case1 ; 
        tmp__9 = (DObj) mkstr( tmp__8.Text ); 
        tmp__10 = (ImmediateAST) mkVal( tmp__7, tmp__9 ); 
        tmp__11 = (ImmediateAST) mkOGet( tmp__5, tmp__6, tmp__10 ); 
        $result = tmp__11; 
      } 
    | local__1_atom_case2=atom local__2_atom_case2='(' local__3_atom_case2=gen__nullable_gen__seplist__L44__expr ')' { 
        ImmediateAST tmp__15 ; 
        List<ImmediateAST> tmp__14 ; 
        ImmediateAST tmp__13 ; 
        CommonToken tmp__12 ; 
        tmp__12 = ( CommonToken ) _localctx.local__2_atom_case2 ; 
        tmp__13 = ( ImmediateAST ) _localctx.local__1_atom_case2.result ; 
        tmp__14 = ( List<ImmediateAST> ) _localctx.local__3_atom_case2.result ; 
        tmp__15 = (ImmediateAST) mkApp( tmp__12, tmp__13, tmp__14 ); 
        $result = tmp__15; 
      } 
    | local__1_atom_case3='[' local__2_atom_case3=gen__nullable_gen__seplist__L44__expr ']' { 
        ImmediateAST tmp__18 ; 
        List<ImmediateAST> tmp__17 ; 
        CommonToken tmp__16 ; 
        tmp__16 = ( CommonToken ) _localctx.local__1_atom_case3 ; 
        tmp__17 = ( List<ImmediateAST> ) _localctx.local__2_atom_case3.result ; 
        tmp__18 = (ImmediateAST) mkList( tmp__16, tmp__17 ); 
        $result = tmp__18; 
      } 
    | local__1_atom_case4='(' local__2_atom_case4=gen__nullable_gen__seplist__L44__expr local__3_atom_case4=trailer ')' { 
        ImmediateAST tmp__22 ; 
        bool tmp__21 ; 
        List<ImmediateAST> tmp__20 ; 
        CommonToken tmp__19 ; 
        tmp__19 = ( CommonToken ) _localctx.local__1_atom_case4 ; 
        tmp__20 = ( List<ImmediateAST> ) _localctx.local__2_atom_case4.result ; 
        tmp__21 = ( bool ) _localctx.local__3_atom_case4.result ; 
        tmp__22 = (ImmediateAST) mkTuple( tmp__19, tmp__20, tmp__21 ); 
        $result = tmp__22; 
      } 
    | local__1_atom_case5='{' local__2_atom_case5=gen__nullable_gen__seplist__L44__pair trailer '}' { 
        ImmediateAST tmp__25 ; 
        List<(ImmediateAST, ImmediateAST)> tmp__24 ; 
        CommonToken tmp__23 ; 
        tmp__23 = ( CommonToken ) _localctx.local__1_atom_case5 ; 
        tmp__24 = ( List<(ImmediateAST, ImmediateAST)> ) _localctx.local__2_atom_case5.result ; 
        tmp__25 = (ImmediateAST) mkDict( tmp__23, tmp__24 ); 
        $result = tmp__25; 
      } 
    | local__1_atom_case6=STR_4 { 
        ImmediateAST tmp__29 ; 
        DObj tmp__28 ; 
        CommonToken tmp__27 ; 
        CommonToken tmp__26 ; 
        tmp__26 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__27 = ( CommonToken ) _localctx.local__1_atom_case6 ; 
        tmp__28 = (DObj) mkstr( tmp__27.Text ); 
        tmp__29 = (ImmediateAST) mkVal( tmp__26, tmp__28 ); 
        $result = tmp__29; 
      } 
    | local__1_atom_case7=INT_10 { 
        ImmediateAST tmp__34 ; 
        DObj tmp__33 ; 
        int tmp__32 ; 
        CommonToken tmp__31 ; 
        CommonToken tmp__30 ; 
        tmp__30 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__31 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__32 = 64 ; 
        tmp__33 = (DObj) mkint( tmp__31.Text, tmp__32 ); 
        tmp__34 = (ImmediateAST) mkVal( tmp__30, tmp__33 ); 
        $result = tmp__34; 
      } 
    | local__1_atom_case8=FLOAT_11 { 
        ImmediateAST tmp__38 ; 
        DObj tmp__37 ; 
        CommonToken tmp__36 ; 
        CommonToken tmp__35 ; 
        tmp__35 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__36 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__37 = (DObj) mkfloat( tmp__36.Text ); 
        tmp__38 = (ImmediateAST) mkVal( tmp__35, tmp__37 ); 
        $result = tmp__38; 
      } 
    | local__1_atom_case9='None' { 
        ImmediateAST tmp__41 ; 
        DObj tmp__40 ; 
        CommonToken tmp__39 ; 
        tmp__39 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__40 = (DObj) mknone(  ); 
        tmp__41 = (ImmediateAST) mkVal( tmp__39, tmp__40 ); 
        $result = tmp__41; 
      } 
    | local__1_atom_case10=NAME_13 { 
        ImmediateAST tmp__44 ; 
        CommonToken tmp__43 ; 
        CommonToken tmp__42 ; 
        tmp__42 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__43 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__44 = (ImmediateAST) mkVar( tmp__42, tmp__43.Text ); 
        $result = tmp__44; 
      } 
    | local__1_atom_case11='-' local__2_atom_case11=atom { 
        ImmediateAST tmp__47 ; 
        ImmediateAST tmp__46 ; 
        CommonToken tmp__45 ; 
        tmp__45 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__46 = ( ImmediateAST ) _localctx.local__2_atom_case11.result ; 
        tmp__47 = (ImmediateAST) mkNeg( tmp__45, tmp__46 ); 
        $result = tmp__47; 
      } 
    | local__1_atom_case12='~' local__2_atom_case12=atom { 
        ImmediateAST tmp__50 ; 
        ImmediateAST tmp__49 ; 
        CommonToken tmp__48 ; 
        tmp__48 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__49 = ( ImmediateAST ) _localctx.local__2_atom_case12.result ; 
        tmp__50 = (ImmediateAST) mkInv( tmp__48, tmp__49 ); 
        $result = tmp__50; 
      } 
    | local__1_atom_case13='if' local__2_atom_case13=expr local__3_atom_case13=then local__4_atom_case13=block 'end' { 
        ImmediateAST tmp__56 ; 
        ImmediateAST tmp__55 ; 
        List<ImmediateAST> tmp__54 ; 
        CommonToken tmp__53 ; 
        ImmediateAST tmp__52 ; 
        CommonToken tmp__51 ; 
        tmp__51 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__52 = ( ImmediateAST ) _localctx.local__2_atom_case13.result ; 
        tmp__53 = ( CommonToken ) _localctx.local__3_atom_case13.result ; 
        tmp__54 = ( List<ImmediateAST> ) _localctx.local__4_atom_case13.result ; 
        tmp__55 = (ImmediateAST) mkBlock( tmp__53, tmp__54 ); 
        tmp__56 = (ImmediateAST) mkIfThen( tmp__51, tmp__52, tmp__55 ); 
        $result = tmp__56; 
      } 
    | local__1_atom_case14='if' local__2_atom_case14=expr local__3_atom_case14=then local__4_atom_case14=block local__5_atom_case14=gen__nullable_gen__list_gen__snd_elif__elifBlock local__6_atom_case14=gen__optional_gen__blockOf_else 'end' { 
        ImmediateAST tmp__68 ; 
        ImmediateAST tmp__67 ; 
        CommonToken tmp__66 ; 
        List<(ImmediateAST, ImmediateAST)> elifs__64 ; 
        List<(ImmediateAST, ImmediateAST)> tmp__65 ; 
        List<(ImmediateAST, ImmediateAST)> elifs__62 ; 
        List<(ImmediateAST, ImmediateAST)> tmp__63 ; 
        ImmediateAST tmp__61 ; 
        List<ImmediateAST> tmp__60 ; 
        CommonToken tmp__59 ; 
        ImmediateAST tmp__58 ; 
        (ImmediateAST, ImmediateAST) elif__57 ; 
        tmp__58 = ( ImmediateAST ) _localctx.local__2_atom_case14.result ; 
        tmp__59 = ( CommonToken ) _localctx.local__3_atom_case14.result ; 
        tmp__60 = ( List<ImmediateAST> ) _localctx.local__4_atom_case14.result ; 
        tmp__61 = (ImmediateAST) mkBlock( tmp__59, tmp__60 ); 
        elif__57 = ( tmp__58 , tmp__61 ); 
        tmp__63 = (List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        elifs__62 = (List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__63, elif__57 ); 
        tmp__65 = ( List<(ImmediateAST, ImmediateAST)> ) _localctx.local__5_atom_case14.result ; 
        elifs__64 = (List<(ImmediateAST, ImmediateAST)>) extend<(ImmediateAST, ImmediateAST)>( elifs__62, tmp__65 ); 
        tmp__66 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__67 = ( ImmediateAST ) _localctx.local__6_atom_case14.result ; 
        tmp__68 = (ImmediateAST) mkNestedIf( tmp__66, elifs__62, tmp__67 ); 
        $result = tmp__68; 
      } 
    | local__1_atom_case15='func' local__2_atom_case15=name '(' local__4_atom_case15=gen__nullable_gen__seplist__L44__name ')' local__6_atom_case15=block 'end' { 
        ImmediateAST tmp__73 ; 
        List<ImmediateAST> tmp__72 ; 
        List<string> tmp__71 ; 
        string tmp__70 ; 
        CommonToken tmp__69 ; 
        tmp__69 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__70 = ( string ) _localctx.local__2_atom_case15.result ; 
        tmp__71 = ( List<string> ) _localctx.local__4_atom_case15.result ; 
        tmp__72 = ( List<ImmediateAST> ) _localctx.local__6_atom_case15.result ; 
        tmp__73 = (ImmediateAST) mkFunc( tmp__69, tmp__70, tmp__71, tmp__72 ); 
        $result = tmp__73; 
      } 
; 
gen__nullable_gen__seplist__L44__name returns [List<string> result] :
      { 
        List<string> tmp__74 ; 
        tmp__74 = (List<string>) empty<string>(  ); 
        $result = tmp__74; 
      } 
    | local__1_gen__nullable_gen__seplist__L44__name_case1=gen__seplist__L44__name { 
        List<string> tmp__75 ; 
        tmp__75 = ( List<string> ) _localctx.local__1_gen__nullable_gen__seplist__L44__name_case1.result ; 
        $result = tmp__75; 
      } 
; 
gen__seplist__L44__name returns [List<string> result] :
      local__1_gen__seplist__L44__name_case0=name { 
        List<string> tmp__78 ; 
        string tmp__77 ; 
        List<string> tmp__76 ; 
        tmp__76 = (List<string>) empty<string>(  ); 
        tmp__77 = ( string ) _localctx.local__1_gen__seplist__L44__name_case0.result ; 
        tmp__78 = (List<string>) append<string>( tmp__76, tmp__77 ); 
        $result = tmp__78; 
      } 
    | local__1_gen__seplist__L44__name_case1=gen__seplist__L44__name ',' local__3_gen__seplist__L44__name_case1=name { 
        List<string> tmp__81 ; 
        string tmp__80 ; 
        List<string> tmp__79 ; 
        tmp__79 = ( List<string> ) _localctx.local__1_gen__seplist__L44__name_case1.result ; 
        tmp__80 = ( string ) _localctx.local__3_gen__seplist__L44__name_case1.result ; 
        tmp__81 = (List<string>) append<string>( tmp__79, tmp__80 ); 
        $result = tmp__81; 
      } 
; 
gen__optional_gen__blockOf_else returns [ImmediateAST result] :
      { 
        $result = null; 
      } 
    | local__1_gen__optional_gen__blockOf_else_case1=gen__blockOf_else { 
        ImmediateAST tmp__82 ; 
        tmp__82 = ( ImmediateAST ) _localctx.local__1_gen__optional_gen__blockOf_else_case1.result ; 
        $result = tmp__82; 
      } 
; 
gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__blockOf_else_case0='else' local__2_gen__blockOf_else_case0=block { 
        ImmediateAST tmp__85 ; 
        List<ImmediateAST> tmp__84 ; 
        CommonToken tmp__83 ; 
        tmp__83 = ( CommonToken ) _localctx.local__1_gen__blockOf_else_case0 ; 
        tmp__84 = ( List<ImmediateAST> ) _localctx.local__2_gen__blockOf_else_case0.result ; 
        tmp__85 = (ImmediateAST) mkBlock( tmp__83, tmp__84 ); 
        $result = tmp__85; 
      } 
; 
gen__nullable_gen__list_gen__snd_elif__elifBlock returns [List<(ImmediateAST, ImmediateAST)> result] :
      { 
        List<(ImmediateAST, ImmediateAST)> tmp__86 ; 
        tmp__86 = (List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__86; 
      } 
    | local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock { 
        List<(ImmediateAST, ImmediateAST)> tmp__87 ; 
        tmp__87 = ( List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        $result = tmp__87; 
      } 
; 
gen__list_gen__snd_elif__elifBlock returns [List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__list_gen__snd_elif__elifBlock_case0=gen__snd_elif__elifBlock { 
        List<(ImmediateAST, ImmediateAST)> tmp__90 ; 
        (ImmediateAST, ImmediateAST) tmp__89 ; 
        List<(ImmediateAST, ImmediateAST)> tmp__88 ; 
        tmp__88 = (List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        tmp__89 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        tmp__90 = (List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__88, tmp__89 ); 
        $result = tmp__90; 
      } 
    | local__1_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock local__2_gen__list_gen__snd_elif__elifBlock_case1=gen__snd_elif__elifBlock { 
        List<(ImmediateAST, ImmediateAST)> tmp__93 ; 
        (ImmediateAST, ImmediateAST) tmp__92 ; 
        List<(ImmediateAST, ImmediateAST)> tmp__91 ; 
        tmp__91 = ( List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__92 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__93 = (List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__91, tmp__92 ); 
        $result = tmp__93; 
      } 
; 
gen__snd_elif__elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      'elif' local__2_gen__snd_elif__elifBlock_case0=elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__94 ; 
        tmp__94 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__94; 
      } 
; 
gen__nullable_gen__seplist__L44__pair returns [List<(ImmediateAST, ImmediateAST)> result] :
      { 
        List<(ImmediateAST, ImmediateAST)> tmp__95 ; 
        tmp__95 = (List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__95; 
      } 
    | local__1_gen__nullable_gen__seplist__L44__pair_case1=gen__seplist__L44__pair { 
        List<(ImmediateAST, ImmediateAST)> tmp__96 ; 
        tmp__96 = ( List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__seplist__L44__pair_case1.result ; 
        $result = tmp__96; 
      } 
; 
gen__seplist__L44__pair returns [List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__seplist__L44__pair_case0=pair { 
        List<(ImmediateAST, ImmediateAST)> tmp__99 ; 
        (ImmediateAST, ImmediateAST) tmp__98 ; 
        List<(ImmediateAST, ImmediateAST)> tmp__97 ; 
        tmp__97 = (List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        tmp__98 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__seplist__L44__pair_case0.result ; 
        tmp__99 = (List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__97, tmp__98 ); 
        $result = tmp__99; 
      } 
    | local__1_gen__seplist__L44__pair_case1=gen__seplist__L44__pair ',' local__3_gen__seplist__L44__pair_case1=pair { 
        List<(ImmediateAST, ImmediateAST)> tmp__102 ; 
        (ImmediateAST, ImmediateAST) tmp__101 ; 
        List<(ImmediateAST, ImmediateAST)> tmp__100 ; 
        tmp__100 = ( List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__seplist__L44__pair_case1.result ; 
        tmp__101 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__3_gen__seplist__L44__pair_case1.result ; 
        tmp__102 = (List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__100, tmp__101 ); 
        $result = tmp__102; 
      } 
; 
gen__nullable_gen__seplist__L44__expr returns [List<ImmediateAST> result] :
      { 
        List<ImmediateAST> tmp__103 ; 
        tmp__103 = (List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__103; 
      } 
    | local__1_gen__nullable_gen__seplist__L44__expr_case1=gen__seplist__L44__expr { 
        List<ImmediateAST> tmp__104 ; 
        tmp__104 = ( List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist__L44__expr_case1.result ; 
        $result = tmp__104; 
      } 
; 
gen__seplist__L44__expr returns [List<ImmediateAST> result] :
      local__1_gen__seplist__L44__expr_case0=expr { 
        List<ImmediateAST> tmp__107 ; 
        ImmediateAST tmp__106 ; 
        List<ImmediateAST> tmp__105 ; 
        tmp__105 = (List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__106 = ( ImmediateAST ) _localctx.local__1_gen__seplist__L44__expr_case0.result ; 
        tmp__107 = (List<ImmediateAST>) append<ImmediateAST>( tmp__105, tmp__106 ); 
        $result = tmp__107; 
      } 
    | local__1_gen__seplist__L44__expr_case1=gen__seplist__L44__expr ',' local__3_gen__seplist__L44__expr_case1=expr { 
        List<ImmediateAST> tmp__110 ; 
        ImmediateAST tmp__109 ; 
        List<ImmediateAST> tmp__108 ; 
        tmp__108 = ( List<ImmediateAST> ) _localctx.local__1_gen__seplist__L44__expr_case1.result ; 
        tmp__109 = ( ImmediateAST ) _localctx.local__3_gen__seplist__L44__expr_case1.result ; 
        tmp__110 = (List<ImmediateAST>) append<ImmediateAST>( tmp__108, tmp__109 ); 
        $result = tmp__110; 
      } 
; 
pair returns [(ImmediateAST, ImmediateAST) result] :
      local__1_pair_case0=expr ':' local__3_pair_case0=expr { 
        ImmediateAST tmp__113 ; 
        ImmediateAST tmp__112 ; 
        (ImmediateAST, ImmediateAST) tmp__111 ; 
        tmp__112 = ( ImmediateAST ) _localctx.local__1_pair_case0.result ; 
        tmp__113 = ( ImmediateAST ) _localctx.local__3_pair_case0.result ; 
        tmp__111 = ( tmp__112 , tmp__113 ); 
        $result = tmp__111; 
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
        ImmediateAST tmp__115 ; 
        List<object> tmp__114 ; 
        tmp__114 = ( List<object> ) _localctx.local__1_bin_case0.result ; 
        tmp__115 = (ImmediateAST) resolve_binop( tmp__114 ); 
        $result = tmp__115; 
      } 
; 
binseq returns [List<object> result] :
      local__1_binseq_case0=atom { 
        List<object> tmp__119 ; 
        object tmp__118 ; 
        ImmediateAST tmp__117 ; 
        List<object> tmp__116 ; 
        tmp__116 = (List<object>) empty<object>(  ); 
        tmp__117 = ( ImmediateAST ) _localctx.local__1_binseq_case0.result ; 
        tmp__118 = (object) to_obj<ImmediateAST>( tmp__117 ); 
        tmp__119 = (List<object>) append<object>( tmp__116, tmp__118 ); 
        $result = tmp__119; 
      } 
    | local__1_binseq_case1=binseq local__2_binseq_case1=binop local__3_binseq_case1=atom { 
        object tmp__125 ; 
        ImmediateAST tmp__124 ; 
        List<object> tmp__123 ; 
        List<object> block__120 ; 
        object tmp__122 ; 
        List<object> tmp__121 ; 
        tmp__121 = ( List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__122 = ( object ) _localctx.local__2_binseq_case1.result ; 
        block__120 = (List<object>) append<object>( tmp__121, tmp__122 ); 
        tmp__123 = ( List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__124 = ( ImmediateAST ) _localctx.local__3_binseq_case1.result ; 
        tmp__125 = (object) to_obj<ImmediateAST>( tmp__124 ); 
        block__120 = (List<object>) append<object>( tmp__123, tmp__125 ); 
        $result = block__120; 
      } 
; 
binop returns [object result] :
      local__1_binop_case0=SINGLE_BINOP_2 { 
        object tmp__128 ; 
        CommonToken tmp__127 ; 
        CommonToken tmp__126 ; 
        tmp__126 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__127 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__128 = (object) mkop( tmp__126, tmp__127.Text ); 
        $result = tmp__128; 
      } 
    | local__1_binop_case1='not' 'in' { 
        object tmp__131 ; 
        string tmp__130 ; 
        CommonToken tmp__129 ; 
        tmp__129 = ( CommonToken ) _localctx.local__1_binop_case1 ; 
        tmp__130 = "notin" ; 
        tmp__131 = (object) mkop( tmp__129, tmp__130 ); 
        $result = tmp__131; 
      } 
    | local__1_binop_case2='in' { 
        object tmp__134 ; 
        string tmp__133 ; 
        CommonToken tmp__132 ; 
        tmp__132 = ( CommonToken ) _localctx.local__1_binop_case2 ; 
        tmp__133 = "in" ; 
        tmp__134 = (object) mkop( tmp__132, tmp__133 ); 
        $result = tmp__134; 
      } 
    | local__1_binop_case3='-' { 
        object tmp__137 ; 
        string tmp__136 ; 
        CommonToken tmp__135 ; 
        tmp__135 = ( CommonToken ) _localctx.local__1_binop_case3 ; 
        tmp__136 = "-" ; 
        tmp__137 = (object) mkop( tmp__135, tmp__136 ); 
        $result = tmp__137; 
      } 
; 
not returns [ImmediateAST result] :
      local__1_not_case0='not' local__2_not_case0=bin { 
        ImmediateAST tmp__140 ; 
        ImmediateAST tmp__139 ; 
        CommonToken tmp__138 ; 
        tmp__138 = ( CommonToken ) _localctx.local__1_not_case0 ; 
        tmp__139 = ( ImmediateAST ) _localctx.local__2_not_case0.result ; 
        tmp__140 = (ImmediateAST) mkNot( tmp__138, tmp__139 ); 
        $result = tmp__140; 
      } 
    | local__1_not_case1=bin { 
        ImmediateAST tmp__141 ; 
        tmp__141 = ( ImmediateAST ) _localctx.local__1_not_case1.result ; 
        $result = tmp__141; 
      } 
; 
and_expr returns [ImmediateAST result] :
      local__1_and_expr_case0=and_expr local__2_and_expr_case0='and' local__3_and_expr_case0=not { 
        ImmediateAST tmp__145 ; 
        ImmediateAST tmp__144 ; 
        ImmediateAST tmp__143 ; 
        CommonToken tmp__142 ; 
        tmp__142 = ( CommonToken ) _localctx.local__2_and_expr_case0 ; 
        tmp__143 = ( ImmediateAST ) _localctx.local__1_and_expr_case0.result ; 
        tmp__144 = ( ImmediateAST ) _localctx.local__3_and_expr_case0.result ; 
        tmp__145 = (ImmediateAST) mkAnd( tmp__142, tmp__143, tmp__144 ); 
        $result = tmp__145; 
      } 
    | local__1_and_expr_case1=not { 
        ImmediateAST tmp__146 ; 
        tmp__146 = ( ImmediateAST ) _localctx.local__1_and_expr_case1.result ; 
        $result = tmp__146; 
      } 
; 
or_expr returns [ImmediateAST result] :
      local__1_or_expr_case0=or_expr local__2_or_expr_case0='or' local__3_or_expr_case0=and_expr { 
        ImmediateAST tmp__150 ; 
        ImmediateAST tmp__149 ; 
        ImmediateAST tmp__148 ; 
        CommonToken tmp__147 ; 
        tmp__147 = ( CommonToken ) _localctx.local__2_or_expr_case0 ; 
        tmp__148 = ( ImmediateAST ) _localctx.local__1_or_expr_case0.result ; 
        tmp__149 = ( ImmediateAST ) _localctx.local__3_or_expr_case0.result ; 
        tmp__150 = (ImmediateAST) mkAnd( tmp__147, tmp__148, tmp__149 ); 
        $result = tmp__150; 
      } 
    | local__1_or_expr_case1=and_expr { 
        ImmediateAST tmp__151 ; 
        tmp__151 = ( ImmediateAST ) _localctx.local__1_or_expr_case1.result ; 
        $result = tmp__151; 
      } 
; 
expr returns [ImmediateAST result] :
      local__1_expr_case0=or_expr { 
        ImmediateAST tmp__152 ; 
        tmp__152 = ( ImmediateAST ) _localctx.local__1_expr_case0.result ; 
        $result = tmp__152; 
      } 
; 
block returns [List<ImmediateAST> result] :
      local__1_block_case0=gen__filter_stmt__NEWLINE { 
        List<ImmediateAST> tmp__153 ; 
        tmp__153 = ( List<ImmediateAST> ) _localctx.local__1_block_case0.result ; 
        $result = tmp__153; 
      } 
; 
gen__filter_stmt__NEWLINE returns [List<ImmediateAST> result] :
      local__1_gen__filter_stmt__NEWLINE_case0=gen__filter_stmt__NEWLINE local__2_gen__filter_stmt__NEWLINE_case0=stmt { 
        List<ImmediateAST> tmp__156 ; 
        ImmediateAST tmp__155 ; 
        List<ImmediateAST> tmp__154 ; 
        tmp__154 = ( List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__NEWLINE_case0.result ; 
        tmp__155 = ( ImmediateAST ) _localctx.local__2_gen__filter_stmt__NEWLINE_case0.result ; 
        tmp__156 = (List<ImmediateAST>) append<ImmediateAST>( tmp__154, tmp__155 ); 
        $result = tmp__156; 
      } 
    | local__1_gen__filter_stmt__NEWLINE_case1=gen__filter_stmt__NEWLINE NEWLINE_17 { 
        List<ImmediateAST> tmp__157 ; 
        tmp__157 = ( List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__NEWLINE_case1.result ; 
        $result = tmp__157; 
      } 
    | local__1_gen__filter_stmt__NEWLINE_case2=stmt { 
        List<ImmediateAST> tmp__160 ; 
        ImmediateAST tmp__159 ; 
        List<ImmediateAST> tmp__158 ; 
        tmp__158 = (List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__159 = ( ImmediateAST ) _localctx.local__1_gen__filter_stmt__NEWLINE_case2.result ; 
        tmp__160 = (List<ImmediateAST>) append<ImmediateAST>( tmp__158, tmp__159 ); 
        $result = tmp__160; 
      } 
    | NEWLINE_17 { 
        List<ImmediateAST> tmp__161 ; 
        tmp__161 = (List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__161; 
      } 
; 
lhs returns [ImmediateAST result] :
      local__1_lhs_case0=NAME_13 { 
        ImmediateAST tmp__164 ; 
        CommonToken tmp__163 ; 
        CommonToken tmp__162 ; 
        tmp__162 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__163 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__164 = (ImmediateAST) mkVar( tmp__162, tmp__163.Text ); 
        $result = tmp__164; 
      } 
    | local__1_lhs_case1=atom local__2_lhs_case1='.' '[' local__4_lhs_case1=expr ']' { 
        ImmediateAST tmp__168 ; 
        ImmediateAST tmp__167 ; 
        ImmediateAST tmp__166 ; 
        CommonToken tmp__165 ; 
        tmp__165 = ( CommonToken ) _localctx.local__2_lhs_case1 ; 
        tmp__166 = ( ImmediateAST ) _localctx.local__1_lhs_case1.result ; 
        tmp__167 = ( ImmediateAST ) _localctx.local__4_lhs_case1.result ; 
        tmp__168 = (ImmediateAST) mkOGet( tmp__165, tmp__166, tmp__167 ); 
        $result = tmp__168; 
      } 
    | local__1_lhs_case2=atom local__2_lhs_case2='.' local__3_lhs_case2=NAME_13 { 
        ImmediateAST tmp__175 ; 
        ImmediateAST tmp__174 ; 
        DObj tmp__173 ; 
        CommonToken tmp__172 ; 
        CommonToken tmp__171 ; 
        ImmediateAST tmp__170 ; 
        CommonToken tmp__169 ; 
        tmp__169 = ( CommonToken ) _localctx.local__2_lhs_case2 ; 
        tmp__170 = ( ImmediateAST ) _localctx.local__1_lhs_case2.result ; 
        tmp__171 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__172 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__173 = (DObj) mkstr( tmp__172.Text ); 
        tmp__174 = (ImmediateAST) mkVal( tmp__171, tmp__173 ); 
        tmp__175 = (ImmediateAST) mkOGet( tmp__169, tmp__170, tmp__174 ); 
        $result = tmp__175; 
      } 
; 
do returns [CommonToken result] :
      gen__optional_NEWLINE local__2_do_case0='do' { 
        CommonToken tmp__176 ; 
        tmp__176 = ( CommonToken ) _localctx.local__2_do_case0 ; 
        $result = tmp__176; 
      } 
; 
gen__optional_NEWLINE returns [CommonToken result] :
      { 
        $result = null; 
      } 
    | local__1_gen__optional_NEWLINE_case1=NEWLINE_17 { 
        CommonToken tmp__177 ; 
        tmp__177 = ( CommonToken ) _localctx.local__1_gen__optional_NEWLINE_case1 ; 
        $result = tmp__177; 
      } 
; 
then returns [CommonToken result] :
      gen__optional_NEWLINE local__2_then_case0='then' { 
        CommonToken tmp__178 ; 
        tmp__178 = ( CommonToken ) _localctx.local__2_then_case0 ; 
        $result = tmp__178; 
      } 
; 
stmt returns [ImmediateAST result] :
      local__1_stmt_case0=lhs_seq local__2_stmt_case0=expr { 
        ImmediateAST tmp__181 ; 
        ImmediateAST tmp__180 ; 
        List<ImmediateAST> tmp__179 ; 
        tmp__179 = ( List<ImmediateAST> ) _localctx.local__1_stmt_case0.result ; 
        tmp__180 = ( ImmediateAST ) _localctx.local__2_stmt_case0.result ; 
        tmp__181 = (ImmediateAST) mkStoreMany( tmp__179, tmp__180 ); 
        $result = tmp__181; 
      } 
    | local__1_stmt_case1='loop' local__2_stmt_case1=block 'end' { 
        ImmediateAST tmp__186 ; 
        ImmediateAST tmp__185 ; 
        List<ImmediateAST> tmp__184 ; 
        CommonToken tmp__183 ; 
        CommonToken tmp__182 ; 
        tmp__182 = ( CommonToken ) _localctx.local__1_stmt_case1 ; 
        tmp__183 = ( CommonToken ) _localctx.local__1_stmt_case1 ; 
        tmp__184 = ( List<ImmediateAST> ) _localctx.local__2_stmt_case1.result ; 
        tmp__185 = (ImmediateAST) mkBlock( tmp__183, tmp__184 ); 
        tmp__186 = (ImmediateAST) mkLoop( tmp__182, tmp__185 ); 
        $result = tmp__186; 
      } 
    | local__1_stmt_case2='for' local__2_stmt_case2=NAME_13 'in' local__4_stmt_case2=expr local__5_stmt_case2=gen__blockOf_do 'end' { 
        ImmediateAST tmp__191 ; 
        ImmediateAST tmp__190 ; 
        ImmediateAST tmp__189 ; 
        CommonToken tmp__188 ; 
        CommonToken tmp__187 ; 
        tmp__187 = ( CommonToken ) _localctx.local__1_stmt_case2 ; 
        tmp__188 = ( CommonToken ) _localctx.local__2_stmt_case2 ; 
        tmp__189 = ( ImmediateAST ) _localctx.local__4_stmt_case2.result ; 
        tmp__190 = ( ImmediateAST ) _localctx.local__5_stmt_case2.result ; 
        tmp__191 = (ImmediateAST) mkFor( tmp__187, tmp__188.Text, tmp__189, tmp__190 ); 
        $result = tmp__191; 
      } 
    | local__1_stmt_case3='break' { 
        ImmediateAST tmp__193 ; 
        CommonToken tmp__192 ; 
        tmp__192 = ( CommonToken ) _localctx.local__1_stmt_case3 ; 
        tmp__193 = (ImmediateAST) mkBreak( tmp__192 ); 
        $result = tmp__193; 
      } 
    | local__1_stmt_case4='continue' { 
        ImmediateAST tmp__195 ; 
        CommonToken tmp__194 ; 
        tmp__194 = ( CommonToken ) _localctx.local__1_stmt_case4 ; 
        tmp__195 = (ImmediateAST) mkContinue( tmp__194 ); 
        $result = tmp__195; 
      } 
    | local__1_stmt_case5='return' local__2_stmt_case5=expr { 
        ImmediateAST tmp__198 ; 
        ImmediateAST tmp__197 ; 
        CommonToken tmp__196 ; 
        tmp__196 = ( CommonToken ) _localctx.local__1_stmt_case5 ; 
        tmp__197 = ( ImmediateAST ) _localctx.local__2_stmt_case5.result ; 
        tmp__198 = (ImmediateAST) mkReturn( tmp__196, tmp__197 ); 
        $result = tmp__198; 
      } 
    | local__1_stmt_case6='return' { 
        ImmediateAST tmp__200 ; 
        CommonToken tmp__199 ; 
        tmp__199 = ( CommonToken ) _localctx.local__1_stmt_case6 ; 
        tmp__200 = (ImmediateAST) mkReturn( tmp__199, null ); 
        $result = tmp__200; 
      } 
; 
gen__blockOf_do returns [ImmediateAST result] :
      local__1_gen__blockOf_do_case0=do local__2_gen__blockOf_do_case0=block { 
        ImmediateAST tmp__203 ; 
        List<ImmediateAST> tmp__202 ; 
        CommonToken tmp__201 ; 
        tmp__201 = ( CommonToken ) _localctx.local__1_gen__blockOf_do_case0.result ; 
        tmp__202 = ( List<ImmediateAST> ) _localctx.local__2_gen__blockOf_do_case0.result ; 
        tmp__203 = (ImmediateAST) mkBlock( tmp__201, tmp__202 ); 
        $result = tmp__203; 
      } 
; 
name returns [string result] :
      local__1_name_case0=NAME_13 { 
        CommonToken tmp__204 ; 
        tmp__204 = ( CommonToken ) _localctx.local__1_name_case0 ; 
        $result = tmp__204.Text; 
      } 
; 
elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      local__1_elifBlock_case0=expr local__2_elifBlock_case0=gen__blockOf_then { 
        ImmediateAST tmp__207 ; 
        ImmediateAST tmp__206 ; 
        (ImmediateAST, ImmediateAST) tmp__205 ; 
        tmp__206 = ( ImmediateAST ) _localctx.local__1_elifBlock_case0.result ; 
        tmp__207 = ( ImmediateAST ) _localctx.local__2_elifBlock_case0.result ; 
        tmp__205 = ( tmp__206 , tmp__207 ); 
        $result = tmp__205; 
      } 
; 
gen__blockOf_then returns [ImmediateAST result] :
      local__1_gen__blockOf_then_case0=then local__2_gen__blockOf_then_case0=block { 
        ImmediateAST tmp__210 ; 
        List<ImmediateAST> tmp__209 ; 
        CommonToken tmp__208 ; 
        tmp__208 = ( CommonToken ) _localctx.local__1_gen__blockOf_then_case0.result ; 
        tmp__209 = ( List<ImmediateAST> ) _localctx.local__2_gen__blockOf_then_case0.result ; 
        tmp__210 = (ImmediateAST) mkBlock( tmp__208, tmp__209 ); 
        $result = tmp__210; 
      } 
; 
lhs_seq returns [List<ImmediateAST> result] :
      { 
        List<ImmediateAST> tmp__211 ; 
        tmp__211 = (List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__211; 
      } 
    | local__1_lhs_seq_case1=lhs_seq local__2_lhs_seq_case1=lhs '=' { 
        List<ImmediateAST> tmp__214 ; 
        ImmediateAST tmp__213 ; 
        List<ImmediateAST> tmp__212 ; 
        tmp__212 = ( List<ImmediateAST> ) _localctx.local__1_lhs_seq_case1.result ; 
        tmp__213 = ( ImmediateAST ) _localctx.local__2_lhs_seq_case1.result ; 
        tmp__214 = (List<ImmediateAST>) append<ImmediateAST>( tmp__212, tmp__213 ); 
        $result = tmp__214; 
      } 
; 
expr_opt returns [ImmediateAST result] :
      { 
        $result = null; 
      } 
    | local__1_expr_opt_case1=expr { 
        ImmediateAST tmp__215 ; 
        tmp__215 = ( ImmediateAST ) _localctx.local__1_expr_opt_case1.result ; 
        $result = tmp__215; 
      } 
; 
start returns [List<ImmediateAST> result] :
      local__1_start_case0=block EOF { 
        List<ImmediateAST> tmp__216 ; 
        tmp__216 = ( List<ImmediateAST> ) _localctx.local__1_start_case0.result ; 
        $result = tmp__216; 
      } 
; 


COMMENT_1 : '#' (~'\n')* -> skip;
SINGLE_BINOP_2 : ('<'|'>'|'>' '='|'<' '='|'=' '='|'!' '='|'+'|'*'|'*' '*'|'/'|'/' '/'|'%'|'&'|'|'|'<' '<'|'>' '>');
fragment ESCAPED_QUOTE_3 : '\\' '"';
STR_4 : '"' (ESCAPED_QUOTE_3|~'"')* '"';
fragment WS_5 : ('\r'|'\t'|'\n'|' ');
INT_10 : (DIGIT_6+|HEX_7|OCT_8|BIN_9);
fragment HEX_7 : '0' 'x' ([\u0030-\u0039]|[\u0061-\u0066])*;
fragment OCT_8 : '0' 'o' [\u0030-\u0037]*;
fragment BIN_9 : '0' 'b' [\u0030-\u0031]*;
fragment DIGIT_6 : [\u0030-\u0039];
FLOAT_11 : INT_10 '.' INT_10;
fragment UCODE_12 : [\u0061-\u007A]|[\u0041-\u005A]|'_'|[\u4e00-\u9fa5];
NAME_13 : UCODE_12 (DIGIT_6|UCODE_12)*;
WS_INLINE_14 : (' '|'\t')+ -> skip;
fragment CR_15 : '\r';
fragment LF_16 : '\n';
NEWLINE_17 : (CR_15? LF_16)+;


