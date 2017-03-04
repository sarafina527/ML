[attrib1, attrib2, attrib3, attrib4, class] = textread(‘data\iris.data’, ‘%f%f%f%f%s’, ‘delim。iter’, ‘,’); 
attrib = [attrib1’; attrib2’; attrib3’; attrib4’]’; 
a = zeros(150, 1); 
a(strcmp(class, ‘Iris-setosa’)) = 1; 
a(strcmp(class, ‘Iris-versicolor’)) = 2; 
a(strcmp(class, ‘Iris-virginica’)) = 3; 