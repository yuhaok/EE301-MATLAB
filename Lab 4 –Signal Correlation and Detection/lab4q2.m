code_1 = code_signal(75,10); 
code_2 = code_signal(50,10); 
code_3 = code_signal(204,10);
Rcorr12 = run_corr(code_1, code_2);
Rcorr33 = run_corr(code_3, code_3); 
subplot(2,1,1);
plot(1:length(Rcorr12), Rcorr12);
title('Running Correlation for Code 1 and Code 2');
subplot(2,1,2);
plot(1:length(Rcorr33), Rcorr33);
title('Running Correlation for Code31 and Code 3');

%c) Yes it?s symmetric. 
%The max value of the correlation signal is equal to the energy of code_3