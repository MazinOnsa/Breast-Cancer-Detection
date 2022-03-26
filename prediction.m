function [F1,pr,rec,y]=prediction(alphas_sv, bias, X_sv, y_sv , X , y_act,opt_sigma)

[n,N]=size(X);
% [m,M]=size(SVM_model.SupportVectors);
y=zeros(N,1);

tp = 0;
fp = 0;
fn=0;
tn=0;

for k=1:N
  y(k) = sign(  sum(alphas_sv .* y_sv' .* full_kernel(X_sv' , X(:,k) , opt_sigma ,1 )    ) + bias);
  
if y_act(k) == 1

    if y(k)==y_act(k)
        tp = tp + 1; %TP predicted correctly has cancer
    else
        fn = fn +1; %FP false alarm (predicted fasely has cancer)
    end    
else
    if y(k) == 1
        fp = fp+1;
    else 
        tn = tn+1; 
    end
end

end
%no_predic_pos = tp+fp; %TP+FN

pr = tp / (tp+fp); %precision have and detected

rec = tp/ (tp+fn); %recall 

F1 = 2/(inv(rec)+inv(pr));

