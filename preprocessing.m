n=1;
filenames = '';
poses = '';
faces = '';
load('testimages/anno.mat');
n_imgs = size(anno);
for n = 1:n_imgs(1)
    name = anno{n,1};
    filenames = [filenames char(name) '*'];
    img = imread(strcat('testimages/',char(name)));
    n_faces = size(anno{n,2});
    for k = 1:n_faces(2)
        locals = mat2str(anno{n,2}{1,k});
        ypr = mat2str(anno{n,3}{1,k});
        faces = [faces locals];
        poses = [poses ypr];
    end
    poses = [poses '*'];
    faces = [faces '*'];
end


fileID = fopen('filenames.txt','w');
fprintf(fileID,'%s',filenames);
fclose(fileID);

fileID = fopen('poses.txt','w');
fprintf(fileID,'%s',poses);
fclose(fileID);

fileID = fopen('faces.txt','w');
fprintf(fileID,'%s',faces);
fclose(fileID);