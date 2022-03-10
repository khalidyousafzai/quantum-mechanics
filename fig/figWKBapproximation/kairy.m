clear;
clf;
fid = fopen('kairyA.txt', 'w+');
    fprintf(fid, "x y");
    fprintf(fid, '\n');
for i=-8:0.01:4
    fprintf(fid, '%f ', i,airy(i));
    fprintf(fid, '\n');
end
fclose(fid);

fid = fopen('kairyB.txt', 'w+');
    fprintf(fid, "x y");
    fprintf(fid, '\n');
for i=-9:0.01:1.57
    fprintf(fid, '%f ', i,airy(2,i));
    fprintf(fid, '\n');
end
fclose(fid);

