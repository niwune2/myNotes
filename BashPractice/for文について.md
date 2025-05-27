# `for`文について

## 例_1

```bash
for file in memo.txt prog.c figure.png

do
    cp -p "$file$" "$file" .bak
done
```
