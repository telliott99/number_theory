def gcd(a,b):
    if a < b:
        a,b = b,a
    r = a % b
    if r == 0:
        return b
    return gcd(b,r)


N = 501
L = [i**2 for i in range(2,N)]
rL = list()

for i in range(1,N,2):
    for j in range(2,N,2):
        csq = i**2 + j**2
        try:
            k = L.index(i**2 + j**2)
        except ValueError:
            continue
        if gcd(i,j) != 1:
            continue
        k += 2
        assert i**2 + j**2 == k**2
        rL.append(sorted([i, j, k]))

rL.sort()
rL = [t for t in rL if not t[0] > 50]

for i,triple in enumerate(rL):
    if i and not i % 4:
        print
    t = [str(n).rjust(3) for n in triple]
    print ' '.join(t), '  ',
