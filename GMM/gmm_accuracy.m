function [ Accuracy ] = gmm_accuracy( Data_fea, gnd_label, K )  
%Calculate the accuracy Clustered by GMM model  
  
px = gmm(Data_fea,K);  
[~, cls_ind] = max(px,[],1); %cls_ind = cluster label   
Accuracy = cal_accuracy(cls_ind, gnd_label);  
  
    function [acc] = cal_accuracy(gnd,estimate_label)  
        res = bestMap(gnd,estimate_label);  
        acc = length(find(gnd == res))/length(gnd);  
    end  
  
end  