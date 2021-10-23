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
    | local__1_atom_case1=atom local__2_atom_case1='.' local__3_atom_case1=NAME_10 { 
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
    | local__1_atom_case7=INT_7 { 
        ImmediateAST tmp__33 ; 
        DObj tmp__32 ; 
        CommonToken tmp__31 ; 
        CommonToken tmp__30 ; 
        tmp__30 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__31 = ( CommonToken ) _localctx.local__1_atom_case7 ; 
        tmp__32 = (DObj) mkint( tmp__31.Text ); 
        tmp__33 = (ImmediateAST) mkVal( tmp__30, tmp__32 ); 
        $result = tmp__33; 
      } 
    | local__1_atom_case8=FLOAT_8 { 
        ImmediateAST tmp__37 ; 
        DObj tmp__36 ; 
        CommonToken tmp__35 ; 
        CommonToken tmp__34 ; 
        tmp__34 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__35 = ( CommonToken ) _localctx.local__1_atom_case8 ; 
        tmp__36 = (DObj) mkfloat( tmp__35.Text ); 
        tmp__37 = (ImmediateAST) mkVal( tmp__34, tmp__36 ); 
        $result = tmp__37; 
      } 
    | local__1_atom_case9='None' { 
        ImmediateAST tmp__40 ; 
        DObj tmp__39 ; 
        CommonToken tmp__38 ; 
        tmp__38 = ( CommonToken ) _localctx.local__1_atom_case9 ; 
        tmp__39 = (DObj) mknone(  ); 
        tmp__40 = (ImmediateAST) mkVal( tmp__38, tmp__39 ); 
        $result = tmp__40; 
      } 
    | local__1_atom_case10=NAME_10 { 
        ImmediateAST tmp__43 ; 
        CommonToken tmp__42 ; 
        CommonToken tmp__41 ; 
        tmp__41 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__42 = ( CommonToken ) _localctx.local__1_atom_case10 ; 
        tmp__43 = (ImmediateAST) mkVar( tmp__41, tmp__42.Text ); 
        $result = tmp__43; 
      } 
    | local__1_atom_case11='-' local__2_atom_case11=atom { 
        ImmediateAST tmp__46 ; 
        ImmediateAST tmp__45 ; 
        CommonToken tmp__44 ; 
        tmp__44 = ( CommonToken ) _localctx.local__1_atom_case11 ; 
        tmp__45 = ( ImmediateAST ) _localctx.local__2_atom_case11.result ; 
        tmp__46 = (ImmediateAST) mkNeg( tmp__44, tmp__45 ); 
        $result = tmp__46; 
      } 
    | local__1_atom_case12='~' local__2_atom_case12=atom { 
        ImmediateAST tmp__49 ; 
        ImmediateAST tmp__48 ; 
        CommonToken tmp__47 ; 
        tmp__47 = ( CommonToken ) _localctx.local__1_atom_case12 ; 
        tmp__48 = ( ImmediateAST ) _localctx.local__2_atom_case12.result ; 
        tmp__49 = (ImmediateAST) mkInv( tmp__47, tmp__48 ); 
        $result = tmp__49; 
      } 
    | local__1_atom_case13='if' local__2_atom_case13=expr local__3_atom_case13=then local__4_atom_case13=block 'end' { 
        ImmediateAST tmp__55 ; 
        ImmediateAST tmp__54 ; 
        List<ImmediateAST> tmp__53 ; 
        CommonToken tmp__52 ; 
        ImmediateAST tmp__51 ; 
        CommonToken tmp__50 ; 
        tmp__50 = ( CommonToken ) _localctx.local__1_atom_case13 ; 
        tmp__51 = ( ImmediateAST ) _localctx.local__2_atom_case13.result ; 
        tmp__52 = ( CommonToken ) _localctx.local__3_atom_case13.result ; 
        tmp__53 = ( List<ImmediateAST> ) _localctx.local__4_atom_case13.result ; 
        tmp__54 = (ImmediateAST) mkBlock( tmp__52, tmp__53 ); 
        tmp__55 = (ImmediateAST) mkIfThen( tmp__50, tmp__51, tmp__54 ); 
        $result = tmp__55; 
      } 
    | local__1_atom_case14='if' local__2_atom_case14=expr local__3_atom_case14=then local__4_atom_case14=block local__5_atom_case14=gen__nullable_gen__list_gen__snd_elif__elifBlock local__6_atom_case14=gen__optional_gen__blockOf_else 'end' { 
        ImmediateAST tmp__67 ; 
        ImmediateAST tmp__66 ; 
        CommonToken tmp__65 ; 
        List<(ImmediateAST, ImmediateAST)> elifs__63 ; 
        List<(ImmediateAST, ImmediateAST)> tmp__64 ; 
        List<(ImmediateAST, ImmediateAST)> elifs__61 ; 
        List<(ImmediateAST, ImmediateAST)> tmp__62 ; 
        ImmediateAST tmp__60 ; 
        List<ImmediateAST> tmp__59 ; 
        CommonToken tmp__58 ; 
        ImmediateAST tmp__57 ; 
        (ImmediateAST, ImmediateAST) elif__56 ; 
        tmp__57 = ( ImmediateAST ) _localctx.local__2_atom_case14.result ; 
        tmp__58 = ( CommonToken ) _localctx.local__3_atom_case14.result ; 
        tmp__59 = ( List<ImmediateAST> ) _localctx.local__4_atom_case14.result ; 
        tmp__60 = (ImmediateAST) mkBlock( tmp__58, tmp__59 ); 
        elif__56 = ( tmp__57 , tmp__60 ); 
        tmp__62 = (List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        elifs__61 = (List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__62, elif__56 ); 
        tmp__64 = ( List<(ImmediateAST, ImmediateAST)> ) _localctx.local__5_atom_case14.result ; 
        elifs__63 = (List<(ImmediateAST, ImmediateAST)>) extend<(ImmediateAST, ImmediateAST)>( elifs__61, tmp__64 ); 
        tmp__65 = ( CommonToken ) _localctx.local__1_atom_case14 ; 
        tmp__66 = ( ImmediateAST ) _localctx.local__6_atom_case14.result ; 
        tmp__67 = (ImmediateAST) mkNestedIf( tmp__65, elifs__61, tmp__66 ); 
        $result = tmp__67; 
      } 
    | local__1_atom_case15='func' local__2_atom_case15=name '(' local__4_atom_case15=gen__nullable_gen__seplist__L44__name ')' local__6_atom_case15=block 'end' { 
        ImmediateAST tmp__72 ; 
        List<ImmediateAST> tmp__71 ; 
        List<string> tmp__70 ; 
        string tmp__69 ; 
        CommonToken tmp__68 ; 
        tmp__68 = ( CommonToken ) _localctx.local__1_atom_case15 ; 
        tmp__69 = ( string ) _localctx.local__2_atom_case15.result ; 
        tmp__70 = ( List<string> ) _localctx.local__4_atom_case15.result ; 
        tmp__71 = ( List<ImmediateAST> ) _localctx.local__6_atom_case15.result ; 
        tmp__72 = (ImmediateAST) mkFunc( tmp__68, tmp__69, tmp__70, tmp__71 ); 
        $result = tmp__72; 
      } 
; 
gen__nullable_gen__seplist__L44__name returns [List<string> result] :
      { 
        List<string> tmp__73 ; 
        tmp__73 = (List<string>) empty<string>(  ); 
        $result = tmp__73; 
      } 
    | local__1_gen__nullable_gen__seplist__L44__name_case1=gen__seplist__L44__name { 
        List<string> tmp__74 ; 
        tmp__74 = ( List<string> ) _localctx.local__1_gen__nullable_gen__seplist__L44__name_case1.result ; 
        $result = tmp__74; 
      } 
; 
gen__seplist__L44__name returns [List<string> result] :
      local__1_gen__seplist__L44__name_case0=name { 
        List<string> tmp__77 ; 
        string tmp__76 ; 
        List<string> tmp__75 ; 
        tmp__75 = (List<string>) empty<string>(  ); 
        tmp__76 = ( string ) _localctx.local__1_gen__seplist__L44__name_case0.result ; 
        tmp__77 = (List<string>) append<string>( tmp__75, tmp__76 ); 
        $result = tmp__77; 
      } 
    | local__1_gen__seplist__L44__name_case1=gen__seplist__L44__name ',' local__3_gen__seplist__L44__name_case1=name { 
        List<string> tmp__80 ; 
        string tmp__79 ; 
        List<string> tmp__78 ; 
        tmp__78 = ( List<string> ) _localctx.local__1_gen__seplist__L44__name_case1.result ; 
        tmp__79 = ( string ) _localctx.local__3_gen__seplist__L44__name_case1.result ; 
        tmp__80 = (List<string>) append<string>( tmp__78, tmp__79 ); 
        $result = tmp__80; 
      } 
; 
gen__optional_gen__blockOf_else returns [ImmediateAST result] :
      { 
        $result = null; 
      } 
    | local__1_gen__optional_gen__blockOf_else_case1=gen__blockOf_else { 
        ImmediateAST tmp__81 ; 
        tmp__81 = ( ImmediateAST ) _localctx.local__1_gen__optional_gen__blockOf_else_case1.result ; 
        $result = tmp__81; 
      } 
; 
gen__blockOf_else returns [ImmediateAST result] :
      local__1_gen__blockOf_else_case0='else' local__2_gen__blockOf_else_case0=block { 
        ImmediateAST tmp__84 ; 
        List<ImmediateAST> tmp__83 ; 
        CommonToken tmp__82 ; 
        tmp__82 = ( CommonToken ) _localctx.local__1_gen__blockOf_else_case0 ; 
        tmp__83 = ( List<ImmediateAST> ) _localctx.local__2_gen__blockOf_else_case0.result ; 
        tmp__84 = (ImmediateAST) mkBlock( tmp__82, tmp__83 ); 
        $result = tmp__84; 
      } 
; 
gen__nullable_gen__list_gen__snd_elif__elifBlock returns [List<(ImmediateAST, ImmediateAST)> result] :
      { 
        List<(ImmediateAST, ImmediateAST)> tmp__85 ; 
        tmp__85 = (List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__85; 
      } 
    | local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock { 
        List<(ImmediateAST, ImmediateAST)> tmp__86 ; 
        tmp__86 = ( List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        $result = tmp__86; 
      } 
; 
gen__list_gen__snd_elif__elifBlock returns [List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__list_gen__snd_elif__elifBlock_case0=gen__snd_elif__elifBlock { 
        List<(ImmediateAST, ImmediateAST)> tmp__89 ; 
        (ImmediateAST, ImmediateAST) tmp__88 ; 
        List<(ImmediateAST, ImmediateAST)> tmp__87 ; 
        tmp__87 = (List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        tmp__88 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case0.result ; 
        tmp__89 = (List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__87, tmp__88 ); 
        $result = tmp__89; 
      } 
    | local__1_gen__list_gen__snd_elif__elifBlock_case1=gen__list_gen__snd_elif__elifBlock local__2_gen__list_gen__snd_elif__elifBlock_case1=gen__snd_elif__elifBlock { 
        List<(ImmediateAST, ImmediateAST)> tmp__92 ; 
        (ImmediateAST, ImmediateAST) tmp__91 ; 
        List<(ImmediateAST, ImmediateAST)> tmp__90 ; 
        tmp__90 = ( List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__91 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__list_gen__snd_elif__elifBlock_case1.result ; 
        tmp__92 = (List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__90, tmp__91 ); 
        $result = tmp__92; 
      } 
; 
gen__snd_elif__elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      'elif' local__2_gen__snd_elif__elifBlock_case0=elifBlock { 
        (ImmediateAST, ImmediateAST) tmp__93 ; 
        tmp__93 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__2_gen__snd_elif__elifBlock_case0.result ; 
        $result = tmp__93; 
      } 
; 
gen__nullable_gen__seplist__L44__pair returns [List<(ImmediateAST, ImmediateAST)> result] :
      { 
        List<(ImmediateAST, ImmediateAST)> tmp__94 ; 
        tmp__94 = (List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        $result = tmp__94; 
      } 
    | local__1_gen__nullable_gen__seplist__L44__pair_case1=gen__seplist__L44__pair { 
        List<(ImmediateAST, ImmediateAST)> tmp__95 ; 
        tmp__95 = ( List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__nullable_gen__seplist__L44__pair_case1.result ; 
        $result = tmp__95; 
      } 
; 
gen__seplist__L44__pair returns [List<(ImmediateAST, ImmediateAST)> result] :
      local__1_gen__seplist__L44__pair_case0=pair { 
        List<(ImmediateAST, ImmediateAST)> tmp__98 ; 
        (ImmediateAST, ImmediateAST) tmp__97 ; 
        List<(ImmediateAST, ImmediateAST)> tmp__96 ; 
        tmp__96 = (List<(ImmediateAST, ImmediateAST)>) empty<(ImmediateAST, ImmediateAST)>(  ); 
        tmp__97 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__1_gen__seplist__L44__pair_case0.result ; 
        tmp__98 = (List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__96, tmp__97 ); 
        $result = tmp__98; 
      } 
    | local__1_gen__seplist__L44__pair_case1=gen__seplist__L44__pair ',' local__3_gen__seplist__L44__pair_case1=pair { 
        List<(ImmediateAST, ImmediateAST)> tmp__101 ; 
        (ImmediateAST, ImmediateAST) tmp__100 ; 
        List<(ImmediateAST, ImmediateAST)> tmp__99 ; 
        tmp__99 = ( List<(ImmediateAST, ImmediateAST)> ) _localctx.local__1_gen__seplist__L44__pair_case1.result ; 
        tmp__100 = ( (ImmediateAST, ImmediateAST) ) _localctx.local__3_gen__seplist__L44__pair_case1.result ; 
        tmp__101 = (List<(ImmediateAST, ImmediateAST)>) append<(ImmediateAST, ImmediateAST)>( tmp__99, tmp__100 ); 
        $result = tmp__101; 
      } 
; 
gen__nullable_gen__seplist__L44__expr returns [List<ImmediateAST> result] :
      { 
        List<ImmediateAST> tmp__102 ; 
        tmp__102 = (List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__102; 
      } 
    | local__1_gen__nullable_gen__seplist__L44__expr_case1=gen__seplist__L44__expr { 
        List<ImmediateAST> tmp__103 ; 
        tmp__103 = ( List<ImmediateAST> ) _localctx.local__1_gen__nullable_gen__seplist__L44__expr_case1.result ; 
        $result = tmp__103; 
      } 
; 
gen__seplist__L44__expr returns [List<ImmediateAST> result] :
      local__1_gen__seplist__L44__expr_case0=expr { 
        List<ImmediateAST> tmp__106 ; 
        ImmediateAST tmp__105 ; 
        List<ImmediateAST> tmp__104 ; 
        tmp__104 = (List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__105 = ( ImmediateAST ) _localctx.local__1_gen__seplist__L44__expr_case0.result ; 
        tmp__106 = (List<ImmediateAST>) append<ImmediateAST>( tmp__104, tmp__105 ); 
        $result = tmp__106; 
      } 
    | local__1_gen__seplist__L44__expr_case1=gen__seplist__L44__expr ',' local__3_gen__seplist__L44__expr_case1=expr { 
        List<ImmediateAST> tmp__109 ; 
        ImmediateAST tmp__108 ; 
        List<ImmediateAST> tmp__107 ; 
        tmp__107 = ( List<ImmediateAST> ) _localctx.local__1_gen__seplist__L44__expr_case1.result ; 
        tmp__108 = ( ImmediateAST ) _localctx.local__3_gen__seplist__L44__expr_case1.result ; 
        tmp__109 = (List<ImmediateAST>) append<ImmediateAST>( tmp__107, tmp__108 ); 
        $result = tmp__109; 
      } 
; 
pair returns [(ImmediateAST, ImmediateAST) result] :
      local__1_pair_case0=expr ':' local__3_pair_case0=expr { 
        ImmediateAST tmp__112 ; 
        ImmediateAST tmp__111 ; 
        (ImmediateAST, ImmediateAST) tmp__110 ; 
        tmp__111 = ( ImmediateAST ) _localctx.local__1_pair_case0.result ; 
        tmp__112 = ( ImmediateAST ) _localctx.local__3_pair_case0.result ; 
        tmp__110 = ( tmp__111 , tmp__112 ); 
        $result = tmp__110; 
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
        ImmediateAST tmp__114 ; 
        List<object> tmp__113 ; 
        tmp__113 = ( List<object> ) _localctx.local__1_bin_case0.result ; 
        tmp__114 = (ImmediateAST) resolve_binop( tmp__113 ); 
        $result = tmp__114; 
      } 
; 
binseq returns [List<object> result] :
      local__1_binseq_case0=atom { 
        List<object> tmp__118 ; 
        object tmp__117 ; 
        ImmediateAST tmp__116 ; 
        List<object> tmp__115 ; 
        tmp__115 = (List<object>) empty<object>(  ); 
        tmp__116 = ( ImmediateAST ) _localctx.local__1_binseq_case0.result ; 
        tmp__117 = (object) to_obj<ImmediateAST>( tmp__116 ); 
        tmp__118 = (List<object>) append<object>( tmp__115, tmp__117 ); 
        $result = tmp__118; 
      } 
    | local__1_binseq_case1=binseq local__2_binseq_case1=binop local__3_binseq_case1=atom { 
        object tmp__124 ; 
        ImmediateAST tmp__123 ; 
        List<object> tmp__122 ; 
        List<object> block__119 ; 
        object tmp__121 ; 
        List<object> tmp__120 ; 
        tmp__120 = ( List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__121 = ( object ) _localctx.local__2_binseq_case1.result ; 
        block__119 = (List<object>) append<object>( tmp__120, tmp__121 ); 
        tmp__122 = ( List<object> ) _localctx.local__1_binseq_case1.result ; 
        tmp__123 = ( ImmediateAST ) _localctx.local__3_binseq_case1.result ; 
        tmp__124 = (object) to_obj<ImmediateAST>( tmp__123 ); 
        block__119 = (List<object>) append<object>( tmp__122, tmp__124 ); 
        $result = block__119; 
      } 
; 
binop returns [object result] :
      local__1_binop_case0=SINGLE_BINOP_2 { 
        object tmp__127 ; 
        CommonToken tmp__126 ; 
        CommonToken tmp__125 ; 
        tmp__125 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__126 = ( CommonToken ) _localctx.local__1_binop_case0 ; 
        tmp__127 = (object) mkop( tmp__125, tmp__126.Text ); 
        $result = tmp__127; 
      } 
    | local__1_binop_case1='not' 'in' { 
        object tmp__130 ; 
        string tmp__129 ; 
        CommonToken tmp__128 ; 
        tmp__128 = ( CommonToken ) _localctx.local__1_binop_case1 ; 
        tmp__129 = "notin" ; 
        tmp__130 = (object) mkop( tmp__128, tmp__129 ); 
        $result = tmp__130; 
      } 
    | local__1_binop_case2='-' { 
        object tmp__133 ; 
        string tmp__132 ; 
        CommonToken tmp__131 ; 
        tmp__131 = ( CommonToken ) _localctx.local__1_binop_case2 ; 
        tmp__132 = "-" ; 
        tmp__133 = (object) mkop( tmp__131, tmp__132 ); 
        $result = tmp__133; 
      } 
; 
not returns [ImmediateAST result] :
      local__1_not_case0='not' local__2_not_case0=bin { 
        ImmediateAST tmp__136 ; 
        ImmediateAST tmp__135 ; 
        CommonToken tmp__134 ; 
        tmp__134 = ( CommonToken ) _localctx.local__1_not_case0 ; 
        tmp__135 = ( ImmediateAST ) _localctx.local__2_not_case0.result ; 
        tmp__136 = (ImmediateAST) mkNot( tmp__134, tmp__135 ); 
        $result = tmp__136; 
      } 
    | local__1_not_case1=bin { 
        ImmediateAST tmp__137 ; 
        tmp__137 = ( ImmediateAST ) _localctx.local__1_not_case1.result ; 
        $result = tmp__137; 
      } 
; 
and_expr returns [ImmediateAST result] :
      local__1_and_expr_case0=and_expr local__2_and_expr_case0='and' local__3_and_expr_case0=not { 
        ImmediateAST tmp__141 ; 
        ImmediateAST tmp__140 ; 
        ImmediateAST tmp__139 ; 
        CommonToken tmp__138 ; 
        tmp__138 = ( CommonToken ) _localctx.local__2_and_expr_case0 ; 
        tmp__139 = ( ImmediateAST ) _localctx.local__1_and_expr_case0.result ; 
        tmp__140 = ( ImmediateAST ) _localctx.local__3_and_expr_case0.result ; 
        tmp__141 = (ImmediateAST) mkAnd( tmp__138, tmp__139, tmp__140 ); 
        $result = tmp__141; 
      } 
    | local__1_and_expr_case1=not { 
        ImmediateAST tmp__142 ; 
        tmp__142 = ( ImmediateAST ) _localctx.local__1_and_expr_case1.result ; 
        $result = tmp__142; 
      } 
; 
or_expr returns [ImmediateAST result] :
      local__1_or_expr_case0=or_expr local__2_or_expr_case0='or' local__3_or_expr_case0=and_expr { 
        ImmediateAST tmp__146 ; 
        ImmediateAST tmp__145 ; 
        ImmediateAST tmp__144 ; 
        CommonToken tmp__143 ; 
        tmp__143 = ( CommonToken ) _localctx.local__2_or_expr_case0 ; 
        tmp__144 = ( ImmediateAST ) _localctx.local__1_or_expr_case0.result ; 
        tmp__145 = ( ImmediateAST ) _localctx.local__3_or_expr_case0.result ; 
        tmp__146 = (ImmediateAST) mkAnd( tmp__143, tmp__144, tmp__145 ); 
        $result = tmp__146; 
      } 
    | local__1_or_expr_case1=and_expr { 
        ImmediateAST tmp__147 ; 
        tmp__147 = ( ImmediateAST ) _localctx.local__1_or_expr_case1.result ; 
        $result = tmp__147; 
      } 
; 
expr returns [ImmediateAST result] :
      local__1_expr_case0=or_expr { 
        ImmediateAST tmp__148 ; 
        tmp__148 = ( ImmediateAST ) _localctx.local__1_expr_case0.result ; 
        $result = tmp__148; 
      } 
; 
block returns [List<ImmediateAST> result] :
      local__1_block_case0=gen__filter_stmt__NEWLINE { 
        List<ImmediateAST> tmp__149 ; 
        tmp__149 = ( List<ImmediateAST> ) _localctx.local__1_block_case0.result ; 
        $result = tmp__149; 
      } 
; 
gen__filter_stmt__NEWLINE returns [List<ImmediateAST> result] :
      local__1_gen__filter_stmt__NEWLINE_case0=gen__filter_stmt__NEWLINE local__2_gen__filter_stmt__NEWLINE_case0=stmt { 
        List<ImmediateAST> tmp__152 ; 
        ImmediateAST tmp__151 ; 
        List<ImmediateAST> tmp__150 ; 
        tmp__150 = ( List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__NEWLINE_case0.result ; 
        tmp__151 = ( ImmediateAST ) _localctx.local__2_gen__filter_stmt__NEWLINE_case0.result ; 
        tmp__152 = (List<ImmediateAST>) append<ImmediateAST>( tmp__150, tmp__151 ); 
        $result = tmp__152; 
      } 
    | local__1_gen__filter_stmt__NEWLINE_case1=gen__filter_stmt__NEWLINE NEWLINE_14 { 
        List<ImmediateAST> tmp__153 ; 
        tmp__153 = ( List<ImmediateAST> ) _localctx.local__1_gen__filter_stmt__NEWLINE_case1.result ; 
        $result = tmp__153; 
      } 
    | local__1_gen__filter_stmt__NEWLINE_case2=stmt { 
        List<ImmediateAST> tmp__156 ; 
        ImmediateAST tmp__155 ; 
        List<ImmediateAST> tmp__154 ; 
        tmp__154 = (List<ImmediateAST>) empty<ImmediateAST>(  ); 
        tmp__155 = ( ImmediateAST ) _localctx.local__1_gen__filter_stmt__NEWLINE_case2.result ; 
        tmp__156 = (List<ImmediateAST>) append<ImmediateAST>( tmp__154, tmp__155 ); 
        $result = tmp__156; 
      } 
    | NEWLINE_14 { 
        List<ImmediateAST> tmp__157 ; 
        tmp__157 = (List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__157; 
      } 
; 
lhs returns [ImmediateAST result] :
      local__1_lhs_case0=NAME_10 { 
        ImmediateAST tmp__160 ; 
        CommonToken tmp__159 ; 
        CommonToken tmp__158 ; 
        tmp__158 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__159 = ( CommonToken ) _localctx.local__1_lhs_case0 ; 
        tmp__160 = (ImmediateAST) mkVar( tmp__158, tmp__159.Text ); 
        $result = tmp__160; 
      } 
    | local__1_lhs_case1=atom local__2_lhs_case1='.' '[' local__4_lhs_case1=expr ']' { 
        ImmediateAST tmp__164 ; 
        ImmediateAST tmp__163 ; 
        ImmediateAST tmp__162 ; 
        CommonToken tmp__161 ; 
        tmp__161 = ( CommonToken ) _localctx.local__2_lhs_case1 ; 
        tmp__162 = ( ImmediateAST ) _localctx.local__1_lhs_case1.result ; 
        tmp__163 = ( ImmediateAST ) _localctx.local__4_lhs_case1.result ; 
        tmp__164 = (ImmediateAST) mkOGet( tmp__161, tmp__162, tmp__163 ); 
        $result = tmp__164; 
      } 
    | local__1_lhs_case2=atom local__2_lhs_case2='.' local__3_lhs_case2=NAME_10 { 
        ImmediateAST tmp__171 ; 
        ImmediateAST tmp__170 ; 
        DObj tmp__169 ; 
        CommonToken tmp__168 ; 
        CommonToken tmp__167 ; 
        ImmediateAST tmp__166 ; 
        CommonToken tmp__165 ; 
        tmp__165 = ( CommonToken ) _localctx.local__2_lhs_case2 ; 
        tmp__166 = ( ImmediateAST ) _localctx.local__1_lhs_case2.result ; 
        tmp__167 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__168 = ( CommonToken ) _localctx.local__3_lhs_case2 ; 
        tmp__169 = (DObj) mkstr( tmp__168.Text ); 
        tmp__170 = (ImmediateAST) mkVal( tmp__167, tmp__169 ); 
        tmp__171 = (ImmediateAST) mkOGet( tmp__165, tmp__166, tmp__170 ); 
        $result = tmp__171; 
      } 
; 
do returns [CommonToken result] :
      gen__optional_NEWLINE local__2_do_case0='do' { 
        CommonToken tmp__172 ; 
        tmp__172 = ( CommonToken ) _localctx.local__2_do_case0 ; 
        $result = tmp__172; 
      } 
; 
gen__optional_NEWLINE returns [CommonToken result] :
      { 
        $result = null; 
      } 
    | local__1_gen__optional_NEWLINE_case1=NEWLINE_14 { 
        CommonToken tmp__173 ; 
        tmp__173 = ( CommonToken ) _localctx.local__1_gen__optional_NEWLINE_case1 ; 
        $result = tmp__173; 
      } 
; 
then returns [CommonToken result] :
      gen__optional_NEWLINE local__2_then_case0='then' { 
        CommonToken tmp__174 ; 
        tmp__174 = ( CommonToken ) _localctx.local__2_then_case0 ; 
        $result = tmp__174; 
      } 
; 
stmt returns [ImmediateAST result] :
      local__1_stmt_case0=lhs_seq local__2_stmt_case0=expr { 
        ImmediateAST tmp__177 ; 
        ImmediateAST tmp__176 ; 
        List<ImmediateAST> tmp__175 ; 
        tmp__175 = ( List<ImmediateAST> ) _localctx.local__1_stmt_case0.result ; 
        tmp__176 = ( ImmediateAST ) _localctx.local__2_stmt_case0.result ; 
        tmp__177 = (ImmediateAST) mkStoreMany( tmp__175, tmp__176 ); 
        $result = tmp__177; 
      } 
    | local__1_stmt_case1='loop' local__2_stmt_case1=block 'end' { 
        ImmediateAST tmp__182 ; 
        ImmediateAST tmp__181 ; 
        List<ImmediateAST> tmp__180 ; 
        CommonToken tmp__179 ; 
        CommonToken tmp__178 ; 
        tmp__178 = ( CommonToken ) _localctx.local__1_stmt_case1 ; 
        tmp__179 = ( CommonToken ) _localctx.local__1_stmt_case1 ; 
        tmp__180 = ( List<ImmediateAST> ) _localctx.local__2_stmt_case1.result ; 
        tmp__181 = (ImmediateAST) mkBlock( tmp__179, tmp__180 ); 
        tmp__182 = (ImmediateAST) mkLoop( tmp__178, tmp__181 ); 
        $result = tmp__182; 
      } 
    | local__1_stmt_case2='for' local__2_stmt_case2=NAME_10 'in' local__4_stmt_case2=expr local__5_stmt_case2=gen__blockOf_do 'end' { 
        ImmediateAST tmp__187 ; 
        ImmediateAST tmp__186 ; 
        ImmediateAST tmp__185 ; 
        CommonToken tmp__184 ; 
        CommonToken tmp__183 ; 
        tmp__183 = ( CommonToken ) _localctx.local__1_stmt_case2 ; 
        tmp__184 = ( CommonToken ) _localctx.local__2_stmt_case2 ; 
        tmp__185 = ( ImmediateAST ) _localctx.local__4_stmt_case2.result ; 
        tmp__186 = ( ImmediateAST ) _localctx.local__5_stmt_case2.result ; 
        tmp__187 = (ImmediateAST) mkFor( tmp__183, tmp__184.Text, tmp__185, tmp__186 ); 
        $result = tmp__187; 
      } 
    | local__1_stmt_case3='break' { 
        ImmediateAST tmp__189 ; 
        CommonToken tmp__188 ; 
        tmp__188 = ( CommonToken ) _localctx.local__1_stmt_case3 ; 
        tmp__189 = (ImmediateAST) mkBreak( tmp__188 ); 
        $result = tmp__189; 
      } 
    | local__1_stmt_case4='continue' { 
        ImmediateAST tmp__191 ; 
        CommonToken tmp__190 ; 
        tmp__190 = ( CommonToken ) _localctx.local__1_stmt_case4 ; 
        tmp__191 = (ImmediateAST) mkContinue( tmp__190 ); 
        $result = tmp__191; 
      } 
    | local__1_stmt_case5='return' { 
        ImmediateAST tmp__193 ; 
        CommonToken tmp__192 ; 
        tmp__192 = ( CommonToken ) _localctx.local__1_stmt_case5 ; 
        tmp__193 = (ImmediateAST) mkReturn( tmp__192, null ); 
        $result = tmp__193; 
      } 
    | local__1_stmt_case6='return' local__2_stmt_case6=expr { 
        ImmediateAST tmp__196 ; 
        ImmediateAST tmp__195 ; 
        CommonToken tmp__194 ; 
        tmp__194 = ( CommonToken ) _localctx.local__1_stmt_case6 ; 
        tmp__195 = ( ImmediateAST ) _localctx.local__2_stmt_case6.result ; 
        tmp__196 = (ImmediateAST) mkReturn( tmp__194, tmp__195 ); 
        $result = tmp__196; 
      } 
; 
gen__blockOf_do returns [ImmediateAST result] :
      local__1_gen__blockOf_do_case0=do local__2_gen__blockOf_do_case0=block { 
        ImmediateAST tmp__199 ; 
        List<ImmediateAST> tmp__198 ; 
        CommonToken tmp__197 ; 
        tmp__197 = ( CommonToken ) _localctx.local__1_gen__blockOf_do_case0.result ; 
        tmp__198 = ( List<ImmediateAST> ) _localctx.local__2_gen__blockOf_do_case0.result ; 
        tmp__199 = (ImmediateAST) mkBlock( tmp__197, tmp__198 ); 
        $result = tmp__199; 
      } 
; 
name returns [string result] :
      local__1_name_case0=NAME_10 { 
        CommonToken tmp__200 ; 
        tmp__200 = ( CommonToken ) _localctx.local__1_name_case0 ; 
        $result = tmp__200.Text; 
      } 
; 
elifBlock returns [(ImmediateAST, ImmediateAST) result] :
      local__1_elifBlock_case0=expr local__2_elifBlock_case0=gen__blockOf_then { 
        ImmediateAST tmp__203 ; 
        ImmediateAST tmp__202 ; 
        (ImmediateAST, ImmediateAST) tmp__201 ; 
        tmp__202 = ( ImmediateAST ) _localctx.local__1_elifBlock_case0.result ; 
        tmp__203 = ( ImmediateAST ) _localctx.local__2_elifBlock_case0.result ; 
        tmp__201 = ( tmp__202 , tmp__203 ); 
        $result = tmp__201; 
      } 
; 
gen__blockOf_then returns [ImmediateAST result] :
      local__1_gen__blockOf_then_case0=then local__2_gen__blockOf_then_case0=block { 
        ImmediateAST tmp__206 ; 
        List<ImmediateAST> tmp__205 ; 
        CommonToken tmp__204 ; 
        tmp__204 = ( CommonToken ) _localctx.local__1_gen__blockOf_then_case0.result ; 
        tmp__205 = ( List<ImmediateAST> ) _localctx.local__2_gen__blockOf_then_case0.result ; 
        tmp__206 = (ImmediateAST) mkBlock( tmp__204, tmp__205 ); 
        $result = tmp__206; 
      } 
; 
lhs_seq returns [List<ImmediateAST> result] :
      { 
        List<ImmediateAST> tmp__207 ; 
        tmp__207 = (List<ImmediateAST>) empty<ImmediateAST>(  ); 
        $result = tmp__207; 
      } 
    | local__1_lhs_seq_case1=lhs_seq local__2_lhs_seq_case1=lhs '=' { 
        List<ImmediateAST> tmp__210 ; 
        ImmediateAST tmp__209 ; 
        List<ImmediateAST> tmp__208 ; 
        tmp__208 = ( List<ImmediateAST> ) _localctx.local__1_lhs_seq_case1.result ; 
        tmp__209 = ( ImmediateAST ) _localctx.local__2_lhs_seq_case1.result ; 
        tmp__210 = (List<ImmediateAST>) append<ImmediateAST>( tmp__208, tmp__209 ); 
        $result = tmp__210; 
      } 
; 
expr_opt returns [ImmediateAST result] :
      { 
        $result = null; 
      } 
    | local__1_expr_opt_case1=expr { 
        ImmediateAST tmp__211 ; 
        tmp__211 = ( ImmediateAST ) _localctx.local__1_expr_opt_case1.result ; 
        $result = tmp__211; 
      } 
; 
start returns [List<ImmediateAST> result] :
      local__1_start_case0=block EOF { 
        List<ImmediateAST> tmp__212 ; 
        tmp__212 = ( List<ImmediateAST> ) _localctx.local__1_start_case0.result ; 
        $result = tmp__212; 
      } 
; 


COMMENT_1 : '#' (~'\n')* -> skip;
SINGLE_BINOP_2 : ('<'|'>'|'>' '='|'<' '='|'=' '='|'!' '='|'i' 'n'|'+'|'*'|'*' '*'|'/'|'/' '/'|'%'|'&'|'|'|'<' '<'|'>' '>');
fragment ESCAPED_QUOTE_3 : '\\' '"';
STR_4 : '"' (ESCAPED_QUOTE_3|~'"')* '"';
fragment WS_5 : ('\r'|'\t'|'\n'|' ');
INT_7 : DIGIT_6+;
fragment DIGIT_6 : [\u0030-\u0039];
FLOAT_8 : INT_7 '.' INT_7;
fragment UCODE_9 : [\u0061-\u007A]|[\u0041-\u005A]|'_'|[\u4e00-\u9fa5];
NAME_10 : UCODE_9 (DIGIT_6|UCODE_9)*;
WS_INLINE_11 : (' '|'\t')+ -> skip;
fragment CR_12 : '\r';
fragment LF_13 : '\n';
NEWLINE_14 : (CR_12? LF_13)+;


