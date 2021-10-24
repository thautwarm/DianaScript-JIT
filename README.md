## dina

Now we have .NET native parser for dianascript:

```bash
dotnet run
> fun fix(f, x) f(fun self(x) fix(f, x) end, x) end
fix
> fun fact(self, x) if x < 1 then 1 else self(x - 1) * x end end
fact
> fix(fact, 10)
3628800
```