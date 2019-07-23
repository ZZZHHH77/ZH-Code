BC_EZ =0;BC_PZ =0;BC_NIZ =0;
num_EZ =0;num_PZ =0;num_NIZ =0;
for i =1:33
    if ss(i).tag == 1
        BC_EZ = BC_EZ+aNLe(i);
        num_EZ = num_EZ+1;
    end
    if ss(i).tag == 2
        BC_PZ = BC_PZ+aNLe(i);
        num_PZ = num_PZ+1;
    end
    if ss(i).tag == 3
        BC_NIZ = BC_NIZ+aNLe(i);
        num_NIZ = num_NIZ+1;
    end
end
ans1 = BC_EZ/num_EZ;
ans2 = BC_PZ/num_PZ;
ans3 = BC_NIZ/num_NIZ;



MM = zscore(M_grey);
MM = M_grey;
bb = std2(MM);
bbb = mean2(MM);
aa= std2(M_grey);
aaa = mean2(M_grey);
th = bbb+6*bb;
for i =1:23
    for j =1:23
        if MM(i,j)<th
            MM(i,j) = 0;
        end
    end
end



    