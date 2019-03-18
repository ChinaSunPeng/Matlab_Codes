function dispFeatures(im1,im2,fp1,fp2,matches,type)
%-------------------------------------------------------------------------%
%DESCRIPTION:
%   Horizontally show two images in a figure, with the feature points(FP) 
%   and the corresponding relations between points.
%INPUT:
%   im1:      The first image.
%   im2:      The second image.
%   fp1:      N FPs on im1, in a N*2 vector, each row for a position (x,y).
%   fp2:      M FPs on im2, in a M*2 vector.
%   matches:  K corresponding pairs, in a K*2 vector, each row contains
%             (idx1, idx2), indicates the point index in fp1 and fp2.
%   type:     different dispaly contents
%               -'all'             All FPs with lines connecting 
%                                  corresponding FPs.
%               -'matched_line'    Only matched points with lines.
%               -'matched_noline'  Only matched points.
%OUTPUT:
%   NONE
%USAGE:
%   display_two_image_with_FP(im1,im2,fp1,fp2,matches)
%Author: 
%   SUN Peng
%Last Modified:
%   2019,Mar,18
%-------------------------------------------------------------------------%

% input format regulation

if size(fp1,1)<length(fp1) && size(fp1,1)==2
    fp1=fp1';
end
if size(fp2,1)<length(fp2) && size(fp1,2)==2
    fp2=fp2';
end
if size(matches,1)<length(matches) && size(matches,1)==2
    matches=matches';
end

im=[im1,im2];
fp2(:,1)=fp2(:,1)+size(im1,2);
figure();
imshow(im);
hold();
switch type
    case 'all'
        plot(fp1(:,1),fp1(:,2),'o');
        plot(fp2(:,1),fp2(:,2),'o');
        for k=1:size(matches,1)
            plot([fp1(matches(k,1),1),fp2(matches(k,2),1)],[fp1(matches(k,1),2),fp2(matches(k,2),2)]);
        end
    case 'matched_line'
        plot(fp1(matches(:,1),1),fp1(matches(:,1),2),'o');
        plot(fp2(matches(:,2),1),fp2(matches(:,2),2),'o');
        for k=1:size(matches,1)
            plot([fp1(matches(k,1),1),fp2(matches(k,2),1)],[fp1(matches(k,1),2),fp2(matches(k,2),2)]);
        end
    case 'matched_noline'
        plot(fp1(matches(:,1),1),fp1(matches(:,1),2),'o');
        plot(fp2(matches(:,2),1),fp2(matches(:,2),2),'o');
end
