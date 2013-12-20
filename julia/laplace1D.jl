#N - Number of 1D points to use.
#u - Input for RHS evaluation.
#out - Output of RHS evaluation.
function laplace1D_rhs!(N,u,out)
    
    #Left BC
    i=1
    out[i]=-(u[i+1]-2*u[i])

    #Right BC
    i=N-2
    out[i]=-(-2*u[i]+u[i-1])

    #Vectorized inner nodes. 
    i=2;
    out[i:(N-3)]=-(u[(i+1):(N-2)]-2*u[i:(N-3)]+u[(i-1):(N-4)])
end


function driver(alpha,iter,N,a,b,u_out)
    #Set up load vector.
    f=zeros(N-2)

    #Left BC.
    i=1
    f[i]=a

    #Right BC.
    i=N-2
    f[i]=b

    #Initial guess and residual storage.
    u=zeros(N-2)
    out=zeros(N-2)

    it=0
    while it<iter
     laplace1D_rhs!(N,u,out)
     u=u+alpha*(f-out)
     it=it+1
    end

    u_out[1]=a
    u_out[N]=b
    for i = 2 : N-1
        u_out[i]=u[i-1]
    end
end

#For debugging purposes: construct matrix from stencil
function laplace_matrix(N)

    A=zeros(N-2,N-2)
    E=zeros(N-2)
    out=zeros(N-2)

    #Multiply by identity matrix to get stencil matrix.
    for i = 1 : N-2
        E[i]=1.0
        laplace1D_rhs!(N,E,out)
        A[:,i]=out
        E[i]=0.0
    end

    return A


end
