% Generate a square Pulse: x(t)
T = 2; 
fo = 1/T; 
wo = 2*pi*fo;
t = -2.5:0.01:2.5;
xt = square(wo*t);

% Now synthesize Fourier Series of the given x(t) using the analysis
% equation. Substitute ak in the synthesis equation as follows: 
a_0 = 0; 
x_c = a_0; 

for k = -10:1:10
    if (k==0)
    continue  
    else
       ak = (1 - cos(k*wo))/(j*wo*k); 
       x_c = x_c + ak.*exp(j*k*wo.*t); 
    end
    
    
end

subplot(2, 1, 1)
plot(t, xt)
title("Original Signal: Periodic Square pulse with T = " + T)
ylim([-3, 3])

subplot(2, 1, 2)
plot(t, x_c)
title("Synthesized Signal: Number of fourier components used: " + 2*k)
ylim([-3, 3])