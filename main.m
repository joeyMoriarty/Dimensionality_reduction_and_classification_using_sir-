load data.txt
Member=data(1,:);
Member(Member==3)=Member(Member==3)-1;

data=data(3:end,:);
no_of_wrong=0;

noOfClas=length(unique(Member));
Prior=zeros(noOfClas,1);
for i=1:noOfClas
    ind=find(Member==i);
    Prior(i)=length(ind)/length(Member);
end

id=1:152;
for i=1:152
    It=id(i~=id);
dataTr=data(:,It);
MemberTr=Member(It);
dataTe=data(:,i);
MemberTe=Member(i);

        
Vl=Sir(dataTr,MemberTr,3);
Data_Proj_Tr=dataTr'*Vl;
    

Data_Proj_Te=(dataTe')*Vl;
 
    
no_of_wrong=no_of_wrong+sum(MemberTe~=classify(Data_Proj_Te,Data_Proj_Tr,MemberTr));

end
error=no_of_wrong/(length(Member));
%[V E]=modified_PCA(data);
correct_classification=(1-error)*100
A = data'*Vl;
X=zeros(length(A));
for i=1:152
    for j=i+1:152
        X(i,j)=norm(A(i)-A(j));
    end
end
X=X+X';
X=X/(max(max(X)));
figure(5)
 [Xm,Ym]=meshgrid(1:152,1:152);
 surf(Xm,Ym,X)
l=linspace(0,mean(mean(X)),100);%exp(1./1:1:100);
 for i = 1:100
  
     j=l(i);
R=X<j;
H=graph(R,'omitselfloops');
figure(1)
plot(H)
title("threshold="+j);
drawnow
pause(1)
G = adjacency(H);
G = full(G);
d = distances(H);
d(d==Inf)=NaN;
dia = max(max(d))

S = G*G*G;
k_i = sum(G);

clu = trace(S)/sum((k_i).*(k_i-1));
figure(2)
xlabel('p')
ylabel('clustering coeff')
plot(j,clu,'.'); hold on

figure(3)
xlabel('log(p)')
ylabel('log(clustering coeff)')
plot(log(j),log(clu),'.'); hold on

figure(4)
%subplot(2,2,3)
xlabel('p')
ylabel('diameter')
plot(j,dia,'.');hold on
 
end
