export void laplace1D_rhs(uniform int64 N, uniform double u[],uniform double out[]){
	foreach(i = 1 ... N-3){
		out[i]=-(u[i+1]-2*u[i]+u[i-1]);
	}
}

export void laplace1D_update(uniform int64 N, 
	uniform double u[],
	uniform double f[],
	uniform double out[],
	uniform double alpha){
	foreach(i = 0 ... N-2){
		u[i]=u[i]+alpha*(f[i]-out[i]);
	}
}
