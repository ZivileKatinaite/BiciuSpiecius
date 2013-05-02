function [f1_Min,x1_Min] = BiciuSpiecius(funkcija,a1,b1) %ka perduodam
% Particle swam (biciu spiecius) metodo realizacija              %FUNKCIJA PERDUODAM
%1. Sugeneruojame 100 atsitiktiniu tasku int [a;b]
%2. Surandame, kuriame fcija igyja didz.(maz) reiksme
%a1=-10;   %pradine sritis
%b1=10;
% PVZ.: [f1_Min,x1_Min] = BiciuSpiecius(@branin,-10,10)

n=2; %dimensija (matavimas)
k1=55; %tasku (vektoriu) skaicius; 
x1=a1 + (b1-a1).* rand(k1,n); %generuoja k1 tasku dvimaciu 
%rand(100,1) meta skaicius kurie yra tarp nulio ir vieno, viska
%100 skaiciu i du stulpelius ismeta
%sincos(x(1)) paskaiciuos pirmo x reiksme fcijos
f1 = [];
a1=-10;
b1=10;
for i=1:k1   
    f1(i)=sincos2(x1(i,:)); %reikia is 60 tsk rasti 10 geriausiu min
end
%surusiuosiu visas k reiksmes ir isrinksiu 10 maziausiu pagal fcijos reiksmes 
[f1_sort, f1_sort_ind] = sort(f1);
x1_sort = x1(f1_sort_ind,:);
f1_sort_10 = f1_sort(1:10); 
x1_sort_10 = x1_sort(1:10,:);

%surasta kol kas geriausios reiksmes ir taskas

%if
    f1_Min = f1_sort(1);
    x1_Min = x1_sort(1,:);
%end

%[fMin1,indMin1]=min(f1); %reikia sort komandos
%xMin1=x1(indMin1,:); 
%fprintf('Surastas min1 = %6.4f, taske x1 = (%6.4f, %6.4f)%\n',fMin1,xMin1(1),xMin1(2))

%braizome
hold on; %viska i viena brezti
scatter(x1(:,1),x1(:,2),'b.');
scatter(x1_sort_10(:,1),x1_sort_10(:,2),'r*');
  for i=1:10
    text(x1_sort_10(i,1)+0.3,x1_sort_10(i,2),num2str(i));
  end
rectangle('Position',[a1,a1,b1-a1,b1-a1],...
    'LineWidth',5,'LineStyle','--')

%PRASIDEDA KLONAVIMAS

   % pvz.: "sulietas" 1 taskas su 2
   %{
     x1_naujas = (x1_sort_10(1,:) + x1_sort_10(2,:))/2;
     f1_naujas = funkcija(x1_naujas(1,:));
     hold on   %nubreziama naujas taskas
     scatter(x1_naujas(1,1),x1_naujas(1,2),'g*');
     text(x1_naujas(1,1)+ 0.3, x1_naujas(1,2),num2str(f1_naujas));
   %}
  %reikia sulieti 1 taska su visais kitais 

  for i=1:9
     for j=i+1:10
        x1_naujas = (x1_sort_10(i,:) + x1_sort_10(j,:))/2;
        f1_naujas = funkcija(x1_naujas(1,:));  
        scatter(x1_naujas(1,1),x1_naujas(1,2),'g*');
        for ii=1:45
          for jj=1:45
             text(x1_naujas(1,1)+ 0.3, x1_naujas(ii,jj),num2str(f1_naujas(ii)));   
          end 
        end
     end
  end
  

   
   
   
   
   