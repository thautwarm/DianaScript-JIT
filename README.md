## dina

Now we have .NET native parser for dianascript:

```bash
dotnet run
> func fix(f, x) f(func self(x) fix(f, x) end, x) end
fix
> func fact(self, x) if x < 1 then 1 else self(x - 1) * x end end
fact
> fix(fact, 10)
3628800
```