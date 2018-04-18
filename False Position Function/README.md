# False Position Function
##### This function determines the root of a given function using false position.
**Inputs**
* func - the function being evaluated
* xl - the lower guess
* xu - the upper guess
* es - the desired relative error
* maxiter - the maximum number of iterations desired
**Outputs**
* root - the estimated root location
* fx - the function evaluated at the root location
* ea - the approximate relative error (%)
* iter - the amount of iterations that were performed
