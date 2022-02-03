%Author Nuruzzaman Faruqui
%You are free to use, modify or distribute this code
function output_value = load_database();
persistent loaded;
persistent numeric_Image;
if(isempty(loaded))
    all_Images = zeros(10304,40);
    for i=1:9
        cd(strcat('s',num2str(i)));
        for j=1:10
            image_Container = imread(strcat(num2str(j),'.pgm'));
            all_Images(:,(i-1)*10+j)=reshape(image_Container,size(image_Container,1)*size(image_Container,2),1);
        end
        display('Loading Database');
        cd ..
    end
    numeric_Image = uint8(all_Images);
end
loaded = 1;
output_value = numeric_Image;