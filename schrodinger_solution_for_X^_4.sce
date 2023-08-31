clc; clear;
clf();
m = 0.511D6;
h = 1973;
a = 10; n = 500; d = a/n
x = [-a/2:d:a/2]
//Creating Function for the Potential for infinite square well
function y = V(x)
    y = x^4
endfunction
//Part for making the matrix consisting of all the elements
for i=1:n-1
    xi = x(i+1)
    A(i,i) = 2*(1+(m*d*d/(h*h))* V(xi))
    if (i<n-1) then         
        A(i,i+1) = -1
        A(i+1,i) = -1
    end
end
//Finding the Eigenvaues and Eigenvector
// X = Eigenvector
// lambda = Eigenvector
[X,lambda] = spec(A)
//Printing the values of Psi
//We will include the 0 for the initial and the final value of the assumption that we took initially 
psi0 = [0;X(:,1);0]
psi1 = [0;X(:,2);0]
psi2 = [0;X(:,3);0]
psi3 = [0;X(:,4);0]
//plot
//Plotting the points showing the solutuions of the schor eq
subplot(1,2,1)
plot(x,psi0,'-o',x,psi1,'-*',x,psi2,'-s',x,psi3,'-+')
legend(['Ground state','First Excited State', 'Second excited state','Third excited state'])
xtitle('Plot for the Wave Function Solution','X','Y')
//For calculating the inner product we will take the inner product
subplot(1,2,2)
q = max(psi0.^2)+0.001
plot(x,psi0.^2,'-o',x,psi1.^2+q,'-*',x,psi2.^2+2*q,'-s',x,psi3.^2+3*q,'-+',x,V(x)/8000)
legend(['Ground state','First Excited State', 'Second excited state','Third excited state','Potential'])
xtitle('Plot for the probability Density','X','Y')
