beta = 0.5; sigma = 0.1; gamma = 0.1; mu = 0.01;
R0 = (beta*sigma)/((sigma+mu)*(gamma+mu));
S_star = 1/R0;
I_star = (mu/(gamma+mu)) * (1 - 1/R0);
E_star = (gamma+mu)/sigma * I_star;
J_EE = [ -beta*I_star - mu,    0,           -beta*S_star; 
          beta*I_star,        -(sigma+mu),   beta*S_star; 
          0,                   sigma,       -(gamma+mu) ];
eigenvalues = eig(J_EE)
