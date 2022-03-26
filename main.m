close all, clear all, clc

load('mammografic_data_train.mat')

[Xout, yout] = clean_feature(Xid,yid);

[N,n]=size(yout); 
n = round(n*0.8); %n length of training data

X_training = Xout(:,1:n);
X_prediction = Xout(:,n+1:end);

y_training = yout(1:n);
y_prediction = yout(n+1:end);

[alphas, b, index,sigma] = optimization_training (X_training, y_training);
alphas_sv = alphas(index);
y_sv = y_training(index);
X_sv = X_training(:,index);
%[alphas_sv, X_sv, y_sv] = supp_vectors(alphas, X_training, y_training, index);

[F1,Precision,Recall,y_hat] = prediction(alphas_sv,b, X_sv, y_sv ,X_prediction,y_prediction,sigma );

