% @Author: Emerson de Lemmus
% @Course: COSC 5340
% @Due Date: 6/20/2021

% Step 1: Read the attached RGB image 'untitled.png'
    RGB_Peppers = imread('untitled.png')
    figure
    imshow(RGB_Peppers)

% Step 2: Convert RGB_Peppers image to grayscale and binary - and save

    % Grayscale
    grayScale_Peppers = rgb2gray(RGB_Peppers)
    figure
    imshow(grayScale_Peppers)
    % Save image
    imwrite(grayScale_Peppers,"grayScalePeppers.png")


    % Binary
    binary_Peppers = im2bw(RGB_Peppers);
    figure
    imshow(binary_Peppers);
    imwrite(binary_Peppers,"binaryPeppers.png");

    
% Step 3: Extract metadata (Height, Width, BitDepth, ColorType) 
    
    %Extracting 'all the data'
    imageInfo = imfinfo('untitled.png')
    % Specifically extracting these metadatas
    imageHeight = imageInfo.Height;
    imageWidth = imageInfo.Width;
    imageBitDepth = imageInfo.BitDepth;
    imageColorType = imageInfo.ColorType;
    
   
% Step 4: Show the histogram of the image (Use Grayscale or Indexed image)
    figure
    imhist(grayScale_Peppers);

% Step 5: Smooth the image with Gaussian
    Gaussian_Filter_1 = imgaussfilt(RGB_Peppers,5);
    Gaussian_Filter_2 = imgaussfilt(RGB_Peppers,50);
    Gaussian_Filter_3 = imgaussfilt(RGB_Peppers,100);
    figure
    montage({RGB_Peppers,Gaussian_Filter_1, Gaussian_Filter_2,Gaussian_Filter_3});
    title('Original Image (Left) Vs. Gaussian Filtered Image (Right)');
    
% Step 6: Calcualte the gradient magnitude and direction using the directional
% gradient

    %Calculate the x- and y-directional gradients
    [Gx,Gy] = imgradientxy(grayScale_Peppers);

    %Calculate the gradient magnitude and direction using the directional gradients
    [Gmag,Gdir] = imgradient(Gx,Gy);
    figure

    imshowpair(Gmag,Gdir,'montage');
    title('Gradient Magnitude (Left) and Gradient Direction (Right)')
  
% Step 7: Add some salt and pepper noise
    
    Noise_Image_1 = imnoise(RGB_Peppers,'salt & pepper',0.05);
    Noise_Image_2 = imnoise(RGB_Peppers,'salt & pepper',0.10);
    Noise_Image_3 = imnoise(RGB_Peppers,'salt & pepper',0.15);
    Noise_Image_4 = imnoise(RGB_Peppers,'salt & pepper',0.99);

    figure
    montage({Noise_Image_1, Noise_Image_2, Noise_Image_3, Noise_Image_4});
    title('Adding noise with different intensitites');
  
% Step 8: Use Canny edge and Sobel for edge detection of that image
    BW1 = edge(binary_Peppers,'Canny');
    BW2 = edge(binary_Peppers,'Sobel');
    figure
    imshowpair(BW1,BW2,'montage');
    title('Canny and Sobel using Binary Image')

    
    BW3 = edge(grayScale_Peppers,'Canny');
    BW4 = edge(grayScale_Peppers,'Sobel');
    figure
    imshowpair(BW3,BW4,'montage');
    title('Canny and Sobel using Gray Scale Image')
