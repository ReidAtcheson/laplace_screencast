<h1> Laplace1D in Julia </h1>


<p>
A quick example of a one dimensional Laplace equation solved
using a finite difference method in both Julia and in C. The
following optimizations were iteratively performed on the
Julia code until performance reached that of C:
</p>

<ul>
<li> Type annotations. 									</li>
<li> Devectorization.  									</li>
<li> Replacing hotspots with C kernels. </li>

</ul>


<p>
IPython notebooks are provided to show the relative performance of
each optimization. Type annotations didn't do much in this case,
devectorization offered a sizable performance gain, and then
very short ISPC codes were used to replace hotspots in the
Julia code. As might be expected, the final optimization is what 
yielded C-like performance, but the useful thing of note here
is the rapid iteration from working prototype to C performance
which Julia made possible.

I wrote this code while on a plane.
</p>
