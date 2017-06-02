python << EOF

import vim
import time
with open("aaa.txt", 'r+') as f:
    aaa = f.readlines()
aaa = [line.rstrip("\r\n") for line in aaa]

vim.command("vsp test.txt | setlocal ul=-1")
b = vim.current.buffer
vim.command("hide")

EOF

function! Test()

python << EOF

del b[:] # there is an issue here

vim.command("vsp test.txt")

start = time.time()
b[:] = aaa
print(time.time() - start)

EOF
endfunction

map <F5> :call Test()<CR>
