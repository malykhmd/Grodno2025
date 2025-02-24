# Gauss, ver. 2.3
def triangulation(S):
    T=[]
    while S!=[]:
        m=max([s.lm() for s in S])
        L = [s for s in S if s.lm() == m]
        S = [s for s in S if s.lm() < m]
        f=L[0]
        T.append(f)
        for g in L[1:]:
            g=f.lc()*g-g.lc()*f
            if g!=0:
                S.append(g)
        D=[s for s in S if s.degree()==0]
        if D!=[]:
            return D
    return T
    
def tsolve(T):
    D={}
    while T!=[]:
        g=T[-1]
        D[g.lm()] = -(g-g.lt())/g.lc()
        T=[t.subs(D) for t in T[:-1]]
    return D
