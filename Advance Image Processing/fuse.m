function varargout = fuse(varargin)
% FUSE MATLAB code for fuse.fig
%      FUSE, by itself, creates a new FUSE or raises the existing
%      singleton*.
%
%      H = FUSE returns the handle to a new FUSE or the handle to
%      the existing singleton*.
%
%      FUSE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FUSE.M with the given input arguments.
%
%      FUSE('Property','Value',...) creates a new FUSE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fuse_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fuse_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fuse

% Last Modified by GUIDE v2.5 16-Mar-2019 00:03:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fuse_OpeningFcn, ...
                   'gui_OutputFcn',  @fuse_OutputFcn, ...
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


% --- Executes just before fuse is made visible.
function fuse_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fuse (see VARARGIN)

% Choose default command line output for fuse
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fuse wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fuse_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global fuse1
[name,path]=uigetfile('*.*','Select Image 1')
name=strcat(path,name);
fuse1=imread(name);
axes(handles.axes1);
imshow(fuse1)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global fuse2
[name2,path2]=uigetfile('*.*','Select Image 1')
name2=strcat(path2,name2);
fuse2=imread(name2);
axes(handles.axes2);
imshow(fuse2)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global fuse1
global fuse2
imrotate(fuse2);
fuse = imfuse(fuse1,fuse2,'blend','Scaling','joint');
axes(handles.axes3);
imshow(fuse)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
