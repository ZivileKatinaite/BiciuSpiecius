clc
f =100*rand(10,1) %reikia isrusiuoti ir isrinkti 10 geriausiu nuo 0 iki 100
x = rand(10,2)

[f_sort, f_sort_ind] = sort(f)
x_sort = x(f_sort_ind,:)
f_sort_10 = f_sort(1:10) 
x_sort_10 = x_sort(1:10,:) 
