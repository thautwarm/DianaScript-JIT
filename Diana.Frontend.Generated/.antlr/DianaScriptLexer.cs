//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     ANTLR Version: 4.8
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// Generated from /home/thaut/Desktop/belala/Diana.Frontend.Generated/DianaScript.g4 by ANTLR 4.8

// Unreachable code detected
#pragma warning disable 0162
// The variable '...' is assigned but its value is never used
#pragma warning disable 0219
// Missing XML comment for publicly visible type or member '...'
#pragma warning disable 1591
// Ambiguous reference in cref attribute
#pragma warning disable 419

using System;
using System.IO;
using System.Text;
using Antlr4.Runtime;
using Antlr4.Runtime.Atn;
using Antlr4.Runtime.Misc;
using DFA = Antlr4.Runtime.Dfa.DFA;

[System.CodeDom.Compiler.GeneratedCode("ANTLR", "4.8")]
[System.CLSCompliant(false)]
public partial class DianaScriptLexer : Lexer {
	protected static DFA[] decisionToDFA;
	protected static PredictionContextCache sharedContextCache = new PredictionContextCache();
	public const int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, T__15=16, T__16=17, 
		T__17=18, T__18=19, T__19=20, T__20=21, T__21=22, T__22=23, T__23=24, 
		T__24=25, T__25=26, T__26=27, T__27=28, T__28=29, T__29=30, COMMENT_1=31, 
		SINGLE_BINOP_2=32, STR_4=33, INT_10=34, HEX_7=35, OCT_8=36, BIN_9=37, 
		FLOAT_11=38, NAME_13=39, WS_INLINE_14=40, NEWLINE_17=41;
	public static string[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static string[] modeNames = {
		"DEFAULT_MODE"
	};

	public static readonly string[] ruleNames = {
		"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "T__8", 
		"T__9", "T__10", "T__11", "T__12", "T__13", "T__14", "T__15", "T__16", 
		"T__17", "T__18", "T__19", "T__20", "T__21", "T__22", "T__23", "T__24", 
		"T__25", "T__26", "T__27", "T__28", "T__29", "COMMENT_1", "SINGLE_BINOP_2", 
		"ESCAPED_QUOTE_3", "STR_4", "WS_5", "INT_10", "HEX_7", "OCT_8", "BIN_9", 
		"DIGIT_6", "FLOAT_11", "UCODE_12", "NAME_13", "WS_INLINE_14", "CR_15", 
		"LF_16", "NEWLINE_17"
	};


	public DianaScriptLexer(ICharStream input)
	: this(input, Console.Out, Console.Error) { }

	public DianaScriptLexer(ICharStream input, TextWriter output, TextWriter errorOutput)
	: base(input, output, errorOutput)
	{
		Interpreter = new LexerATNSimulator(this, _ATN, decisionToDFA, sharedContextCache);
	}

	private static readonly string[] _LiteralNames = {
		null, "'{'", "'}'", "'loop'", "'end'", "'for'", "'in'", "'break'", "'continue'", 
		"'return'", "'do'", "','", "'.'", "'['", "']'", "'('", "')'", "'None'", 
		"'-'", "'~'", "'if'", "'fun'", "'->'", "'else'", "'elif'", "':'", "'not'", 
		"'and'", "'or'", "'then'", "'='"
	};
	private static readonly string[] _SymbolicNames = {
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, null, null, "COMMENT_1", "SINGLE_BINOP_2", 
		"STR_4", "INT_10", "HEX_7", "OCT_8", "BIN_9", "FLOAT_11", "NAME_13", "WS_INLINE_14", 
		"NEWLINE_17"
	};
	public static readonly IVocabulary DefaultVocabulary = new Vocabulary(_LiteralNames, _SymbolicNames);

	[NotNull]
	public override IVocabulary Vocabulary
	{
		get
		{
			return DefaultVocabulary;
		}
	}

	public override string GrammarFileName { get { return "DianaScript.g4"; } }

	public override string[] RuleNames { get { return ruleNames; } }

	public override string[] ChannelNames { get { return channelNames; } }

	public override string[] ModeNames { get { return modeNames; } }

	public override string SerializedAtn { get { return new string(_serializedATN); } }

	static DianaScriptLexer() {
		decisionToDFA = new DFA[_ATN.NumberOfDecisions];
		for (int i = 0; i < _ATN.NumberOfDecisions; i++) {
			decisionToDFA[i] = new DFA(_ATN.GetDecisionState(i), i);
		}
	}
	private static char[] _serializedATN = {
		'\x3', '\x608B', '\xA72A', '\x8133', '\xB9ED', '\x417C', '\x3BE7', '\x7786', 
		'\x5964', '\x2', '+', '\x13F', '\b', '\x1', '\x4', '\x2', '\t', '\x2', 
		'\x4', '\x3', '\t', '\x3', '\x4', '\x4', '\t', '\x4', '\x4', '\x5', '\t', 
		'\x5', '\x4', '\x6', '\t', '\x6', '\x4', '\a', '\t', '\a', '\x4', '\b', 
		'\t', '\b', '\x4', '\t', '\t', '\t', '\x4', '\n', '\t', '\n', '\x4', '\v', 
		'\t', '\v', '\x4', '\f', '\t', '\f', '\x4', '\r', '\t', '\r', '\x4', '\xE', 
		'\t', '\xE', '\x4', '\xF', '\t', '\xF', '\x4', '\x10', '\t', '\x10', '\x4', 
		'\x11', '\t', '\x11', '\x4', '\x12', '\t', '\x12', '\x4', '\x13', '\t', 
		'\x13', '\x4', '\x14', '\t', '\x14', '\x4', '\x15', '\t', '\x15', '\x4', 
		'\x16', '\t', '\x16', '\x4', '\x17', '\t', '\x17', '\x4', '\x18', '\t', 
		'\x18', '\x4', '\x19', '\t', '\x19', '\x4', '\x1A', '\t', '\x1A', '\x4', 
		'\x1B', '\t', '\x1B', '\x4', '\x1C', '\t', '\x1C', '\x4', '\x1D', '\t', 
		'\x1D', '\x4', '\x1E', '\t', '\x1E', '\x4', '\x1F', '\t', '\x1F', '\x4', 
		' ', '\t', ' ', '\x4', '!', '\t', '!', '\x4', '\"', '\t', '\"', '\x4', 
		'#', '\t', '#', '\x4', '$', '\t', '$', '\x4', '%', '\t', '%', '\x4', '&', 
		'\t', '&', '\x4', '\'', '\t', '\'', '\x4', '(', '\t', '(', '\x4', ')', 
		'\t', ')', '\x4', '*', '\t', '*', '\x4', '+', '\t', '+', '\x4', ',', '\t', 
		',', '\x4', '-', '\t', '-', '\x4', '.', '\t', '.', '\x4', '/', '\t', '/', 
		'\x4', '\x30', '\t', '\x30', '\x3', '\x2', '\x3', '\x2', '\x3', '\x3', 
		'\x3', '\x3', '\x3', '\x4', '\x3', '\x4', '\x3', '\x4', '\x3', '\x4', 
		'\x3', '\x4', '\x3', '\x5', '\x3', '\x5', '\x3', '\x5', '\x3', '\x5', 
		'\x3', '\x6', '\x3', '\x6', '\x3', '\x6', '\x3', '\x6', '\x3', '\a', '\x3', 
		'\a', '\x3', '\a', '\x3', '\b', '\x3', '\b', '\x3', '\b', '\x3', '\b', 
		'\x3', '\b', '\x3', '\b', '\x3', '\t', '\x3', '\t', '\x3', '\t', '\x3', 
		'\t', '\x3', '\t', '\x3', '\t', '\x3', '\t', '\x3', '\t', '\x3', '\t', 
		'\x3', '\n', '\x3', '\n', '\x3', '\n', '\x3', '\n', '\x3', '\n', '\x3', 
		'\n', '\x3', '\n', '\x3', '\v', '\x3', '\v', '\x3', '\v', '\x3', '\f', 
		'\x3', '\f', '\x3', '\r', '\x3', '\r', '\x3', '\xE', '\x3', '\xE', '\x3', 
		'\xF', '\x3', '\xF', '\x3', '\x10', '\x3', '\x10', '\x3', '\x11', '\x3', 
		'\x11', '\x3', '\x12', '\x3', '\x12', '\x3', '\x12', '\x3', '\x12', '\x3', 
		'\x12', '\x3', '\x13', '\x3', '\x13', '\x3', '\x14', '\x3', '\x14', '\x3', 
		'\x15', '\x3', '\x15', '\x3', '\x15', '\x3', '\x16', '\x3', '\x16', '\x3', 
		'\x16', '\x3', '\x16', '\x3', '\x17', '\x3', '\x17', '\x3', '\x17', '\x3', 
		'\x18', '\x3', '\x18', '\x3', '\x18', '\x3', '\x18', '\x3', '\x18', '\x3', 
		'\x19', '\x3', '\x19', '\x3', '\x19', '\x3', '\x19', '\x3', '\x19', '\x3', 
		'\x1A', '\x3', '\x1A', '\x3', '\x1B', '\x3', '\x1B', '\x3', '\x1B', '\x3', 
		'\x1B', '\x3', '\x1C', '\x3', '\x1C', '\x3', '\x1C', '\x3', '\x1C', '\x3', 
		'\x1D', '\x3', '\x1D', '\x3', '\x1D', '\x3', '\x1E', '\x3', '\x1E', '\x3', 
		'\x1E', '\x3', '\x1E', '\x3', '\x1E', '\x3', '\x1F', '\x3', '\x1F', '\x3', 
		' ', '\x3', ' ', '\a', ' ', '\xCE', '\n', ' ', '\f', ' ', '\xE', ' ', 
		'\xD1', '\v', ' ', '\x3', ' ', '\x3', ' ', '\x3', '!', '\x3', '!', '\x3', 
		'!', '\x3', '!', '\x3', '!', '\x3', '!', '\x3', '!', '\x3', '!', '\x3', 
		'!', '\x3', '!', '\x3', '!', '\x3', '!', '\x3', '!', '\x3', '!', '\x3', 
		'!', '\x3', '!', '\x3', '!', '\x3', '!', '\x3', '!', '\x3', '!', '\x5', 
		'!', '\xE9', '\n', '!', '\x3', '\"', '\x3', '\"', '\x3', '\"', '\x3', 
		'#', '\x3', '#', '\x3', '#', '\a', '#', '\xF1', '\n', '#', '\f', '#', 
		'\xE', '#', '\xF4', '\v', '#', '\x3', '#', '\x3', '#', '\x3', '$', '\x3', 
		'$', '\x3', '%', '\x6', '%', '\xFB', '\n', '%', '\r', '%', '\xE', '%', 
		'\xFC', '\x3', '%', '\x3', '%', '\x3', '%', '\x5', '%', '\x102', '\n', 
		'%', '\x3', '&', '\x3', '&', '\x3', '&', '\a', '&', '\x107', '\n', '&', 
		'\f', '&', '\xE', '&', '\x10A', '\v', '&', '\x3', '\'', '\x3', '\'', '\x3', 
		'\'', '\a', '\'', '\x10F', '\n', '\'', '\f', '\'', '\xE', '\'', '\x112', 
		'\v', '\'', '\x3', '(', '\x3', '(', '\x3', '(', '\a', '(', '\x117', '\n', 
		'(', '\f', '(', '\xE', '(', '\x11A', '\v', '(', '\x3', ')', '\x3', ')', 
		'\x3', '*', '\x3', '*', '\x3', '*', '\x3', '*', '\x3', '+', '\x5', '+', 
		'\x123', '\n', '+', '\x3', ',', '\x3', ',', '\x3', ',', '\a', ',', '\x128', 
		'\n', ',', '\f', ',', '\xE', ',', '\x12B', '\v', ',', '\x3', '-', '\x6', 
		'-', '\x12E', '\n', '-', '\r', '-', '\xE', '-', '\x12F', '\x3', '-', '\x3', 
		'-', '\x3', '.', '\x3', '.', '\x3', '/', '\x3', '/', '\x3', '\x30', '\x5', 
		'\x30', '\x139', '\n', '\x30', '\x3', '\x30', '\x6', '\x30', '\x13C', 
		'\n', '\x30', '\r', '\x30', '\xE', '\x30', '\x13D', '\x2', '\x2', '\x31', 
		'\x3', '\x3', '\x5', '\x4', '\a', '\x5', '\t', '\x6', '\v', '\a', '\r', 
		'\b', '\xF', '\t', '\x11', '\n', '\x13', '\v', '\x15', '\f', '\x17', '\r', 
		'\x19', '\xE', '\x1B', '\xF', '\x1D', '\x10', '\x1F', '\x11', '!', '\x12', 
		'#', '\x13', '%', '\x14', '\'', '\x15', ')', '\x16', '+', '\x17', '-', 
		'\x18', '/', '\x19', '\x31', '\x1A', '\x33', '\x1B', '\x35', '\x1C', '\x37', 
		'\x1D', '\x39', '\x1E', ';', '\x1F', '=', ' ', '?', '!', '\x41', '\"', 
		'\x43', '\x2', '\x45', '#', 'G', '\x2', 'I', '$', 'K', '%', 'M', '&', 
		'O', '\'', 'Q', '\x2', 'S', '(', 'U', '\x2', 'W', ')', 'Y', '*', '[', 
		'\x2', ']', '\x2', '_', '+', '\x3', '\x2', '\r', '\x3', '\x2', '\f', '\f', 
		'\x4', '\x2', '>', '>', '@', '@', '\x4', '\x2', '\'', '(', '~', '~', '\x3', 
		'\x2', '$', '$', '\x5', '\x2', '\v', '\f', '\xF', '\xF', '\"', '\"', '\x4', 
		'\x2', '\x32', ';', '\x63', 'h', '\x3', '\x2', '\x32', '\x39', '\x3', 
		'\x2', '\x32', '\x33', '\x3', '\x2', '\x32', ';', '\x6', '\x2', '\x43', 
		'\\', '\x61', '\x61', '\x63', '|', '\x4E02', '\x9FA7', '\x4', '\x2', '\v', 
		'\v', '\"', '\"', '\x2', '\x152', '\x2', '\x3', '\x3', '\x2', '\x2', '\x2', 
		'\x2', '\x5', '\x3', '\x2', '\x2', '\x2', '\x2', '\a', '\x3', '\x2', '\x2', 
		'\x2', '\x2', '\t', '\x3', '\x2', '\x2', '\x2', '\x2', '\v', '\x3', '\x2', 
		'\x2', '\x2', '\x2', '\r', '\x3', '\x2', '\x2', '\x2', '\x2', '\xF', '\x3', 
		'\x2', '\x2', '\x2', '\x2', '\x11', '\x3', '\x2', '\x2', '\x2', '\x2', 
		'\x13', '\x3', '\x2', '\x2', '\x2', '\x2', '\x15', '\x3', '\x2', '\x2', 
		'\x2', '\x2', '\x17', '\x3', '\x2', '\x2', '\x2', '\x2', '\x19', '\x3', 
		'\x2', '\x2', '\x2', '\x2', '\x1B', '\x3', '\x2', '\x2', '\x2', '\x2', 
		'\x1D', '\x3', '\x2', '\x2', '\x2', '\x2', '\x1F', '\x3', '\x2', '\x2', 
		'\x2', '\x2', '!', '\x3', '\x2', '\x2', '\x2', '\x2', '#', '\x3', '\x2', 
		'\x2', '\x2', '\x2', '%', '\x3', '\x2', '\x2', '\x2', '\x2', '\'', '\x3', 
		'\x2', '\x2', '\x2', '\x2', ')', '\x3', '\x2', '\x2', '\x2', '\x2', '+', 
		'\x3', '\x2', '\x2', '\x2', '\x2', '-', '\x3', '\x2', '\x2', '\x2', '\x2', 
		'/', '\x3', '\x2', '\x2', '\x2', '\x2', '\x31', '\x3', '\x2', '\x2', '\x2', 
		'\x2', '\x33', '\x3', '\x2', '\x2', '\x2', '\x2', '\x35', '\x3', '\x2', 
		'\x2', '\x2', '\x2', '\x37', '\x3', '\x2', '\x2', '\x2', '\x2', '\x39', 
		'\x3', '\x2', '\x2', '\x2', '\x2', ';', '\x3', '\x2', '\x2', '\x2', '\x2', 
		'=', '\x3', '\x2', '\x2', '\x2', '\x2', '?', '\x3', '\x2', '\x2', '\x2', 
		'\x2', '\x41', '\x3', '\x2', '\x2', '\x2', '\x2', '\x45', '\x3', '\x2', 
		'\x2', '\x2', '\x2', 'I', '\x3', '\x2', '\x2', '\x2', '\x2', 'K', '\x3', 
		'\x2', '\x2', '\x2', '\x2', 'M', '\x3', '\x2', '\x2', '\x2', '\x2', 'O', 
		'\x3', '\x2', '\x2', '\x2', '\x2', 'S', '\x3', '\x2', '\x2', '\x2', '\x2', 
		'W', '\x3', '\x2', '\x2', '\x2', '\x2', 'Y', '\x3', '\x2', '\x2', '\x2', 
		'\x2', '_', '\x3', '\x2', '\x2', '\x2', '\x3', '\x61', '\x3', '\x2', '\x2', 
		'\x2', '\x5', '\x63', '\x3', '\x2', '\x2', '\x2', '\a', '\x65', '\x3', 
		'\x2', '\x2', '\x2', '\t', 'j', '\x3', '\x2', '\x2', '\x2', '\v', 'n', 
		'\x3', '\x2', '\x2', '\x2', '\r', 'r', '\x3', '\x2', '\x2', '\x2', '\xF', 
		'u', '\x3', '\x2', '\x2', '\x2', '\x11', '{', '\x3', '\x2', '\x2', '\x2', 
		'\x13', '\x84', '\x3', '\x2', '\x2', '\x2', '\x15', '\x8B', '\x3', '\x2', 
		'\x2', '\x2', '\x17', '\x8E', '\x3', '\x2', '\x2', '\x2', '\x19', '\x90', 
		'\x3', '\x2', '\x2', '\x2', '\x1B', '\x92', '\x3', '\x2', '\x2', '\x2', 
		'\x1D', '\x94', '\x3', '\x2', '\x2', '\x2', '\x1F', '\x96', '\x3', '\x2', 
		'\x2', '\x2', '!', '\x98', '\x3', '\x2', '\x2', '\x2', '#', '\x9A', '\x3', 
		'\x2', '\x2', '\x2', '%', '\x9F', '\x3', '\x2', '\x2', '\x2', '\'', '\xA1', 
		'\x3', '\x2', '\x2', '\x2', ')', '\xA3', '\x3', '\x2', '\x2', '\x2', '+', 
		'\xA6', '\x3', '\x2', '\x2', '\x2', '-', '\xAA', '\x3', '\x2', '\x2', 
		'\x2', '/', '\xAD', '\x3', '\x2', '\x2', '\x2', '\x31', '\xB2', '\x3', 
		'\x2', '\x2', '\x2', '\x33', '\xB7', '\x3', '\x2', '\x2', '\x2', '\x35', 
		'\xB9', '\x3', '\x2', '\x2', '\x2', '\x37', '\xBD', '\x3', '\x2', '\x2', 
		'\x2', '\x39', '\xC1', '\x3', '\x2', '\x2', '\x2', ';', '\xC4', '\x3', 
		'\x2', '\x2', '\x2', '=', '\xC9', '\x3', '\x2', '\x2', '\x2', '?', '\xCB', 
		'\x3', '\x2', '\x2', '\x2', '\x41', '\xE8', '\x3', '\x2', '\x2', '\x2', 
		'\x43', '\xEA', '\x3', '\x2', '\x2', '\x2', '\x45', '\xED', '\x3', '\x2', 
		'\x2', '\x2', 'G', '\xF7', '\x3', '\x2', '\x2', '\x2', 'I', '\x101', '\x3', 
		'\x2', '\x2', '\x2', 'K', '\x103', '\x3', '\x2', '\x2', '\x2', 'M', '\x10B', 
		'\x3', '\x2', '\x2', '\x2', 'O', '\x113', '\x3', '\x2', '\x2', '\x2', 
		'Q', '\x11B', '\x3', '\x2', '\x2', '\x2', 'S', '\x11D', '\x3', '\x2', 
		'\x2', '\x2', 'U', '\x122', '\x3', '\x2', '\x2', '\x2', 'W', '\x124', 
		'\x3', '\x2', '\x2', '\x2', 'Y', '\x12D', '\x3', '\x2', '\x2', '\x2', 
		'[', '\x133', '\x3', '\x2', '\x2', '\x2', ']', '\x135', '\x3', '\x2', 
		'\x2', '\x2', '_', '\x13B', '\x3', '\x2', '\x2', '\x2', '\x61', '\x62', 
		'\a', '}', '\x2', '\x2', '\x62', '\x4', '\x3', '\x2', '\x2', '\x2', '\x63', 
		'\x64', '\a', '\x7F', '\x2', '\x2', '\x64', '\x6', '\x3', '\x2', '\x2', 
		'\x2', '\x65', '\x66', '\a', 'n', '\x2', '\x2', '\x66', 'g', '\a', 'q', 
		'\x2', '\x2', 'g', 'h', '\a', 'q', '\x2', '\x2', 'h', 'i', '\a', 'r', 
		'\x2', '\x2', 'i', '\b', '\x3', '\x2', '\x2', '\x2', 'j', 'k', '\a', 'g', 
		'\x2', '\x2', 'k', 'l', '\a', 'p', '\x2', '\x2', 'l', 'm', '\a', '\x66', 
		'\x2', '\x2', 'm', '\n', '\x3', '\x2', '\x2', '\x2', 'n', 'o', '\a', 'h', 
		'\x2', '\x2', 'o', 'p', '\a', 'q', '\x2', '\x2', 'p', 'q', '\a', 't', 
		'\x2', '\x2', 'q', '\f', '\x3', '\x2', '\x2', '\x2', 'r', 's', '\a', 'k', 
		'\x2', '\x2', 's', 't', '\a', 'p', '\x2', '\x2', 't', '\xE', '\x3', '\x2', 
		'\x2', '\x2', 'u', 'v', '\a', '\x64', '\x2', '\x2', 'v', 'w', '\a', 't', 
		'\x2', '\x2', 'w', 'x', '\a', 'g', '\x2', '\x2', 'x', 'y', '\a', '\x63', 
		'\x2', '\x2', 'y', 'z', '\a', 'm', '\x2', '\x2', 'z', '\x10', '\x3', '\x2', 
		'\x2', '\x2', '{', '|', '\a', '\x65', '\x2', '\x2', '|', '}', '\a', 'q', 
		'\x2', '\x2', '}', '~', '\a', 'p', '\x2', '\x2', '~', '\x7F', '\a', 'v', 
		'\x2', '\x2', '\x7F', '\x80', '\a', 'k', '\x2', '\x2', '\x80', '\x81', 
		'\a', 'p', '\x2', '\x2', '\x81', '\x82', '\a', 'w', '\x2', '\x2', '\x82', 
		'\x83', '\a', 'g', '\x2', '\x2', '\x83', '\x12', '\x3', '\x2', '\x2', 
		'\x2', '\x84', '\x85', '\a', 't', '\x2', '\x2', '\x85', '\x86', '\a', 
		'g', '\x2', '\x2', '\x86', '\x87', '\a', 'v', '\x2', '\x2', '\x87', '\x88', 
		'\a', 'w', '\x2', '\x2', '\x88', '\x89', '\a', 't', '\x2', '\x2', '\x89', 
		'\x8A', '\a', 'p', '\x2', '\x2', '\x8A', '\x14', '\x3', '\x2', '\x2', 
		'\x2', '\x8B', '\x8C', '\a', '\x66', '\x2', '\x2', '\x8C', '\x8D', '\a', 
		'q', '\x2', '\x2', '\x8D', '\x16', '\x3', '\x2', '\x2', '\x2', '\x8E', 
		'\x8F', '\a', '.', '\x2', '\x2', '\x8F', '\x18', '\x3', '\x2', '\x2', 
		'\x2', '\x90', '\x91', '\a', '\x30', '\x2', '\x2', '\x91', '\x1A', '\x3', 
		'\x2', '\x2', '\x2', '\x92', '\x93', '\a', ']', '\x2', '\x2', '\x93', 
		'\x1C', '\x3', '\x2', '\x2', '\x2', '\x94', '\x95', '\a', '_', '\x2', 
		'\x2', '\x95', '\x1E', '\x3', '\x2', '\x2', '\x2', '\x96', '\x97', '\a', 
		'*', '\x2', '\x2', '\x97', ' ', '\x3', '\x2', '\x2', '\x2', '\x98', '\x99', 
		'\a', '+', '\x2', '\x2', '\x99', '\"', '\x3', '\x2', '\x2', '\x2', '\x9A', 
		'\x9B', '\a', 'P', '\x2', '\x2', '\x9B', '\x9C', '\a', 'q', '\x2', '\x2', 
		'\x9C', '\x9D', '\a', 'p', '\x2', '\x2', '\x9D', '\x9E', '\a', 'g', '\x2', 
		'\x2', '\x9E', '$', '\x3', '\x2', '\x2', '\x2', '\x9F', '\xA0', '\a', 
		'/', '\x2', '\x2', '\xA0', '&', '\x3', '\x2', '\x2', '\x2', '\xA1', '\xA2', 
		'\a', '\x80', '\x2', '\x2', '\xA2', '(', '\x3', '\x2', '\x2', '\x2', '\xA3', 
		'\xA4', '\a', 'k', '\x2', '\x2', '\xA4', '\xA5', '\a', 'h', '\x2', '\x2', 
		'\xA5', '*', '\x3', '\x2', '\x2', '\x2', '\xA6', '\xA7', '\a', 'h', '\x2', 
		'\x2', '\xA7', '\xA8', '\a', 'w', '\x2', '\x2', '\xA8', '\xA9', '\a', 
		'p', '\x2', '\x2', '\xA9', ',', '\x3', '\x2', '\x2', '\x2', '\xAA', '\xAB', 
		'\a', '/', '\x2', '\x2', '\xAB', '\xAC', '\a', '@', '\x2', '\x2', '\xAC', 
		'.', '\x3', '\x2', '\x2', '\x2', '\xAD', '\xAE', '\a', 'g', '\x2', '\x2', 
		'\xAE', '\xAF', '\a', 'n', '\x2', '\x2', '\xAF', '\xB0', '\a', 'u', '\x2', 
		'\x2', '\xB0', '\xB1', '\a', 'g', '\x2', '\x2', '\xB1', '\x30', '\x3', 
		'\x2', '\x2', '\x2', '\xB2', '\xB3', '\a', 'g', '\x2', '\x2', '\xB3', 
		'\xB4', '\a', 'n', '\x2', '\x2', '\xB4', '\xB5', '\a', 'k', '\x2', '\x2', 
		'\xB5', '\xB6', '\a', 'h', '\x2', '\x2', '\xB6', '\x32', '\x3', '\x2', 
		'\x2', '\x2', '\xB7', '\xB8', '\a', '<', '\x2', '\x2', '\xB8', '\x34', 
		'\x3', '\x2', '\x2', '\x2', '\xB9', '\xBA', '\a', 'p', '\x2', '\x2', '\xBA', 
		'\xBB', '\a', 'q', '\x2', '\x2', '\xBB', '\xBC', '\a', 'v', '\x2', '\x2', 
		'\xBC', '\x36', '\x3', '\x2', '\x2', '\x2', '\xBD', '\xBE', '\a', '\x63', 
		'\x2', '\x2', '\xBE', '\xBF', '\a', 'p', '\x2', '\x2', '\xBF', '\xC0', 
		'\a', '\x66', '\x2', '\x2', '\xC0', '\x38', '\x3', '\x2', '\x2', '\x2', 
		'\xC1', '\xC2', '\a', 'q', '\x2', '\x2', '\xC2', '\xC3', '\a', 't', '\x2', 
		'\x2', '\xC3', ':', '\x3', '\x2', '\x2', '\x2', '\xC4', '\xC5', '\a', 
		'v', '\x2', '\x2', '\xC5', '\xC6', '\a', 'j', '\x2', '\x2', '\xC6', '\xC7', 
		'\a', 'g', '\x2', '\x2', '\xC7', '\xC8', '\a', 'p', '\x2', '\x2', '\xC8', 
		'<', '\x3', '\x2', '\x2', '\x2', '\xC9', '\xCA', '\a', '?', '\x2', '\x2', 
		'\xCA', '>', '\x3', '\x2', '\x2', '\x2', '\xCB', '\xCF', '\a', '%', '\x2', 
		'\x2', '\xCC', '\xCE', '\n', '\x2', '\x2', '\x2', '\xCD', '\xCC', '\x3', 
		'\x2', '\x2', '\x2', '\xCE', '\xD1', '\x3', '\x2', '\x2', '\x2', '\xCF', 
		'\xCD', '\x3', '\x2', '\x2', '\x2', '\xCF', '\xD0', '\x3', '\x2', '\x2', 
		'\x2', '\xD0', '\xD2', '\x3', '\x2', '\x2', '\x2', '\xD1', '\xCF', '\x3', 
		'\x2', '\x2', '\x2', '\xD2', '\xD3', '\b', ' ', '\x2', '\x2', '\xD3', 
		'@', '\x3', '\x2', '\x2', '\x2', '\xD4', '\xE9', '\t', '\x3', '\x2', '\x2', 
		'\xD5', '\xD6', '\a', '@', '\x2', '\x2', '\xD6', '\xE9', '\a', '?', '\x2', 
		'\x2', '\xD7', '\xD8', '\a', '>', '\x2', '\x2', '\xD8', '\xE9', '\a', 
		'?', '\x2', '\x2', '\xD9', '\xDA', '\a', '?', '\x2', '\x2', '\xDA', '\xE9', 
		'\a', '?', '\x2', '\x2', '\xDB', '\xDC', '\a', '#', '\x2', '\x2', '\xDC', 
		'\xE9', '\a', '?', '\x2', '\x2', '\xDD', '\xE9', '\x4', ',', '-', '\x2', 
		'\xDE', '\xDF', '\a', ',', '\x2', '\x2', '\xDF', '\xE9', '\a', ',', '\x2', 
		'\x2', '\xE0', '\xE9', '\a', '\x31', '\x2', '\x2', '\xE1', '\xE2', '\a', 
		'\x31', '\x2', '\x2', '\xE2', '\xE9', '\a', '\x31', '\x2', '\x2', '\xE3', 
		'\xE9', '\t', '\x4', '\x2', '\x2', '\xE4', '\xE5', '\a', '>', '\x2', '\x2', 
		'\xE5', '\xE9', '\a', '>', '\x2', '\x2', '\xE6', '\xE7', '\a', '@', '\x2', 
		'\x2', '\xE7', '\xE9', '\a', '@', '\x2', '\x2', '\xE8', '\xD4', '\x3', 
		'\x2', '\x2', '\x2', '\xE8', '\xD5', '\x3', '\x2', '\x2', '\x2', '\xE8', 
		'\xD7', '\x3', '\x2', '\x2', '\x2', '\xE8', '\xD9', '\x3', '\x2', '\x2', 
		'\x2', '\xE8', '\xDB', '\x3', '\x2', '\x2', '\x2', '\xE8', '\xDD', '\x3', 
		'\x2', '\x2', '\x2', '\xE8', '\xDE', '\x3', '\x2', '\x2', '\x2', '\xE8', 
		'\xE0', '\x3', '\x2', '\x2', '\x2', '\xE8', '\xE1', '\x3', '\x2', '\x2', 
		'\x2', '\xE8', '\xE3', '\x3', '\x2', '\x2', '\x2', '\xE8', '\xE4', '\x3', 
		'\x2', '\x2', '\x2', '\xE8', '\xE6', '\x3', '\x2', '\x2', '\x2', '\xE9', 
		'\x42', '\x3', '\x2', '\x2', '\x2', '\xEA', '\xEB', '\a', '^', '\x2', 
		'\x2', '\xEB', '\xEC', '\a', '$', '\x2', '\x2', '\xEC', '\x44', '\x3', 
		'\x2', '\x2', '\x2', '\xED', '\xF2', '\a', '$', '\x2', '\x2', '\xEE', 
		'\xF1', '\x5', '\x43', '\"', '\x2', '\xEF', '\xF1', '\n', '\x5', '\x2', 
		'\x2', '\xF0', '\xEE', '\x3', '\x2', '\x2', '\x2', '\xF0', '\xEF', '\x3', 
		'\x2', '\x2', '\x2', '\xF1', '\xF4', '\x3', '\x2', '\x2', '\x2', '\xF2', 
		'\xF0', '\x3', '\x2', '\x2', '\x2', '\xF2', '\xF3', '\x3', '\x2', '\x2', 
		'\x2', '\xF3', '\xF5', '\x3', '\x2', '\x2', '\x2', '\xF4', '\xF2', '\x3', 
		'\x2', '\x2', '\x2', '\xF5', '\xF6', '\a', '$', '\x2', '\x2', '\xF6', 
		'\x46', '\x3', '\x2', '\x2', '\x2', '\xF7', '\xF8', '\t', '\x6', '\x2', 
		'\x2', '\xF8', 'H', '\x3', '\x2', '\x2', '\x2', '\xF9', '\xFB', '\x5', 
		'Q', ')', '\x2', '\xFA', '\xF9', '\x3', '\x2', '\x2', '\x2', '\xFB', '\xFC', 
		'\x3', '\x2', '\x2', '\x2', '\xFC', '\xFA', '\x3', '\x2', '\x2', '\x2', 
		'\xFC', '\xFD', '\x3', '\x2', '\x2', '\x2', '\xFD', '\x102', '\x3', '\x2', 
		'\x2', '\x2', '\xFE', '\x102', '\x5', 'K', '&', '\x2', '\xFF', '\x102', 
		'\x5', 'M', '\'', '\x2', '\x100', '\x102', '\x5', 'O', '(', '\x2', '\x101', 
		'\xFA', '\x3', '\x2', '\x2', '\x2', '\x101', '\xFE', '\x3', '\x2', '\x2', 
		'\x2', '\x101', '\xFF', '\x3', '\x2', '\x2', '\x2', '\x101', '\x100', 
		'\x3', '\x2', '\x2', '\x2', '\x102', 'J', '\x3', '\x2', '\x2', '\x2', 
		'\x103', '\x104', '\a', '\x32', '\x2', '\x2', '\x104', '\x108', '\a', 
		'z', '\x2', '\x2', '\x105', '\x107', '\t', '\a', '\x2', '\x2', '\x106', 
		'\x105', '\x3', '\x2', '\x2', '\x2', '\x107', '\x10A', '\x3', '\x2', '\x2', 
		'\x2', '\x108', '\x106', '\x3', '\x2', '\x2', '\x2', '\x108', '\x109', 
		'\x3', '\x2', '\x2', '\x2', '\x109', 'L', '\x3', '\x2', '\x2', '\x2', 
		'\x10A', '\x108', '\x3', '\x2', '\x2', '\x2', '\x10B', '\x10C', '\a', 
		'\x32', '\x2', '\x2', '\x10C', '\x110', '\a', 'q', '\x2', '\x2', '\x10D', 
		'\x10F', '\t', '\b', '\x2', '\x2', '\x10E', '\x10D', '\x3', '\x2', '\x2', 
		'\x2', '\x10F', '\x112', '\x3', '\x2', '\x2', '\x2', '\x110', '\x10E', 
		'\x3', '\x2', '\x2', '\x2', '\x110', '\x111', '\x3', '\x2', '\x2', '\x2', 
		'\x111', 'N', '\x3', '\x2', '\x2', '\x2', '\x112', '\x110', '\x3', '\x2', 
		'\x2', '\x2', '\x113', '\x114', '\a', '\x32', '\x2', '\x2', '\x114', '\x118', 
		'\a', '\x64', '\x2', '\x2', '\x115', '\x117', '\t', '\t', '\x2', '\x2', 
		'\x116', '\x115', '\x3', '\x2', '\x2', '\x2', '\x117', '\x11A', '\x3', 
		'\x2', '\x2', '\x2', '\x118', '\x116', '\x3', '\x2', '\x2', '\x2', '\x118', 
		'\x119', '\x3', '\x2', '\x2', '\x2', '\x119', 'P', '\x3', '\x2', '\x2', 
		'\x2', '\x11A', '\x118', '\x3', '\x2', '\x2', '\x2', '\x11B', '\x11C', 
		'\t', '\n', '\x2', '\x2', '\x11C', 'R', '\x3', '\x2', '\x2', '\x2', '\x11D', 
		'\x11E', '\x5', 'I', '%', '\x2', '\x11E', '\x11F', '\a', '\x30', '\x2', 
		'\x2', '\x11F', '\x120', '\x5', 'I', '%', '\x2', '\x120', 'T', '\x3', 
		'\x2', '\x2', '\x2', '\x121', '\x123', '\t', '\v', '\x2', '\x2', '\x122', 
		'\x121', '\x3', '\x2', '\x2', '\x2', '\x123', 'V', '\x3', '\x2', '\x2', 
		'\x2', '\x124', '\x129', '\x5', 'U', '+', '\x2', '\x125', '\x128', '\x5', 
		'Q', ')', '\x2', '\x126', '\x128', '\x5', 'U', '+', '\x2', '\x127', '\x125', 
		'\x3', '\x2', '\x2', '\x2', '\x127', '\x126', '\x3', '\x2', '\x2', '\x2', 
		'\x128', '\x12B', '\x3', '\x2', '\x2', '\x2', '\x129', '\x127', '\x3', 
		'\x2', '\x2', '\x2', '\x129', '\x12A', '\x3', '\x2', '\x2', '\x2', '\x12A', 
		'X', '\x3', '\x2', '\x2', '\x2', '\x12B', '\x129', '\x3', '\x2', '\x2', 
		'\x2', '\x12C', '\x12E', '\t', '\f', '\x2', '\x2', '\x12D', '\x12C', '\x3', 
		'\x2', '\x2', '\x2', '\x12E', '\x12F', '\x3', '\x2', '\x2', '\x2', '\x12F', 
		'\x12D', '\x3', '\x2', '\x2', '\x2', '\x12F', '\x130', '\x3', '\x2', '\x2', 
		'\x2', '\x130', '\x131', '\x3', '\x2', '\x2', '\x2', '\x131', '\x132', 
		'\b', '-', '\x2', '\x2', '\x132', 'Z', '\x3', '\x2', '\x2', '\x2', '\x133', 
		'\x134', '\a', '\xF', '\x2', '\x2', '\x134', '\\', '\x3', '\x2', '\x2', 
		'\x2', '\x135', '\x136', '\a', '\f', '\x2', '\x2', '\x136', '^', '\x3', 
		'\x2', '\x2', '\x2', '\x137', '\x139', '\x5', '[', '.', '\x2', '\x138', 
		'\x137', '\x3', '\x2', '\x2', '\x2', '\x138', '\x139', '\x3', '\x2', '\x2', 
		'\x2', '\x139', '\x13A', '\x3', '\x2', '\x2', '\x2', '\x13A', '\x13C', 
		'\x5', ']', '/', '\x2', '\x13B', '\x138', '\x3', '\x2', '\x2', '\x2', 
		'\x13C', '\x13D', '\x3', '\x2', '\x2', '\x2', '\x13D', '\x13B', '\x3', 
		'\x2', '\x2', '\x2', '\x13D', '\x13E', '\x3', '\x2', '\x2', '\x2', '\x13E', 
		'`', '\x3', '\x2', '\x2', '\x2', '\x13', '\x2', '\xCF', '\xE8', '\xF0', 
		'\xF2', '\xFC', '\x101', '\x106', '\x108', '\x110', '\x118', '\x122', 
		'\x127', '\x129', '\x12F', '\x138', '\x13D', '\x3', '\b', '\x2', '\x2',
	};

	public static readonly ATN _ATN =
		new ATNDeserializer().Deserialize(_serializedATN);


}