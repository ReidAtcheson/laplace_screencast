#include <stdlib.h>
#include <stdio.h>
#include <tgmath.h>





void laplace1D_rhs(long N,const double* u, double* out);
void driver(double alpha,long iter, long N, double a, double b,double* u_out);











void laplace1D_rhs(long N, const double* u, double* out){

	long i;
	long j;
	/*Left BC.*/
	i=0;
	out[i]=-(u[i+1]-2*u[i]);


	/*Right BC.*/
	i=N-3;
	out[i]=-(-2*u[i]+u[i-1]);


	/*Inner nodes.*/
	i=1;
	for(j=i;j<(N-3);j++){
		out[j]=-(u[j+1]-2*u[j]+u[j-1]);
	}

}


void driver(double alpha, long iter, long N, double a, double b, double* u_out){
	long i;
	/*Set up load vector.*/
	double* f = malloc( (N-2)*sizeof(double) );
	for(i=0;i<N-2;i++){
		f[i]=0.0;
	}

	/*Left BC.*/
	i=0;
	f[i]=a;

	/*Right BC.*/
	i=N-3;
	f[i]=b;

	/*Interior solution storage.*/
	double* u=malloc( (N-2)*sizeof(double) );
	/*Output storage for RHS evaluations.*/
	double* out=malloc( (N-2)*sizeof(double) );

	for(i=0;i<N-2;i++){
		u[i]=0.0;
		out[i]=0.0;
	}

	/*Richardson iterations.*/	
	long it=0;
	while(it<iter){
		laplace1D_rhs(N,u,out);
		for(i=0;i<N-2;i++){
			u[i]=u[i]+alpha*(f[i]-out[i]);
		}
	it++;
	}


	/*Populate output vector.*/
	u_out[0]=a;u_out[N-1]=b;
	for(i=1;i<N-1;i++)
		u_out[i]=u[i-1];



	free(f);
	free(out);
	free(u);

}
