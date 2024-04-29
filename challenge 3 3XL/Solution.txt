from collections import defaultdict

lines = open('input.txt').read().splitlines()
regs = defaultdict(int)
mxv = 0
for line in lines:
    reg, inst, num, iff, regc, op, num2 = line.split()
    if eval("regs[regc] " + op + num2):
        if inst == 'inc':
            regs[reg] += int(num)
            mxv = max(mxv, regs[reg])
        else:
            regs[reg] -= int(num)

print(max(regs.values()))