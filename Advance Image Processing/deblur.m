function varargout = deblur(varargin)
% DEBLUR MATLAB code for deblur.fig
%      DEBLUR, by itself, creates a new DEBLUR or raises the existing
%      singleton*.
%
%      H = DEBLUR returns the handle to a new DEBLUR or the handle to
%      the existing singleton*.
%
%      DEBLUR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEBLUR.M with the given input arguments.
%
%      DEBLUR('Property','Value',...) creates a new DEBLUR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before deblur_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to deblur_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help deblur

% Last Modified by GUIDE v2.5 17-Mar-2019 22:45:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @deblur_OpeningFcn, ...
                   'gui_OutputFcn',  @deblur_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before deblur is made visible.
function deblur_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to deblur (see VARARGIN)

% Choose default command line output for deblur
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes deblur wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = deblur_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global a
[FileName,FilePath]=uigetfile('*.*','SELECT IMAGE');
name=strcat(FilePath,FileName);
a=imread(name);
axes(handles.axes1);
imshow(a)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global a
%image preprocessing
y = rgb2gray(a);
y = im2double(y); 
 
%take disk psf
PSF = fspecial('disk', 8);
 
%convolve image with psf
%or use imfilter w/ 'conv'
yblur = conv2(y,PSF); 
 

 
%add noise at different levels to the blurred image
y2BlurredNoisy = imnoise(yblur,'gaussian',0,.0000000000001);
y3BlurredNoisy = imnoise(yblur,'gaussian',0,.00000000001);
y4BlurredNoisy = imnoise(yblur, 'gaussian', 0,.000001); 
 
%plot different noisy blurred images
figure(); 
subplot(2,4,1); imshow(yblur); title('ORIGINALS: no noise');
subplot(2,4,2); imshow(y2BlurredNoisy); title('Blur Gaussian white noise of 10^{-13}'); 
subplot(2,4,3); imshow(y3BlurredNoisy); title('Blur Gaussian white noise of 10^{-11}');
subplot(2,4,4); imshow(y4BlurredNoisy); title('Blur Gaussian white noise of 10^{-6}');
 
%use simple X = Y/H to get back original image
%show how much noise affects it
Y1 = fft2(yblur); 
Y2 = fft2(y2BlurredNoisy);
Y3 = fft2(y3BlurredNoisy); 
Y4 = fft2(y4BlurredNoisy); 
 
%zero pad the psf to match the size of the blurred image
%noisy images are all the same size, thus do not require unique PSF's
newh = zeros(size(yblur)); 
psfsize = size(PSF); 
newh(1: psfsize(1), 1:psfsize(2))= PSF;
H = fft2(newh); 
 
%use simple X = Y/H to get back original image
%show how much noise affects it
y1deblurred = ifft2(Y1./H);
y2deblurred = ifft2(Y2./H); 
y3deblurred = ifft2(Y3./H); 
y4deblurred = ifft2(Y4./H); 
 

%plot deblurred images
subplot(2,4,5);imshow(y1deblurred);title('no noise');
subplot(2,4,6);imshow(y2deblurred);title('Deblur Gaussian white noise of 10^{-13}');
subplot(2,4,7);imshow(y3deblurred);title('Deblur Gaussian white noise of 10^{-11}');
subplot(2,4,8);imshow(y4deblurred);title('Deblur Gaussian white noise of 10^{-6}');
 


% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
