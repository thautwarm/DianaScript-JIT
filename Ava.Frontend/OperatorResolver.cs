/*
C# implementation of "operator bubbling".
The original works of this algorithm is made by Taine Zhao(twshere@outlook.com) and this file is licensed under MPL-2.0.
*/
using System;
using System.Collections.Generic;
using System.Linq;


namespace Ava.Frontend
{

    public class Operator<Op>
    {
        public string opname;
        public Op op;
        public Operator(string opname, Op op)
        {
            this.opname = opname;
            this.op = op;
        }
    }
    public class Doubly<Op, Exp>
    where Exp : class
    {
        public Doubly<Op, Exp> l;
        public object mid;
        public Operator<Op> op => mid as Operator<Op>;
        public Exp value { get => mid as Exp; set => mid = value; }
        public Doubly<Op, Exp> r;

        public Doubly(Doubly<Op, Exp> l, object mid, Doubly<Op, Exp> r)
        {
            this.l = l;
            this.mid = mid;
            this.r = r;
        }

    }


    public class OperatorResolver<Op, Exp>
    where Exp : class
    {

        public static Dictionary<string, int> StandardPrecedences = new Dictionary<string, int>
        {
            {"==", 2},
            {"!=", 2},
            {"<", 2},
            {">", 2},
            {"<=", 2},
            {">=", 2},
            {"=", 2},
            {"notin", 2},
            {"in", 2},
            {"|", 3},
            {"^", 4},
            {"&", 5},
            {">>", 6},
            {"<<", 6},
            {"+", 7},
            {"-", 7},
            {"*", 8},
            {"/", 8},
            {"//", 8},
            {"%", 8},
            {"**", 9}
        };
        public static Dictionary<string, bool> StandardAssociativities = new Dictionary<string, bool> { { "**", true } };

        public Func<Op, Exp, Exp, Exp> opcons;
        public Dictionary<string, bool> associativities;
        public Dictionary<string, int> precedences;

        public OperatorResolver(Func<Op, Exp, Exp, Exp> opcons, Dictionary<string, bool> associativities = null, Dictionary<string, int> precedences = null)
        {
            this.opcons = opcons;
            this.associativities = associativities ?? StandardAssociativities;
            this.precedences = precedences ?? StandardPrecedences;
        }

        public Exp binopReduce(List<object> seq)
        {
            var start = new Doubly<Op, Exp>(null, null, null);

            var last = start;
            var ops = new List<Doubly<Op, Exp>>();

            foreach (var each in seq)
            {
                Doubly<Op, Exp> cur;
                switch (each)
                {
                    case Exp exp:
                        cur = new Doubly<Op, Exp>(last, each, null);
                        break;

                    case Operator<Op> op:
                        cur = new Doubly<Op, Exp>(last, each, null);
                        ops.Add(cur);
                        break;
                    default:
                        throw new ArgumentException("input sequence should contains specified operator and expression only.");

                }
                last.r = cur;
                last = cur;
            }

            var final = new Doubly<Op, Exp>(last, null, null);

            last.r = final;
            var op_chunks = new Dictionary<
            (int precedence, bool assoc), List<Doubly<Op, Exp>>>();

            foreach (var op in ops)
            {
                var opname = op.op.opname;
                var key = (precedences[opname],
                associativities.GetValueOrDefault(opname, false));
                if (op_chunks.TryGetValue(key, out var group))
                {
                    group.Add(op);
                }
                else
                {
                    group = new List<Doubly<Op, Exp>>{
                        op
                    };
                    op_chunks[key] = group;
                }
            }
            var op_chunks2 = op_chunks.Select(x => (x.Key, x.Value)).ToList();

            op_chunks2.Sort(
                (a, b) => b.Key.precedence.CompareTo(a.Key.precedence)
            );
            ops = new List<Doubly<Op, Exp>>();
            foreach (((var _, var is_right_assoc), var chunk) in op_chunks2)
            {
                if (is_right_assoc)
                {
                    ops.AddRange(chunk.Reverse<Doubly<Op, Exp>>());
                }
                else
                {
                    ops.AddRange(chunk);
                }
            }
            foreach (var op in ops)
            {
                var op_v = op.op;
                op.value = opcons(op_v.op, op.l.value, op.r.value);
                op.l = op.l.l;
                op.r = op.r.r;
                op.l.r = op;
                op.r.l = op;
            }
            return final.l.value;
        }
    }
}